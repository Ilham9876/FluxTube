// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChannelEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serviceType, String channelId)
        getChannelData,
    required TResult Function(
            String serviceType, String channelId, String? nextPage)
        getMoreChannelVideos,
    required TResult Function(String tabData, String tabName)
        getChannelTabContent,
    required TResult Function(int index) selectTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String serviceType, String channelId)? getChannelData,
    TResult? Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult? Function(String tabData, String tabName)? getChannelTabContent,
    TResult? Function(int index)? selectTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serviceType, String channelId)? getChannelData,
    TResult Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult Function(String tabData, String tabName)? getChannelTabContent,
    TResult Function(int index)? selectTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetChannelData value) getChannelData,
    required TResult Function(GetMoreChannelVideos value) getMoreChannelVideos,
    required TResult Function(GetChannelTabContent value) getChannelTabContent,
    required TResult Function(SelectTab value) selectTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetChannelData value)? getChannelData,
    TResult? Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult? Function(GetChannelTabContent value)? getChannelTabContent,
    TResult? Function(SelectTab value)? selectTab,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetChannelData value)? getChannelData,
    TResult Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult Function(GetChannelTabContent value)? getChannelTabContent,
    TResult Function(SelectTab value)? selectTab,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelEventCopyWith<$Res> {
  factory $ChannelEventCopyWith(
          ChannelEvent value, $Res Function(ChannelEvent) then) =
      _$ChannelEventCopyWithImpl<$Res, ChannelEvent>;
}

/// @nodoc
class _$ChannelEventCopyWithImpl<$Res, $Val extends ChannelEvent>
    implements $ChannelEventCopyWith<$Res> {
  _$ChannelEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetChannelDataImplCopyWith<$Res> {
  factory _$$GetChannelDataImplCopyWith(_$GetChannelDataImpl value,
          $Res Function(_$GetChannelDataImpl) then) =
      __$$GetChannelDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceType, String channelId});
}

/// @nodoc
class __$$GetChannelDataImplCopyWithImpl<$Res>
    extends _$ChannelEventCopyWithImpl<$Res, _$GetChannelDataImpl>
    implements _$$GetChannelDataImplCopyWith<$Res> {
  __$$GetChannelDataImplCopyWithImpl(
      _$GetChannelDataImpl _value, $Res Function(_$GetChannelDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceType = null,
    Object? channelId = null,
  }) {
    return _then(_$GetChannelDataImpl(
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetChannelDataImpl implements GetChannelData {
  const _$GetChannelDataImpl(
      {required this.serviceType, required this.channelId});

  @override
  final String serviceType;
  @override
  final String channelId;

  @override
  String toString() {
    return 'ChannelEvent.getChannelData(serviceType: $serviceType, channelId: $channelId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChannelDataImpl &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, serviceType, channelId);

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetChannelDataImplCopyWith<_$GetChannelDataImpl> get copyWith =>
      __$$GetChannelDataImplCopyWithImpl<_$GetChannelDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serviceType, String channelId)
        getChannelData,
    required TResult Function(
            String serviceType, String channelId, String? nextPage)
        getMoreChannelVideos,
    required TResult Function(String tabData, String tabName)
        getChannelTabContent,
    required TResult Function(int index) selectTab,
  }) {
    return getChannelData(serviceType, channelId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String serviceType, String channelId)? getChannelData,
    TResult? Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult? Function(String tabData, String tabName)? getChannelTabContent,
    TResult? Function(int index)? selectTab,
  }) {
    return getChannelData?.call(serviceType, channelId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serviceType, String channelId)? getChannelData,
    TResult Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult Function(String tabData, String tabName)? getChannelTabContent,
    TResult Function(int index)? selectTab,
    required TResult orElse(),
  }) {
    if (getChannelData != null) {
      return getChannelData(serviceType, channelId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetChannelData value) getChannelData,
    required TResult Function(GetMoreChannelVideos value) getMoreChannelVideos,
    required TResult Function(GetChannelTabContent value) getChannelTabContent,
    required TResult Function(SelectTab value) selectTab,
  }) {
    return getChannelData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetChannelData value)? getChannelData,
    TResult? Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult? Function(GetChannelTabContent value)? getChannelTabContent,
    TResult? Function(SelectTab value)? selectTab,
  }) {
    return getChannelData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetChannelData value)? getChannelData,
    TResult Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult Function(GetChannelTabContent value)? getChannelTabContent,
    TResult Function(SelectTab value)? selectTab,
    required TResult orElse(),
  }) {
    if (getChannelData != null) {
      return getChannelData(this);
    }
    return orElse();
  }
}

