// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream_quality_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StreamQualityInfo {
  /// Quality label (e.g., "1080p", "720p 60fps", "360p")
  String get label => throw _privateConstructorUsedError;

  /// Numeric resolution value (e.g., 1080, 720, 360)
  int get resolution => throw _privateConstructorUsedError;

  /// Frame rate (null if standard 30fps or less)
  int? get fps => throw _privateConstructorUsedError;

  /// Video format (MP4, WEBM, etc.)
  String? get format => throw _privateConstructorUsedError;

  /// Whether this quality requires stream merging (video-only + audio)
  bool get requiresMerging => throw _privateConstructorUsedError;

  /// Whether this is a video-only stream (no audio)
  bool get isVideoOnly => throw _privateConstructorUsedError;

  /// The video stream for this quality
  NewPipeVideoStream? get videoStream => throw _privateConstructorUsedError;

  /// The audio stream (if merging is required)
  NewPipeAudioStream? get audioStream => throw _privateConstructorUsedError;

  /// Create a copy of StreamQualityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StreamQualityInfoCopyWith<StreamQualityInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreamQualityInfoCopyWith<$Res> {
  factory $StreamQualityInfoCopyWith(
          StreamQualityInfo value, $Res Function(StreamQualityInfo) then) =
      _$StreamQualityInfoCopyWithImpl<$Res, StreamQualityInfo>;
  @useResult
  $Res call(
      {String label,
      int resolution,
      int? fps,
      String? format,
      bool requiresMerging,
      bool isVideoOnly,
      NewPipeVideoStream? videoStream,
      NewPipeAudioStream? audioStream});
}

/// @nodoc
class _$StreamQualityInfoCopyWithImpl<$Res, $Val extends StreamQualityInfo>
    implements $StreamQualityInfoCopyWith<$Res> {
  _$StreamQualityInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StreamQualityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? resolution = null,
    Object? fps = freezed,
    Object? format = freezed,
    Object? requiresMerging = null,
    Object? isVideoOnly = null,
    Object? videoStream = freezed,
    Object? audioStream = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as int,
      fps: freezed == fps
          ? _value.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as int?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresMerging: null == requiresMerging
          ? _value.requiresMerging
          : requiresMerging // ignore: cast_nullable_to_non_nullable
              as bool,
      isVideoOnly: null == isVideoOnly
          ? _value.isVideoOnly
          : isVideoOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      videoStream: freezed == videoStream
          ? _value.videoStream
          : videoStream // ignore: cast_nullable_to_non_nullable
              as NewPipeVideoStream?,
      audioStream: freezed == audioStream
          ? _value.audioStream
          : audioStream // ignore: cast_nullable_to_non_nullable
              as NewPipeAudioStream?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StreamQualityInfoImplCopyWith<$Res>
    implements $StreamQualityInfoCopyWith<$Res> {
  factory _$$StreamQualityInfoImplCopyWith(_$StreamQualityInfoImpl value,
          $Res Function(_$StreamQualityInfoImpl) then) =
      __$$StreamQualityInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      int resolution,
      int? fps,
      String? format,
      bool requiresMerging,
      bool isVideoOnly,
      NewPipeVideoStream? videoStream,
      NewPipeAudioStream? audioStream});
}

/// @nodoc
class __$$StreamQualityInfoImplCopyWithImpl<$Res>
    extends _$StreamQualityInfoCopyWithImpl<$Res, _$StreamQualityInfoImpl>
    implements _$$StreamQualityInfoImplCopyWith<$Res> {
  __$$StreamQualityInfoImplCopyWithImpl(_$StreamQualityInfoImpl _value,
      $Res Function(_$StreamQualityInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of StreamQualityInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? resolution = null,
    Object? fps = freezed,
    Object? format = freezed,
    Object? requiresMerging = null,
    Object? isVideoOnly = null,
    Object? videoStream = freezed,
    Object? audioStream = freezed,
  }) {
    return _then(_$StreamQualityInfoImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      resolution: null == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as int,
      fps: freezed == fps
          ? _value.fps
          : fps // ignore: cast_nullable_to_non_nullable
              as int?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresMerging: null == requiresMerging
          ? _value.requiresMerging
          : requiresMerging // ignore: cast_nullable_to_non_nullable
              as bool,
      isVideoOnly: null == isVideoOnly
          ? _value.isVideoOnly
          : isVideoOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      videoStream: freezed == videoStream
          ? _value.videoStream
          : videoStream // ignore: cast_nullable_to_non_nullable
              as NewPipeVideoStream?,
      audioStream: freezed == audioStream
          ? _value.audioStream
          : audioStream // ignore: cast_nullable_to_non_nullable
              as NewPipeAudioStream?,
    ));
  }
}

