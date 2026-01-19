// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_thumbnail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageThumbnail _$ImageThumbnailFromJson(Map<String, dynamic> json) {
  return _ImageThumbnail.fromJson(json);
}

/// @nodoc
mixin _$ImageThumbnail {
  String? get url => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;

  /// Only used for video thumbnails (quality: default, medium, high, etc.)
  String? get quality => throw _privateConstructorUsedError;

  /// Serializes this ImageThumbnail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageThumbnailCopyWith<ImageThumbnail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageThumbnailCopyWith<$Res> {
  factory $ImageThumbnailCopyWith(
          ImageThumbnail value, $Res Function(ImageThumbnail) then) =
      _$ImageThumbnailCopyWithImpl<$Res, ImageThumbnail>;
  @useResult
  $Res call({String? url, int? width, int? height, String? quality});
}

/// @nodoc
class _$ImageThumbnailCopyWithImpl<$Res, $Val extends ImageThumbnail>
    implements $ImageThumbnailCopyWith<$Res> {
  _$ImageThumbnailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? quality = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      quality: freezed == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageThumbnailImplCopyWith<$Res>
    implements $ImageThumbnailCopyWith<$Res> {
  factory _$$ImageThumbnailImplCopyWith(_$ImageThumbnailImpl value,
          $Res Function(_$ImageThumbnailImpl) then) =
      __$$ImageThumbnailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url, int? width, int? height, String? quality});
}

/// @nodoc
class __$$ImageThumbnailImplCopyWithImpl<$Res>
    extends _$ImageThumbnailCopyWithImpl<$Res, _$ImageThumbnailImpl>
    implements _$$ImageThumbnailImplCopyWith<$Res> {
  __$$ImageThumbnailImplCopyWithImpl(
      _$ImageThumbnailImpl _value, $Res Function(_$ImageThumbnailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImageThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? quality = freezed,
  }) {
    return _then(_$ImageThumbnailImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      quality: freezed == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageThumbnailImpl implements _ImageThumbnail {
  const _$ImageThumbnailImpl({this.url, this.width, this.height, this.quality});

  factory _$ImageThumbnailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageThumbnailImplFromJson(json);

  @override
  final String? url;
  @override
  final int? width;
  @override
  final int? height;

  /// Only used for video thumbnails (quality: default, medium, high, etc.)
  @override
  final String? quality;

  @override
  String toString() {
    return 'ImageThumbnail(url: $url, width: $width, height: $height, quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageThumbnailImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, width, height, quality);

  /// Create a copy of ImageThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageThumbnailImplCopyWith<_$ImageThumbnailImpl> get copyWith =>
      __$$ImageThumbnailImplCopyWithImpl<_$ImageThumbnailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageThumbnailImplToJson(
      this,
    );
  }
}

abstract class _ImageThumbnail implements ImageThumbnail {
  const factory _ImageThumbnail(
      {final String? url,
      final int? width,
      final int? height,
      final String? quality}) = _$ImageThumbnailImpl;

  factory _ImageThumbnail.fromJson(Map<String, dynamic> json) =
      _$ImageThumbnailImpl.fromJson;

  @override
  String? get url;
  @override
  int? get width;
  @override
  int? get height;

  /// Only used for video thumbnails (quality: default, medium, high, etc.)
  @override
  String? get quality;

  /// Create a copy of ImageThumbnail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageThumbnailImplCopyWith<_$ImageThumbnailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