abstract class GetChannelData implements ChannelEvent {
  const factory GetChannelData(
      {required final String serviceType,
      required final String channelId}) = _$GetChannelDataImpl;

  String get serviceType;
  String get channelId;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetChannelDataImplCopyWith<_$GetChannelDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMoreChannelVideosImplCopyWith<$Res> {
  factory _$$GetMoreChannelVideosImplCopyWith(_$GetMoreChannelVideosImpl value,
          $Res Function(_$GetMoreChannelVideosImpl) then) =
      __$$GetMoreChannelVideosImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String serviceType, String channelId, String? nextPage});
}

/// @nodoc
class __$$GetMoreChannelVideosImplCopyWithImpl<$Res>
    extends _$ChannelEventCopyWithImpl<$Res, _$GetMoreChannelVideosImpl>
    implements _$$GetMoreChannelVideosImplCopyWith<$Res> {
  __$$GetMoreChannelVideosImplCopyWithImpl(_$GetMoreChannelVideosImpl _value,
      $Res Function(_$GetMoreChannelVideosImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceType = null,
    Object? channelId = null,
    Object? nextPage = freezed,
  }) {
    return _then(_$GetMoreChannelVideosImpl(
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetMoreChannelVideosImpl implements GetMoreChannelVideos {
  const _$GetMoreChannelVideosImpl(
      {required this.serviceType,
      required this.channelId,
      required this.nextPage});

  @override
  final String serviceType;
  @override
  final String channelId;
  @override
  final String? nextPage;

  @override
  String toString() {
    return 'ChannelEvent.getMoreChannelVideos(serviceType: $serviceType, channelId: $channelId, nextPage: $nextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMoreChannelVideosImpl &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, serviceType, channelId, nextPage);

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMoreChannelVideosImplCopyWith<_$GetMoreChannelVideosImpl>
      get copyWith =>
          __$$GetMoreChannelVideosImplCopyWithImpl<_$GetMoreChannelVideosImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serviceType, String channelId)
        getChannelData,
    required TResult Function(
            String serviceType, String channelId, String? nextPage)
        getMoreChannelVideos,
    required TResult Function(String tabData, String tabName)
        getChannelTabContent,
    required TResult Function(int index) selectTab,
  }) {
    return getMoreChannelVideos(serviceType, channelId, nextPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String serviceType, String channelId)? getChannelData,
    TResult? Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult? Function(String tabData, String tabName)? getChannelTabContent,
    TResult? Function(int index)? selectTab,
  }) {
    return getMoreChannelVideos?.call(serviceType, channelId, nextPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serviceType, String channelId)? getChannelData,
    TResult Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult Function(String tabData, String tabName)? getChannelTabContent,
    TResult Function(int index)? selectTab,
    required TResult orElse(),
  }) {
    if (getMoreChannelVideos != null) {
      return getMoreChannelVideos(serviceType, channelId, nextPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetChannelData value) getChannelData,
    required TResult Function(GetMoreChannelVideos value) getMoreChannelVideos,
    required TResult Function(GetChannelTabContent value) getChannelTabContent,
    required TResult Function(SelectTab value) selectTab,
  }) {
    return getMoreChannelVideos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetChannelData value)? getChannelData,
    TResult? Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult? Function(GetChannelTabContent value)? getChannelTabContent,
    TResult? Function(SelectTab value)? selectTab,
  }) {
    return getMoreChannelVideos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetChannelData value)? getChannelData,
    TResult Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult Function(GetChannelTabContent value)? getChannelTabContent,
    TResult Function(SelectTab value)? selectTab,
    required TResult orElse(),
  }) {
    if (getMoreChannelVideos != null) {
      return getMoreChannelVideos(this);
    }
    return orElse();
  }
}

