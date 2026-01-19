import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';

/// Centralized API client with retry logic, timeout handling, and error conversion
class ApiClient {
  static ApiClient? _instance;
  late final Dio _dio;

  ApiClient._() {
    _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      followRedirects: false,
      validateStatus: (status) => true, // Handle all status codes manually
    ));
  }

  /// Get singleton instance
  static ApiClient get instance {
    _instance ??= ApiClient._();
    return _instance!;
  }

  /// Perform a GET request with automatic error handling
  ///
  /// Returns [Either<MainFailure, T>] where T is the parsed response
  Future<Either<MainFailure, T>> get<T>({
    required String url,
    required T Function(dynamic data) parser,
    Map<String, dynamic>? queryParameters,
    int maxRetries = 1,
  }) async {
    int attempts = 0;

    while (attempts < maxRetries) {
      attempts++;

      try {
        final response = await _dio.get(
          url,
          queryParameters: queryParameters,
        );

        return _handleResponse(response, parser, url);
      } on DioException catch (e) {
        log('DioException on $url (attempt $attempts): ${e.type}');

        // If we have retries left and it's a retriable error, continue
        if (attempts < maxRetries && _isRetriableError(e)) {
          await Future.delayed(Duration(milliseconds: 500 * attempts));
          continue;
        }

        return Left(_mapDioException(e));
      } catch (e) {
        log('Unknown error on $url: $e');
        return Left(MainFailure.unknown(message: e.toString()));
      }
    }

    // Should never reach here, but just in case
    return const Left(MainFailure.unknown());
  }

  /// Handle response and convert to Either
  Either<MainFailure, T> _handleResponse<T>(
    Response response,
    T Function(dynamic data) parser,
    String url,
  ) {
    final statusCode = response.statusCode ?? 0;

    if (statusCode >= 200 && statusCode < 300) {
      try {
        return Right(parser(response.data));
      } catch (e) {
        log('Parse error on $url: $e');
        return Left(MainFailure.parseError(message: e.toString()));
      }
    } else if (statusCode == 404) {
      log('Not found: $url');
      return Left(MainFailure.notFound(resource: url));
    } else if (statusCode == 429) {
      final retryAfter = int.tryParse(
        response.headers.value('retry-after') ?? '',
      );
      log('Rate limited on $url');
      return Left(MainFailure.rateLimited(retryAfter: retryAfter));
    } else if (statusCode >= 500) {
      log('Server error on $url: $statusCode');
      return Left(MainFailure.serverError(
        statusCode: statusCode,
        message: 'Server error',
      ));
    } else {
      log('Error on $url: $statusCode');
      return Left(MainFailure.serverError(
        statusCode: statusCode,
        message: response.statusMessage,
      ));
    }
  }

  /// Check if error is retriable
  bool _isRetriableError(DioException e) {
    return e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.connectionError;
  }

  /// Convert DioException to MainFailure
  MainFailure _mapDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return MainFailure.timeout(message: e.message);

      case DioExceptionType.connectionError:
        return MainFailure.networkError(message: e.message);

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 404) {
          return const MainFailure.notFound();
        } else if (statusCode == 429) {
          return const MainFailure.rateLimited();
        }
        return MainFailure.serverError(
          statusCode: statusCode,
          message: e.message,
        );

      case DioExceptionType.cancel:
        return MainFailure.unknown(message: 'Request cancelled');

      case DioExceptionType.badCertificate:
        return MainFailure.networkError(message: 'Certificate error');

      case DioExceptionType.unknown:
        return MainFailure.unknown(message: e.message);
    }
  }

  /// Close the Dio client (call when app is disposed)
  void close() {
    _dio.close();
    _instance = null;
  }
}

/// Extension to simplify API calls that return lists
extension ApiClientListExtension on ApiClient {
  /// GET request that parses response as a list
  Future<Either<MainFailure, List<T>>> getList<T>({
    required String url,
    required T Function(Map<String, dynamic> json) itemParser,
    Map<String, dynamic>? queryParameters,
    int maxRetries = 1,
  }) {
    return get(
      url: url,
      queryParameters: queryParameters,
      maxRetries: maxRetries,
      parser: (data) {
        if (data is List) {
          return data.map((item) => itemParser(item as Map<String, dynamic>)).toList();
        }
        throw FormatException('Expected list but got ${data.runtimeType}');
      },
    );
  }
}
