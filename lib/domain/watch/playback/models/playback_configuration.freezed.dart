// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playback_configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlaybackConfiguration {
  /// Type of media source
  MediaSourceType get sourceType => throw _privateConstructorUsedError;

  /// Quality label (e.g., "1080p", "720p 60fps")
  String get qualityLabel => throw _privateConstructorUsedError;

  /// Video URL (for progressive or merging)
  String? get videoUrl => throw _privateConstructorUsedError;

  /// Audio URL (for merging only)
  String? get audioUrl => throw _privateConstructorUsedError;

  /// Manifest URL (for HLS or DASH)
  String? get manifestUrl => throw _privateConstructorUsedError;

  /// Subtitle tracks
  List<NewPipeSubtitle> get subtitles => throw _privateConstructorUsedError;

  /// HTTP headers (if needed)
  Map<String, String> get headers => throw _privateConstructorUsedError;

  /// Whether this is a live stream
  bool get isLive => throw _privateConstructorUsedError;

  /// Create a copy of PlaybackConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaybackConfigurationCopyWith<PlaybackConfiguration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaybackConfigurationCopyWith<$Res> {
  factory $PlaybackConfigurationCopyWith(PlaybackConfiguration value,
          $Res Function(PlaybackConfiguration) then) =
      _$PlaybackConfigurationCopyWithImpl<$Res, PlaybackConfiguration>;
  @useResult
  $Res call(
      {MediaSourceType sourceType,
      String qualityLabel,
      String? videoUrl,
      String? audioUrl,
      String? manifestUrl,
      List<NewPipeSubtitle> subtitles,
      Map<String, String> headers,
      bool isLive});
}