abstract class GetMoreChannelVideos implements ChannelEvent {
  const factory GetMoreChannelVideos(
      {required final String serviceType,
      required final String channelId,
      required final String? nextPage}) = _$GetMoreChannelVideosImpl;

  String get serviceType;
  String get channelId;
  String? get nextPage;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMoreChannelVideosImplCopyWith<_$GetMoreChannelVideosImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetChannelTabContentImplCopyWith<$Res> {
  factory _$$GetChannelTabContentImplCopyWith(_$GetChannelTabContentImpl value,
          $Res Function(_$GetChannelTabContentImpl) then) =
      __$$GetChannelTabContentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tabData, String tabName});
}

/// @nodoc
class __$$GetChannelTabContentImplCopyWithImpl<$Res>
    extends _$ChannelEventCopyWithImpl<$Res, _$GetChannelTabContentImpl>
    implements _$$GetChannelTabContentImplCopyWith<$Res> {
  __$$GetChannelTabContentImplCopyWithImpl(_$GetChannelTabContentImpl _value,
      $Res Function(_$GetChannelTabContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabData = null,
    Object? tabName = null,
  }) {
    return _then(_$GetChannelTabContentImpl(
      tabData: null == tabData
          ? _value.tabData
          : tabData // ignore: cast_nullable_to_non_nullable
              as String,
      tabName: null == tabName
          ? _value.tabName
          : tabName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetChannelTabContentImpl implements GetChannelTabContent {
  const _$GetChannelTabContentImpl(
      {required this.tabData, required this.tabName});

  @override
  final String tabData;
  @override
  final String tabName;

  @override
  String toString() {
    return 'ChannelEvent.getChannelTabContent(tabData: $tabData, tabName: $tabName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChannelTabContentImpl &&
            (identical(other.tabData, tabData) || other.tabData == tabData) &&
            (identical(other.tabName, tabName) || other.tabName == tabName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabData, tabName);

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetChannelTabContentImplCopyWith<_$GetChannelTabContentImpl>
      get copyWith =>
          __$$GetChannelTabContentImplCopyWithImpl<_$GetChannelTabContentImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serviceType, String channelId)
        getChannelData,
    required TResult Function(
            String serviceType, String channelId, String? nextPage)
        getMoreChannelVideos,
    required TResult Function(String tabData, String tabName)
        getChannelTabContent,
    required TResult Function(int index) selectTab,
  }) {
    return getChannelTabContent(tabData, tabName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String serviceType, String channelId)? getChannelData,
    TResult? Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult? Function(String tabData, String tabName)? getChannelTabContent,
    TResult? Function(int index)? selectTab,
  }) {
    return getChannelTabContent?.call(tabData, tabName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serviceType, String channelId)? getChannelData,
    TResult Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult Function(String tabData, String tabName)? getChannelTabContent,
    TResult Function(int index)? selectTab,
    required TResult orElse(),
  }) {
    if (getChannelTabContent != null) {
      return getChannelTabContent(tabData, tabName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetChannelData value) getChannelData,
    required TResult Function(GetMoreChannelVideos value) getMoreChannelVideos,
    required TResult Function(GetChannelTabContent value) getChannelTabContent,
    required TResult Function(SelectTab value) selectTab,
  }) {
    return getChannelTabContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetChannelData value)? getChannelData,
    TResult? Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult? Function(GetChannelTabContent value)? getChannelTabContent,
    TResult? Function(SelectTab value)? selectTab,
  }) {
    return getChannelTabContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetChannelData value)? getChannelData,
    TResult Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult Function(GetChannelTabContent value)? getChannelTabContent,
    TResult Function(SelectTab value)? selectTab,
    required TResult orElse(),
  }) {
    if (getChannelTabContent != null) {
      return getChannelTabContent(this);
    }
    return orElse();
  }
}

