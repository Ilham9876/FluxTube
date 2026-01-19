// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainFailureCopyWith<$Res> {
  factory $MainFailureCopyWith(
          MainFailure value, $Res Function(MainFailure) then) =
      _$MainFailureCopyWithImpl<$Res, MainFailure>;
}

/// @nodoc
class _$MainFailureCopyWithImpl<$Res, $Val extends MainFailure>
    implements $MainFailureCopyWith<$Res> {
  _$MainFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NetworkErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkErrorImpl implements _NetworkError {
  const _$NetworkErrorImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'MainFailure.networkError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) {
    return networkError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) {
    return networkError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class _NetworkError implements MainFailure {
  const factory _NetworkError({final String? message}) = _$NetworkErrorImpl;

  String? get message;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? statusCode, String? message});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ServerErrorImpl(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl implements _ServerError {
  const _$ServerErrorImpl({this.statusCode, this.message});

  @override
  final int? statusCode;
  @override
  final String? message;

  @override
  String toString() {
    return 'MainFailure.serverError(statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) {
    return serverError(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) {
    return serverError?.call(statusCode, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(statusCode, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements MainFailure {
  const factory _ServerError({final int? statusCode, final String? message}) =
      _$ServerErrorImpl;

  int? get statusCode;
  String? get message;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? resource});
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resource = freezed,
  }) {
    return _then(_$NotFoundImpl(
      resource: freezed == resource
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotFoundImpl implements _NotFound {
  const _$NotFoundImpl({this.resource});

  @override
  final String? resource;

  @override
  String toString() {
    return 'MainFailure.notFound(resource: $resource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundImpl &&
            (identical(other.resource, resource) ||
                other.resource == resource));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resource);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      __$$NotFoundImplCopyWithImpl<_$NotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) {
    return notFound(resource);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) {
    return notFound?.call(resource);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(resource);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements MainFailure {
  const factory _NotFound({final String? resource}) = _$NotFoundImpl;

  String? get resource;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParseErrorImplCopyWith<$Res> {
  factory _$$ParseErrorImplCopyWith(
          _$ParseErrorImpl value, $Res Function(_$ParseErrorImpl) then) =
      __$$ParseErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ParseErrorImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$ParseErrorImpl>
    implements _$$ParseErrorImplCopyWith<$Res> {
  __$$ParseErrorImplCopyWithImpl(
      _$ParseErrorImpl _value, $Res Function(_$ParseErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ParseErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ParseErrorImpl implements _ParseError {
  const _$ParseErrorImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'MainFailure.parseError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParseErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParseErrorImplCopyWith<_$ParseErrorImpl> get copyWith =>
      __$$ParseErrorImplCopyWithImpl<_$ParseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) {
    return parseError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) {
    return parseError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (parseError != null) {
      return parseError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return parseError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) {
    return parseError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (parseError != null) {
      return parseError(this);
    }
    return orElse();
  }
}

abstract class _ParseError implements MainFailure {
  const factory _ParseError({final String? message}) = _$ParseErrorImpl;

  String? get message;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParseErrorImplCopyWith<_$ParseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RateLimitedImplCopyWith<$Res> {
  factory _$$RateLimitedImplCopyWith(
          _$RateLimitedImpl value, $Res Function(_$RateLimitedImpl) then) =
      __$$RateLimitedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? retryAfter});
}

/// @nodoc
class __$$RateLimitedImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$RateLimitedImpl>
    implements _$$RateLimitedImplCopyWith<$Res> {
  __$$RateLimitedImplCopyWithImpl(
      _$RateLimitedImpl _value, $Res Function(_$RateLimitedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retryAfter = freezed,
  }) {
    return _then(_$RateLimitedImpl(
      retryAfter: freezed == retryAfter
          ? _value.retryAfter
          : retryAfter // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$RateLimitedImpl implements _RateLimited {
  const _$RateLimitedImpl({this.retryAfter});

  @override
  final int? retryAfter;

  @override
  String toString() {
    return 'MainFailure.rateLimited(retryAfter: $retryAfter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RateLimitedImpl &&
            (identical(other.retryAfter, retryAfter) ||
                other.retryAfter == retryAfter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, retryAfter);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RateLimitedImplCopyWith<_$RateLimitedImpl> get copyWith =>
      __$$RateLimitedImplCopyWithImpl<_$RateLimitedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) {
    return rateLimited(retryAfter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) {
    return rateLimited?.call(retryAfter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (rateLimited != null) {
      return rateLimited(retryAfter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return rateLimited(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) {
    return rateLimited?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (rateLimited != null) {
      return rateLimited(this);
    }
    return orElse();
  }
}

abstract class _RateLimited implements MainFailure {
  const factory _RateLimited({final int? retryAfter}) = _$RateLimitedImpl;

  int? get retryAfter;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RateLimitedImplCopyWith<_$RateLimitedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutImplCopyWith<$Res> {
  factory _$$TimeoutImplCopyWith(
          _$TimeoutImpl value, $Res Function(_$TimeoutImpl) then) =
      __$$TimeoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$TimeoutImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$TimeoutImpl>
    implements _$$TimeoutImplCopyWith<$Res> {
  __$$TimeoutImplCopyWithImpl(
      _$TimeoutImpl _value, $Res Function(_$TimeoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$TimeoutImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TimeoutImpl implements _Timeout {
  const _$TimeoutImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'MainFailure.timeout(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeoutImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeoutImplCopyWith<_$TimeoutImpl> get copyWith =>
      __$$TimeoutImplCopyWithImpl<_$TimeoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) {
    return timeout(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) {
    return timeout?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _Timeout implements MainFailure {
  const factory _Timeout({final String? message}) = _$TimeoutImpl;

  String? get message;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeoutImplCopyWith<_$TimeoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnknownImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnknownImpl implements _Unknown {
  const _$UnknownImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'MainFailure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      __$$UnknownImplCopyWithImpl<_$UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements MainFailure {
  const factory _Unknown({final String? message}) = _$UnknownImpl;

  String? get message;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClientFailureImplCopyWith<$Res> {
  factory _$$ClientFailureImplCopyWith(
          _$ClientFailureImpl value, $Res Function(_$ClientFailureImpl) then) =
      __$$ClientFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClientFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$ClientFailureImpl>
    implements _$$ClientFailureImplCopyWith<$Res> {
  __$$ClientFailureImplCopyWithImpl(
      _$ClientFailureImpl _value, $Res Function(_$ClientFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClientFailureImpl implements _ClientFailure {
  const _$ClientFailureImpl();

  @override
  String toString() {
    return 'MainFailure.clientFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClientFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) {
    return clientFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) {
    return clientFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (clientFailure != null) {
      return clientFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return clientFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) {
    return clientFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (clientFailure != null) {
      return clientFailure(this);
    }
    return orElse();
  }
}

abstract class _ClientFailure implements MainFailure {
  const factory _ClientFailure() = _$ClientFailureImpl;
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ServerFailureImpl implements _ServerFailure {
  const _$ServerFailureImpl();

  @override
  String toString() {
    return 'MainFailure.serverFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) networkError,
    required TResult Function(int? statusCode, String? message) serverError,
    required TResult Function(String? resource) notFound,
    required TResult Function(String? message) parseError,
    required TResult Function(int? retryAfter) rateLimited,
    required TResult Function(String? message) timeout,
    required TResult Function(String? message) unknown,
    required TResult Function() clientFailure,
    required TResult Function() serverFailure,
  }) {
    return serverFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? networkError,
    TResult? Function(int? statusCode, String? message)? serverError,
    TResult? Function(String? resource)? notFound,
    TResult? Function(String? message)? parseError,
    TResult? Function(int? retryAfter)? rateLimited,
    TResult? Function(String? message)? timeout,
    TResult? Function(String? message)? unknown,
    TResult? Function()? clientFailure,
    TResult? Function()? serverFailure,
  }) {
    return serverFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? networkError,
    TResult Function(int? statusCode, String? message)? serverError,
    TResult Function(String? resource)? notFound,
    TResult Function(String? message)? parseError,
    TResult Function(int? retryAfter)? rateLimited,
    TResult Function(String? message)? timeout,
    TResult Function(String? message)? unknown,
    TResult Function()? clientFailure,
    TResult Function()? serverFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NetworkError value) networkError,
    required TResult Function(_ServerError value) serverError,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_ParseError value) parseError,
    required TResult Function(_RateLimited value) rateLimited,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unknown value) unknown,
    required TResult Function(_ClientFailure value) clientFailure,
    required TResult Function(_ServerFailure value) serverFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NetworkError value)? networkError,
    TResult? Function(_ServerError value)? serverError,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_ParseError value)? parseError,
    TResult? Function(_RateLimited value)? rateLimited,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unknown value)? unknown,
    TResult? Function(_ClientFailure value)? clientFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NetworkError value)? networkError,
    TResult Function(_ServerError value)? serverError,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_ParseError value)? parseError,
    TResult Function(_RateLimited value)? rateLimited,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unknown value)? unknown,
    TResult Function(_ClientFailure value)? clientFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class _ServerFailure implements MainFailure {
  const factory _ServerFailure() = _$ServerFailureImpl;
}