/// @nodoc
class _$PlaybackConfigurationCopyWithImpl<$Res,
        $Val extends PlaybackConfiguration>
    implements $PlaybackConfigurationCopyWith<$Res> {
  _$PlaybackConfigurationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlaybackConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceType = null,
    Object? qualityLabel = null,
    Object? videoUrl = freezed,
    Object? audioUrl = freezed,
    Object? manifestUrl = freezed,
    Object? subtitles = null,
    Object? headers = null,
    Object? isLive = null,
  }) {
    return _then(_value.copyWith(
      sourceType: null == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as MediaSourceType,
      qualityLabel: null == qualityLabel
          ? _value.qualityLabel
          : qualityLabel // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      manifestUrl: freezed == manifestUrl
          ? _value.manifestUrl
          : manifestUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitles: null == subtitles
          ? _value.subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<NewPipeSubtitle>,
      headers: null == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaybackConfigurationImplCopyWith<$Res>
    implements $PlaybackConfigurationCopyWith<$Res> {
  factory _$$PlaybackConfigurationImplCopyWith(
          _$PlaybackConfigurationImpl value,
          $Res Function(_$PlaybackConfigurationImpl) then) =
      __$$PlaybackConfigurationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MediaSourceType sourceType,
      String qualityLabel,
      String? videoUrl,
      String? audioUrl,
      String? manifestUrl,
      List<NewPipeSubtitle> subtitles,
      Map<String, String> headers,
      bool isLive});
}

/// @nodoc
class __$$PlaybackConfigurationImplCopyWithImpl<$Res>
    extends _$PlaybackConfigurationCopyWithImpl<$Res,
        _$PlaybackConfigurationImpl>
    implements _$$PlaybackConfigurationImplCopyWith<$Res> {
  __$$PlaybackConfigurationImplCopyWithImpl(_$PlaybackConfigurationImpl _value,
      $Res Function(_$PlaybackConfigurationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlaybackConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sourceType = null,
    Object? qualityLabel = null,
    Object? videoUrl = freezed,
    Object? audioUrl = freezed,
    Object? manifestUrl = freezed,
    Object? subtitles = null,
    Object? headers = null,
    Object? isLive = null,
  }) {
    return _then(_$PlaybackConfigurationImpl(
      sourceType: null == sourceType
          ? _value.sourceType
          : sourceType // ignore: cast_nullable_to_non_nullable
              as MediaSourceType,
      qualityLabel: null == qualityLabel
          ? _value.qualityLabel
          : qualityLabel // ignore: cast_nullable_to_non_nullable
              as String,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      audioUrl: freezed == audioUrl
          ? _value.audioUrl
          : audioUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      manifestUrl: freezed == manifestUrl
          ? _value.manifestUrl
          : manifestUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitles: null == subtitles
          ? _value._subtitles
          : subtitles // ignore: cast_nullable_to_non_nullable
              as List<NewPipeSubtitle>,
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      isLive: null == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlaybackConfigurationImpl extends _PlaybackConfiguration {
  const _$PlaybackConfigurationImpl(
      {required this.sourceType,
      required this.qualityLabel,
      this.videoUrl,
      this.audioUrl,
      this.manifestUrl,
      final List<NewPipeSubtitle> subtitles = const [],
      final Map<String, String> headers = const {},
      this.isLive = false})
      : _subtitles = subtitles,
        _headers = headers,
        super._();

  /// Type of media source
  @override
  final MediaSourceType sourceType;

  /// Quality label (e.g., "1080p", "720p 60fps")
  @override
  final String qualityLabel;

  /// Video URL (for progressive or merging)
  @override
  final String? videoUrl;

  /// Audio URL (for merging only)
  @override
  final String? audioUrl;

  /// Manifest URL (for HLS or DASH)
  @override
  final String? manifestUrl;

  /// Subtitle tracks
  final List<NewPipeSubtitle> _subtitles;

  /// Subtitle tracks
  @override
  @JsonKey()
  List<NewPipeSubtitle> get subtitles {
    if (_subtitles is EqualUnmodifiableListView) return _subtitles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtitles);
  }

  /// HTTP headers (if needed)
  final Map<String, String> _headers;

  /// HTTP headers (if needed)
  @override
  @JsonKey()
  Map<String, String> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  /// Whether this is a live stream
  @override
  @JsonKey()
  final bool isLive;

  @override
  String toString() {
    return 'PlaybackConfiguration(sourceType: $sourceType, qualityLabel: $qualityLabel, videoUrl: $videoUrl, audioUrl: $audioUrl, manifestUrl: $manifestUrl, subtitles: $subtitles, headers: $headers, isLive: $isLive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaybackConfigurationImpl &&
            (identical(other.sourceType, sourceType) ||
                other.sourceType == sourceType) &&
            (identical(other.qualityLabel, qualityLabel) ||
                other.qualityLabel == qualityLabel) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.audioUrl, audioUrl) ||
                other.audioUrl == audioUrl) &&
            (identical(other.manifestUrl, manifestUrl) ||
                other.manifestUrl == manifestUrl) &&
            const DeepCollectionEquality()
                .equals(other._subtitles, _subtitles) &&
            const DeepCollectionEquality().equals(other._headers, _headers) &&
            (identical(other.isLive, isLive) || other.isLive == isLive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sourceType,
      qualityLabel,
      videoUrl,
      audioUrl,
      manifestUrl,
      const DeepCollectionEquality().hash(_subtitles),
      const DeepCollectionEquality().hash(_headers),
      isLive);

  /// Create a copy of PlaybackConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaybackConfigurationImplCopyWith<_$PlaybackConfigurationImpl>
      get copyWith => __$$PlaybackConfigurationImplCopyWithImpl<
          _$PlaybackConfigurationImpl>(this, _$identity);
}

abstract class _PlaybackConfiguration extends PlaybackConfiguration {
  const factory _PlaybackConfiguration(
      {required final MediaSourceType sourceType,
      required final String qualityLabel,
      final String? videoUrl,
      final String? audioUrl,
      final String? manifestUrl,
      final List<NewPipeSubtitle> subtitles,
      final Map<String, String> headers,
      final bool isLive}) = _$PlaybackConfigurationImpl;
  const _PlaybackConfiguration._() : super._();

  /// Type of media source
  @override
  MediaSourceType get sourceType;

  /// Quality label (e.g., "1080p", "720p 60fps")
  @override
  String get qualityLabel;

  /// Video URL (for progressive or merging)
  @override
  String? get videoUrl;

  /// Audio URL (for merging only)
  @override
  String? get audioUrl;

  /// Manifest URL (for HLS or DASH)
  @override
  String? get manifestUrl;

  /// Subtitle tracks
  @override
  List<NewPipeSubtitle> get subtitles;

  /// HTTP headers (if needed)
  @override
  Map<String, String> get headers;

  /// Whether this is a live stream
  @override
  bool get isLive;

  /// Create a copy of PlaybackConfiguration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaybackConfigurationImplCopyWith<_$PlaybackConfigurationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