abstract class GetChannelTabContent implements ChannelEvent {
  const factory GetChannelTabContent(
      {required final String tabData,
      required final String tabName}) = _$GetChannelTabContentImpl;

  String get tabData;
  String get tabName;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetChannelTabContentImplCopyWith<_$GetChannelTabContentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectTabImplCopyWith<$Res> {
  factory _$$SelectTabImplCopyWith(
          _$SelectTabImpl value, $Res Function(_$SelectTabImpl) then) =
      __$$SelectTabImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SelectTabImplCopyWithImpl<$Res>
    extends _$ChannelEventCopyWithImpl<$Res, _$SelectTabImpl>
    implements _$$SelectTabImplCopyWith<$Res> {
  __$$SelectTabImplCopyWithImpl(
      _$SelectTabImpl _value, $Res Function(_$SelectTabImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$SelectTabImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectTabImpl implements SelectTab {
  const _$SelectTabImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'ChannelEvent.selectTab(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectTabImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectTabImplCopyWith<_$SelectTabImpl> get copyWith =>
      __$$SelectTabImplCopyWithImpl<_$SelectTabImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serviceType, String channelId)
        getChannelData,
    required TResult Function(
            String serviceType, String channelId, String? nextPage)
        getMoreChannelVideos,
    required TResult Function(String tabData, String tabName)
        getChannelTabContent,
    required TResult Function(int index) selectTab,
  }) {
    return selectTab(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String serviceType, String channelId)? getChannelData,
    TResult? Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult? Function(String tabData, String tabName)? getChannelTabContent,
    TResult? Function(int index)? selectTab,
  }) {
    return selectTab?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serviceType, String channelId)? getChannelData,
    TResult Function(String serviceType, String channelId, String? nextPage)?
        getMoreChannelVideos,
    TResult Function(String tabData, String tabName)? getChannelTabContent,
    TResult Function(int index)? selectTab,
    required TResult orElse(),
  }) {
    if (selectTab != null) {
      return selectTab(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetChannelData value) getChannelData,
    required TResult Function(GetMoreChannelVideos value) getMoreChannelVideos,
    required TResult Function(GetChannelTabContent value) getChannelTabContent,
    required TResult Function(SelectTab value) selectTab,
  }) {
    return selectTab(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetChannelData value)? getChannelData,
    TResult? Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult? Function(GetChannelTabContent value)? getChannelTabContent,
    TResult? Function(SelectTab value)? selectTab,
  }) {
    return selectTab?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetChannelData value)? getChannelData,
    TResult Function(GetMoreChannelVideos value)? getMoreChannelVideos,
    TResult Function(GetChannelTabContent value)? getChannelTabContent,
    TResult Function(SelectTab value)? selectTab,
    required TResult orElse(),
  }) {
    if (selectTab != null) {
      return selectTab(this);
    }
    return orElse();
  }
}

abstract class SelectTab implements ChannelEvent {
  const factory SelectTab({required final int index}) = _$SelectTabImpl;

  int get index;