/// @nodoc

class _$StreamQualityInfoImpl extends _StreamQualityInfo {
  const _$StreamQualityInfoImpl(
      {required this.label,
      required this.resolution,
      this.fps,
      this.format,
      required this.requiresMerging,
      required this.isVideoOnly,
      this.videoStream,
      this.audioStream})
      : super._();

  /// Quality label (e.g., "1080p", "720p 60fps", "360p")
  @override
  final String label;

  /// Numeric resolution value (e.g., 1080, 720, 360)
  @override
  final int resolution;

  /// Frame rate (null if standard 30fps or less)
  @override
  final int? fps;

  /// Video format (MP4, WEBM, etc.)
  @override
  final String? format;

  /// Whether this quality requires stream merging (video-only + audio)
  @override
  final bool requiresMerging;

  /// Whether this is a video-only stream (no audio)
  @override
  final bool isVideoOnly;

  /// The video stream for this quality
  @override
  final NewPipeVideoStream? videoStream;

  /// The audio stream (if merging is required)
  @override
  final NewPipeAudioStream? audioStream;

  @override
  String toString() {
    return 'StreamQualityInfo(label: $label, resolution: $resolution, fps: $fps, format: $format, requiresMerging: $requiresMerging, isVideoOnly: $isVideoOnly, videoStream: $videoStream, audioStream: $audioStream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StreamQualityInfoImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.fps, fps) || other.fps == fps) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.requiresMerging, requiresMerging) ||
                other.requiresMerging == requiresMerging) &&
            (identical(other.isVideoOnly, isVideoOnly) ||
                other.isVideoOnly == isVideoOnly) &&
            (identical(other.videoStream, videoStream) ||
                other.videoStream == videoStream) &&
            (identical(other.audioStream, audioStream) ||
                other.audioStream == audioStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, resolution, fps, format,
      requiresMerging, isVideoOnly, videoStream, audioStream);

  /// Create a copy of StreamQualityInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StreamQualityInfoImplCopyWith<_$StreamQualityInfoImpl> get copyWith =>
      __$$StreamQualityInfoImplCopyWithImpl<_$StreamQualityInfoImpl>(
          this, _$identity);
}

abstract class _StreamQualityInfo extends StreamQualityInfo {
  const factory _StreamQualityInfo(
      {required final String label,
      required final int resolution,
      final int? fps,
      final String? format,
      required final bool requiresMerging,
      required final bool isVideoOnly,
      final NewPipeVideoStream? videoStream,
      final NewPipeAudioStream? audioStream}) = _$StreamQualityInfoImpl;
  const _StreamQualityInfo._() : super._();

  /// Quality label (e.g., "1080p", "720p 60fps", "360p")
  @override
  String get label;

  /// Numeric resolution value (e.g., 1080, 720, 360)
  @override
  int get resolution;

  /// Frame rate (null if standard 30fps or less)
  @override
  int? get fps;

  /// Video format (MP4, WEBM, etc.)
  @override
  String? get format;

  /// Whether this quality requires stream merging (video-only + audio)
  @override
  bool get requiresMerging;

  /// Whether this is a video-only stream (no audio)
  @override
  bool get isVideoOnly;

  /// The video stream for this quality
  @override
  NewPipeVideoStream? get videoStream;

  /// The audio stream (if merging is required)
  @override
  NewPipeAudioStream? get audioStream;

  /// Create a copy of StreamQualityInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StreamQualityInfoImplCopyWith<_$StreamQualityInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
