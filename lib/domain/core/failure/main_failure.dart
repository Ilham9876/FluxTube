import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  /// Network connectivity error (no internet, DNS failure, etc.)
  const factory MainFailure.networkError({String? message}) = _NetworkError;

  /// Server returned an error response
  const factory MainFailure.serverError({int? statusCode, String? message}) = _ServerError;

  /// Resource not found (404)
  const factory MainFailure.notFound({String? resource}) = _NotFound;

  /// Failed to parse response data
  const factory MainFailure.parseError({String? message}) = _ParseError;

  /// Rate limited by the API
  const factory MainFailure.rateLimited({int? retryAfter}) = _RateLimited;

  /// Connection timeout
  const factory MainFailure.timeout({String? message}) = _Timeout;

  /// Unknown/unhandled error
  const factory MainFailure.unknown({String? message}) = _Unknown;

  // Legacy aliases for backward compatibility
  /// @Deprecated('Use networkError or timeout instead')
  const factory MainFailure.clientFailure() = _ClientFailure;

  /// @Deprecated('Use serverError instead')
  const factory MainFailure.serverFailure() = _ServerFailure;
}