  /// Create a copy of ChannelEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectTabImplCopyWith<_$SelectTabImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChannelState {
//
  bool get isMoreFetchCompleted => throw _privateConstructorUsedError; // PIPED
  ApiStatus get channelDetailsFetchStatus => throw _privateConstructorUsedError;
  ChannelResp? get pipedChannelResp => throw _privateConstructorUsedError;
  ApiStatus get moreChannelDetailsFetchStatus =>
      throw _privateConstructorUsedError; // PIPED TABS
  int get selectedTabIndex => throw _privateConstructorUsedError;
  ApiStatus get tabContentFetchStatus => throw _privateConstructorUsedError;
  TabContent? get selectedTabContent =>
      throw _privateConstructorUsedError; // Separate tab content for shorts and playlists
  ApiStatus get shortsTabFetchStatus => throw _privateConstructorUsedError;
  TabContent? get shortsTabContent => throw _privateConstructorUsedError;
  ApiStatus get playlistsTabFetchStatus => throw _privateConstructorUsedError;
  TabContent? get playlistsTabContent =>
      throw _privateConstructorUsedError; // INVIDIOUS
  InvidiousChannelResp? get invidiousChannelResp =>
      throw _privateConstructorUsedError;
  int get invidiousPage => throw _privateConstructorUsedError; // NEWPIPE
  NewPipeChannelResp? get newPipeChannelResp =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChannelStateCopyWith<ChannelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelStateCopyWith<$Res> {
  factory $ChannelStateCopyWith(
          ChannelState value, $Res Function(ChannelState) then) =
      _$ChannelStateCopyWithImpl<$Res, ChannelState>;
  @useResult
  $Res call(
      {bool isMoreFetchCompleted,
      ApiStatus channelDetailsFetchStatus,
      ChannelResp? pipedChannelResp,
      ApiStatus moreChannelDetailsFetchStatus,
      int selectedTabIndex,
      ApiStatus tabContentFetchStatus,
      TabContent? selectedTabContent,
      ApiStatus shortsTabFetchStatus,
      TabContent? shortsTabContent,
      ApiStatus playlistsTabFetchStatus,
      TabContent? playlistsTabContent,
      InvidiousChannelResp? invidiousChannelResp,
      int invidiousPage,
      NewPipeChannelResp? newPipeChannelResp});
}

/// @nodoc
class _$ChannelStateCopyWithImpl<$Res, $Val extends ChannelState>
    implements $ChannelStateCopyWith<$Res> {
  _$ChannelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMoreFetchCompleted = null,
    Object? channelDetailsFetchStatus = null,
    Object? pipedChannelResp = freezed,
    Object? moreChannelDetailsFetchStatus = null,
    Object? selectedTabIndex = null,
    Object? tabContentFetchStatus = null,
    Object? selectedTabContent = freezed,
    Object? shortsTabFetchStatus = null,
    Object? shortsTabContent = freezed,
    Object? playlistsTabFetchStatus = null,
    Object? playlistsTabContent = freezed,
    Object? invidiousChannelResp = freezed,
    Object? invidiousPage = null,
    Object? newPipeChannelResp = freezed,
  }) {
    return _then(_value.copyWith(
      isMoreFetchCompleted: null == isMoreFetchCompleted
          ? _value.isMoreFetchCompleted
          : isMoreFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      channelDetailsFetchStatus: null == channelDetailsFetchStatus
          ? _value.channelDetailsFetchStatus
          : channelDetailsFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      pipedChannelResp: freezed == pipedChannelResp
          ? _value.pipedChannelResp
          : pipedChannelResp // ignore: cast_nullable_to_non_nullable
              as ChannelResp?,
      moreChannelDetailsFetchStatus: null == moreChannelDetailsFetchStatus
          ? _value.moreChannelDetailsFetchStatus
          : moreChannelDetailsFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      selectedTabIndex: null == selectedTabIndex
          ? _value.selectedTabIndex
          : selectedTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      tabContentFetchStatus: null == tabContentFetchStatus
          ? _value.tabContentFetchStatus
          : tabContentFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      selectedTabContent: freezed == selectedTabContent
          ? _value.selectedTabContent
          : selectedTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      shortsTabFetchStatus: null == shortsTabFetchStatus
          ? _value.shortsTabFetchStatus
          : shortsTabFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      shortsTabContent: freezed == shortsTabContent
          ? _value.shortsTabContent
          : shortsTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      playlistsTabFetchStatus: null == playlistsTabFetchStatus
          ? _value.playlistsTabFetchStatus
          : playlistsTabFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      playlistsTabContent: freezed == playlistsTabContent
          ? _value.playlistsTabContent
          : playlistsTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      invidiousChannelResp: freezed == invidiousChannelResp
          ? _value.invidiousChannelResp
          : invidiousChannelResp // ignore: cast_nullable_to_non_nullable
              as InvidiousChannelResp?,
      invidiousPage: null == invidiousPage
          ? _value.invidiousPage
          : invidiousPage // ignore: cast_nullable_to_non_nullable
              as int,
      newPipeChannelResp: freezed == newPipeChannelResp
          ? _value.newPipeChannelResp
          : newPipeChannelResp // ignore: cast_nullable_to_non_nullable
              as NewPipeChannelResp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelStateImplCopyWith<$Res>
    implements $ChannelStateCopyWith<$Res> {
  factory _$$ChannelStateImplCopyWith(
          _$ChannelStateImpl value, $Res Function(_$ChannelStateImpl) then) =
      __$$ChannelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isMoreFetchCompleted,
      ApiStatus channelDetailsFetchStatus,
      ChannelResp? pipedChannelResp,
      ApiStatus moreChannelDetailsFetchStatus,
      int selectedTabIndex,
      ApiStatus tabContentFetchStatus,
      TabContent? selectedTabContent,
      ApiStatus shortsTabFetchStatus,
      TabContent? shortsTabContent,
      ApiStatus playlistsTabFetchStatus,
      TabContent? playlistsTabContent,
      InvidiousChannelResp? invidiousChannelResp,
      int invidiousPage,
      NewPipeChannelResp? newPipeChannelResp});
}

/// @nodoc
class __$$ChannelStateImplCopyWithImpl<$Res>
    extends _$ChannelStateCopyWithImpl<$Res, _$ChannelStateImpl>
    implements _$$ChannelStateImplCopyWith<$Res> {
  __$$ChannelStateImplCopyWithImpl(
      _$ChannelStateImpl _value, $Res Function(_$ChannelStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMoreFetchCompleted = null,
    Object? channelDetailsFetchStatus = null,
    Object? pipedChannelResp = freezed,
    Object? moreChannelDetailsFetchStatus = null,
    Object? selectedTabIndex = null,
    Object? tabContentFetchStatus = null,
    Object? selectedTabContent = freezed,
    Object? shortsTabFetchStatus = null,
    Object? shortsTabContent = freezed,
    Object? playlistsTabFetchStatus = null,
    Object? playlistsTabContent = freezed,
    Object? invidiousChannelResp = freezed,
    Object? invidiousPage = null,
    Object? newPipeChannelResp = freezed,
  }) {
    return _then(_$ChannelStateImpl(
      isMoreFetchCompleted: null == isMoreFetchCompleted
          ? _value.isMoreFetchCompleted
          : isMoreFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      channelDetailsFetchStatus: null == channelDetailsFetchStatus
          ? _value.channelDetailsFetchStatus
          : channelDetailsFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      pipedChannelResp: freezed == pipedChannelResp
          ? _value.pipedChannelResp
          : pipedChannelResp // ignore: cast_nullable_to_non_nullable
              as ChannelResp?,
      moreChannelDetailsFetchStatus: null == moreChannelDetailsFetchStatus
          ? _value.moreChannelDetailsFetchStatus
          : moreChannelDetailsFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      selectedTabIndex: null == selectedTabIndex
          ? _value.selectedTabIndex
          : selectedTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      tabContentFetchStatus: null == tabContentFetchStatus
          ? _value.tabContentFetchStatus
          : tabContentFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      selectedTabContent: freezed == selectedTabContent
          ? _value.selectedTabContent
          : selectedTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      shortsTabFetchStatus: null == shortsTabFetchStatus
          ? _value.shortsTabFetchStatus
          : shortsTabFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      shortsTabContent: freezed == shortsTabContent
          ? _value.shortsTabContent
          : shortsTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      playlistsTabFetchStatus: null == playlistsTabFetchStatus
          ? _value.playlistsTabFetchStatus
          : playlistsTabFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      playlistsTabContent: freezed == playlistsTabContent
          ? _value.playlistsTabContent
          : playlistsTabContent // ignore: cast_nullable_to_non_nullable
              as TabContent?,
      invidiousChannelResp: freezed == invidiousChannelResp
          ? _value.invidiousChannelResp
          : invidiousChannelResp // ignore: cast_nullable_to_non_nullable
              as InvidiousChannelResp?,
      invidiousPage: null == invidiousPage
          ? _value.invidiousPage
          : invidiousPage // ignore: cast_nullable_to_non_nullable
              as int,
      newPipeChannelResp: freezed == newPipeChannelResp
          ? _value.newPipeChannelResp
          : newPipeChannelResp // ignore: cast_nullable_to_non_nullable
              as NewPipeChannelResp?,
    ));
  }
}

/// @nodoc

class _$ChannelStateImpl implements _ChannelState {
  _$ChannelStateImpl(
      {required this.isMoreFetchCompleted,
      required this.channelDetailsFetchStatus,
      required this.pipedChannelResp,
      required this.moreChannelDetailsFetchStatus,
      required this.selectedTabIndex,
      required this.tabContentFetchStatus,
      required this.selectedTabContent,
      required this.shortsTabFetchStatus,
      required this.shortsTabContent,
      required this.playlistsTabFetchStatus,
      required this.playlistsTabContent,
      required this.invidiousChannelResp,
      required this.invidiousPage,
      required this.newPipeChannelResp});

//
  @override
  final bool isMoreFetchCompleted;
// PIPED
  @override
  final ApiStatus channelDetailsFetchStatus;
  @override
  final ChannelResp? pipedChannelResp;
  @override
  final ApiStatus moreChannelDetailsFetchStatus;
// PIPED TABS
  @override
  final int selectedTabIndex;
  @override
  final ApiStatus tabContentFetchStatus;
  @override
  final TabContent? selectedTabContent;
// Separate tab content for shorts and playlists
  @override
  final ApiStatus shortsTabFetchStatus;
  @override
  final TabContent? shortsTabContent;
  @override
  final ApiStatus playlistsTabFetchStatus;
  @override
  final TabContent? playlistsTabContent;
// INVIDIOUS
  @override
  final InvidiousChannelResp? invidiousChannelResp;
  @override
  final int invidiousPage;
// NEWPIPE
  @override
  final NewPipeChannelResp? newPipeChannelResp;

  @override
  String toString() {
    return 'ChannelState(isMoreFetchCompleted: $isMoreFetchCompleted, channelDetailsFetchStatus: $channelDetailsFetchStatus, pipedChannelResp: $pipedChannelResp, moreChannelDetailsFetchStatus: $moreChannelDetailsFetchStatus, selectedTabIndex: $selectedTabIndex, tabContentFetchStatus: $tabContentFetchStatus, selectedTabContent: $selectedTabContent, shortsTabFetchStatus: $shortsTabFetchStatus, shortsTabContent: $shortsTabContent, playlistsTabFetchStatus: $playlistsTabFetchStatus, playlistsTabContent: $playlistsTabContent, invidiousChannelResp: $invidiousChannelResp, invidiousPage: $invidiousPage, newPipeChannelResp: $newPipeChannelResp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelStateImpl &&
            (identical(other.isMoreFetchCompleted, isMoreFetchCompleted) ||
                other.isMoreFetchCompleted == isMoreFetchCompleted) &&
            (identical(other.channelDetailsFetchStatus,
                    channelDetailsFetchStatus) ||
                other.channelDetailsFetchStatus == channelDetailsFetchStatus) &&
            (identical(other.pipedChannelResp, pipedChannelResp) ||
                other.pipedChannelResp == pipedChannelResp) &&
            (identical(other.moreChannelDetailsFetchStatus,
                    moreChannelDetailsFetchStatus) ||
                other.moreChannelDetailsFetchStatus ==
                    moreChannelDetailsFetchStatus) &&
            (identical(other.selectedTabIndex, selectedTabIndex) ||
                other.selectedTabIndex == selectedTabIndex) &&
            (identical(other.tabContentFetchStatus, tabContentFetchStatus) ||
                other.tabContentFetchStatus == tabContentFetchStatus) &&
            (identical(other.selectedTabContent, selectedTabContent) ||
                other.selectedTabContent == selectedTabContent) &&
            (identical(other.shortsTabFetchStatus, shortsTabFetchStatus) ||
                other.shortsTabFetchStatus == shortsTabFetchStatus) &&
            (identical(other.shortsTabContent, shortsTabContent) ||
                other.shortsTabContent == shortsTabContent) &&
            (identical(
                    other.playlistsTabFetchStatus, playlistsTabFetchStatus) ||
                other.playlistsTabFetchStatus == playlistsTabFetchStatus) &&
            (identical(other.playlistsTabContent, playlistsTabContent) ||
                other.playlistsTabContent == playlistsTabContent) &&
            (identical(other.invidiousChannelResp, invidiousChannelResp) ||
                other.invidiousChannelResp == invidiousChannelResp) &&
            (identical(other.invidiousPage, invidiousPage) ||
                other.invidiousPage == invidiousPage) &&
            (identical(other.newPipeChannelResp, newPipeChannelResp) ||
                other.newPipeChannelResp == newPipeChannelResp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isMoreFetchCompleted,
      channelDetailsFetchStatus,
      pipedChannelResp,
      moreChannelDetailsFetchStatus,
      selectedTabIndex,
      tabContentFetchStatus,
      selectedTabContent,
      shortsTabFetchStatus,
      shortsTabContent,
      playlistsTabFetchStatus,
      playlistsTabContent,
      invidiousChannelResp,
      invidiousPage,
      newPipeChannelResp);

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelStateImplCopyWith<_$ChannelStateImpl> get copyWith =>
      __$$ChannelStateImplCopyWithImpl<_$ChannelStateImpl>(this, _$identity);
}

abstract class _ChannelState implements ChannelState {
  factory _ChannelState(
          {required final bool isMoreFetchCompleted,
          required final ApiStatus channelDetailsFetchStatus,
          required final ChannelResp? pipedChannelResp,
          required final ApiStatus moreChannelDetailsFetchStatus,
          required final int selectedTabIndex,
          required final ApiStatus tabContentFetchStatus,
          required final TabContent? selectedTabContent,
          required final ApiStatus shortsTabFetchStatus,
          required final TabContent? shortsTabContent,
          required final ApiStatus playlistsTabFetchStatus,
          required final TabContent? playlistsTabContent,
          required final InvidiousChannelResp? invidiousChannelResp,
          required final int invidiousPage,
          required final NewPipeChannelResp? newPipeChannelResp}) =
      _$ChannelStateImpl;

//
  @override
  bool get isMoreFetchCompleted; // PIPED
  @override
  ApiStatus get channelDetailsFetchStatus;
  @override
  ChannelResp? get pipedChannelResp;
  @override
  ApiStatus get moreChannelDetailsFetchStatus; // PIPED TABS
  @override
  int get selectedTabIndex;
  @override
  ApiStatus get tabContentFetchStatus;
  @override
  TabContent?
      get selectedTabContent; // Separate tab content for shorts and playlists
  @override
  ApiStatus get shortsTabFetchStatus;
  @override
  TabContent? get shortsTabContent;
  @override
  ApiStatus get playlistsTabFetchStatus;
  @override
  TabContent? get playlistsTabContent; // INVIDIOUS
  @override
  InvidiousChannelResp? get invidiousChannelResp;
  @override
  int get invidiousPage; // NEWPIPE
  @override
  NewPipeChannelResp? get newPipeChannelResp;

  /// Create a copy of ChannelState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChannelStateImplCopyWith<_$ChannelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
