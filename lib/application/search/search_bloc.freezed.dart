// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? filter, String serviceType)
        getSearchResult,
    required TResult Function(
            String query, String? filter, String? nextPage, String serviceType)
        getMoreSearchResult,
    required TResult Function(String query, String serviceType)
        getSearchSuggestion,
    required TResult Function(String profileName, int limit) getSearchHistory,
    required TResult Function(String query, String profileName) saveSearchQuery,
    required TResult Function(String query, String profileName)
        deleteSearchQuery,
    required TResult Function(String profileName) clearSearchHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult? Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult? Function(String query, String serviceType)? getSearchSuggestion,
    TResult? Function(String profileName, int limit)? getSearchHistory,
    TResult? Function(String query, String profileName)? saveSearchQuery,
    TResult? Function(String query, String profileName)? deleteSearchQuery,
    TResult? Function(String profileName)? clearSearchHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult Function(String query, String serviceType)? getSearchSuggestion,
    TResult Function(String profileName, int limit)? getSearchHistory,
    TResult Function(String query, String profileName)? saveSearchQuery,
    TResult Function(String query, String profileName)? deleteSearchQuery,
    TResult Function(String profileName)? clearSearchHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSearchResult value) getSearchResult,
    required TResult Function(GetMoreSearchResult value) getMoreSearchResult,
    required TResult Function(GetSearchSuggestion value) getSearchSuggestion,
    required TResult Function(GetSearchHistory value) getSearchHistory,
    required TResult Function(SaveSearchQuery value) saveSearchQuery,
    required TResult Function(DeleteSearchQuery value) deleteSearchQuery,
    required TResult Function(ClearSearchHistory value) clearSearchHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSearchResult value)? getSearchResult,
    TResult? Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult? Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult? Function(GetSearchHistory value)? getSearchHistory,
    TResult? Function(SaveSearchQuery value)? saveSearchQuery,
    TResult? Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult? Function(ClearSearchHistory value)? clearSearchHistory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSearchResult value)? getSearchResult,
    TResult Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult Function(GetSearchHistory value)? getSearchHistory,
    TResult Function(SaveSearchQuery value)? saveSearchQuery,
    TResult Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult Function(ClearSearchHistory value)? clearSearchHistory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
          SearchEvent value, $Res Function(SearchEvent) then) =
      _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetSearchResultImplCopyWith<$Res> {
  factory _$$GetSearchResultImplCopyWith(_$GetSearchResultImpl value,
          $Res Function(_$GetSearchResultImpl) then) =
      __$$GetSearchResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query, String? filter, String serviceType});
}

/// @nodoc
class __$$GetSearchResultImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$GetSearchResultImpl>
    implements _$$GetSearchResultImplCopyWith<$Res> {
  __$$GetSearchResultImplCopyWithImpl(
      _$GetSearchResultImpl _value, $Res Function(_$GetSearchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? filter = freezed,
    Object? serviceType = null,
  }) {
    return _then(_$GetSearchResultImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSearchResultImpl implements GetSearchResult {
  const _$GetSearchResultImpl(
      {required this.query, required this.filter, required this.serviceType});

  @override
  final String query;
  @override
  final String? filter;
  @override
  final String serviceType;

  @override
  String toString() {
    return 'SearchEvent.getSearchResult(query: $query, filter: $filter, serviceType: $serviceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchResultImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, filter, serviceType);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchResultImplCopyWith<_$GetSearchResultImpl> get copyWith =>
      __$$GetSearchResultImplCopyWithImpl<_$GetSearchResultImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? filter, String serviceType)
        getSearchResult,
    required TResult Function(
            String query, String? filter, String? nextPage, String serviceType)
        getMoreSearchResult,
    required TResult Function(String query, String serviceType)
        getSearchSuggestion,
    required TResult Function(String profileName, int limit) getSearchHistory,
    required TResult Function(String query, String profileName) saveSearchQuery,
    required TResult Function(String query, String profileName)
        deleteSearchQuery,
    required TResult Function(String profileName) clearSearchHistory,
  }) {
    return getSearchResult(query, filter, serviceType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult? Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult? Function(String query, String serviceType)? getSearchSuggestion,
    TResult? Function(String profileName, int limit)? getSearchHistory,
    TResult? Function(String query, String profileName)? saveSearchQuery,
    TResult? Function(String query, String profileName)? deleteSearchQuery,
    TResult? Function(String profileName)? clearSearchHistory,
  }) {
    return getSearchResult?.call(query, filter, serviceType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult Function(String query, String serviceType)? getSearchSuggestion,
    TResult Function(String profileName, int limit)? getSearchHistory,
    TResult Function(String query, String profileName)? saveSearchQuery,
    TResult Function(String query, String profileName)? deleteSearchQuery,
    TResult Function(String profileName)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (getSearchResult != null) {
      return getSearchResult(query, filter, serviceType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSearchResult value) getSearchResult,
    required TResult Function(GetMoreSearchResult value) getMoreSearchResult,
    required TResult Function(GetSearchSuggestion value) getSearchSuggestion,
    required TResult Function(GetSearchHistory value) getSearchHistory,
    required TResult Function(SaveSearchQuery value) saveSearchQuery,
    required TResult Function(DeleteSearchQuery value) deleteSearchQuery,
    required TResult Function(ClearSearchHistory value) clearSearchHistory,
  }) {
    return getSearchResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSearchResult value)? getSearchResult,
    TResult? Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult? Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult? Function(GetSearchHistory value)? getSearchHistory,
    TResult? Function(SaveSearchQuery value)? saveSearchQuery,
    TResult? Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult? Function(ClearSearchHistory value)? clearSearchHistory,
  }) {
    return getSearchResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSearchResult value)? getSearchResult,
    TResult Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult Function(GetSearchHistory value)? getSearchHistory,
    TResult Function(SaveSearchQuery value)? saveSearchQuery,
    TResult Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult Function(ClearSearchHistory value)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (getSearchResult != null) {
      return getSearchResult(this);
    }
    return orElse();
  }
}

abstract class GetSearchResult implements SearchEvent {
  const factory GetSearchResult(
      {required final String query,
      required final String? filter,
      required final String serviceType}) = _$GetSearchResultImpl;

  String get query;
  String? get filter;
  String get serviceType;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSearchResultImplCopyWith<_$GetSearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMoreSearchResultImplCopyWith<$Res> {
  factory _$$GetMoreSearchResultImplCopyWith(_$GetMoreSearchResultImpl value,
          $Res Function(_$GetMoreSearchResultImpl) then) =
      __$$GetMoreSearchResultImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String query, String? filter, String? nextPage, String serviceType});
}

/// @nodoc
class __$$GetMoreSearchResultImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$GetMoreSearchResultImpl>
    implements _$$GetMoreSearchResultImplCopyWith<$Res> {
  __$$GetMoreSearchResultImplCopyWithImpl(_$GetMoreSearchResultImpl _value,
      $Res Function(_$GetMoreSearchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? filter = freezed,
    Object? nextPage = freezed,
    Object? serviceType = null,
  }) {
    return _then(_$GetMoreSearchResultImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetMoreSearchResultImpl implements GetMoreSearchResult {
  const _$GetMoreSearchResultImpl(
      {required this.query,
      required this.filter,
      required this.nextPage,
      required this.serviceType});

  @override
  final String query;
  @override
  final String? filter;
  @override
  final String? nextPage;
  @override
  final String serviceType;

  @override
  String toString() {
    return 'SearchEvent.getMoreSearchResult(query: $query, filter: $filter, nextPage: $nextPage, serviceType: $serviceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMoreSearchResultImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, query, filter, nextPage, serviceType);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMoreSearchResultImplCopyWith<_$GetMoreSearchResultImpl> get copyWith =>
      __$$GetMoreSearchResultImplCopyWithImpl<_$GetMoreSearchResultImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? filter, String serviceType)
        getSearchResult,
    required TResult Function(
            String query, String? filter, String? nextPage, String serviceType)
        getMoreSearchResult,
    required TResult Function(String query, String serviceType)
        getSearchSuggestion,
    required TResult Function(String profileName, int limit) getSearchHistory,
    required TResult Function(String query, String profileName) saveSearchQuery,
    required TResult Function(String query, String profileName)
        deleteSearchQuery,
    required TResult Function(String profileName) clearSearchHistory,
  }) {
    return getMoreSearchResult(query, filter, nextPage, serviceType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult? Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult? Function(String query, String serviceType)? getSearchSuggestion,
    TResult? Function(String profileName, int limit)? getSearchHistory,
    TResult? Function(String query, String profileName)? saveSearchQuery,
    TResult? Function(String query, String profileName)? deleteSearchQuery,
    TResult? Function(String profileName)? clearSearchHistory,
  }) {
    return getMoreSearchResult?.call(query, filter, nextPage, serviceType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult Function(String query, String serviceType)? getSearchSuggestion,
    TResult Function(String profileName, int limit)? getSearchHistory,
    TResult Function(String query, String profileName)? saveSearchQuery,
    TResult Function(String query, String profileName)? deleteSearchQuery,
    TResult Function(String profileName)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (getMoreSearchResult != null) {
      return getMoreSearchResult(query, filter, nextPage, serviceType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSearchResult value) getSearchResult,
    required TResult Function(GetMoreSearchResult value) getMoreSearchResult,
    required TResult Function(GetSearchSuggestion value) getSearchSuggestion,
    required TResult Function(GetSearchHistory value) getSearchHistory,
    required TResult Function(SaveSearchQuery value) saveSearchQuery,
    required TResult Function(DeleteSearchQuery value) deleteSearchQuery,
    required TResult Function(ClearSearchHistory value) clearSearchHistory,
  }) {
    return getMoreSearchResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSearchResult value)? getSearchResult,
    TResult? Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult? Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult? Function(GetSearchHistory value)? getSearchHistory,
    TResult? Function(SaveSearchQuery value)? saveSearchQuery,
    TResult? Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult? Function(ClearSearchHistory value)? clearSearchHistory,
  }) {
    return getMoreSearchResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSearchResult value)? getSearchResult,
    TResult Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult Function(GetSearchHistory value)? getSearchHistory,
    TResult Function(SaveSearchQuery value)? saveSearchQuery,
    TResult Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult Function(ClearSearchHistory value)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (getMoreSearchResult != null) {
      return getMoreSearchResult(this);
    }
    return orElse();
  }
}

abstract class GetMoreSearchResult implements SearchEvent {
  const factory GetMoreSearchResult(
      {required final String query,
      required final String? filter,
      required final String? nextPage,
      required final String serviceType}) = _$GetMoreSearchResultImpl;

  String get query;
  String? get filter;
  String? get nextPage;
  String get serviceType;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMoreSearchResultImplCopyWith<_$GetMoreSearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSearchSuggestionImplCopyWith<$Res> {
  factory _$$GetSearchSuggestionImplCopyWith(_$GetSearchSuggestionImpl value,
          $Res Function(_$GetSearchSuggestionImpl) then) =
      __$$GetSearchSuggestionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query, String serviceType});
}

/// @nodoc
class __$$GetSearchSuggestionImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$GetSearchSuggestionImpl>
    implements _$$GetSearchSuggestionImplCopyWith<$Res> {
  __$$GetSearchSuggestionImplCopyWithImpl(_$GetSearchSuggestionImpl _value,
      $Res Function(_$GetSearchSuggestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? serviceType = null,
  }) {
    return _then(_$GetSearchSuggestionImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSearchSuggestionImpl implements GetSearchSuggestion {
  const _$GetSearchSuggestionImpl(
      {required this.query, required this.serviceType});

  @override
  final String query;
  @override
  final String serviceType;

  @override
  String toString() {
    return 'SearchEvent.getSearchSuggestion(query: $query, serviceType: $serviceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchSuggestionImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, serviceType);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchSuggestionImplCopyWith<_$GetSearchSuggestionImpl> get copyWith =>
      __$$GetSearchSuggestionImplCopyWithImpl<_$GetSearchSuggestionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? filter, String serviceType)
        getSearchResult,
    required TResult Function(
            String query, String? filter, String? nextPage, String serviceType)
        getMoreSearchResult,
    required TResult Function(String query, String serviceType)
        getSearchSuggestion,
    required TResult Function(String profileName, int limit) getSearchHistory,
    required TResult Function(String query, String profileName) saveSearchQuery,
    required TResult Function(String query, String profileName)
        deleteSearchQuery,
    required TResult Function(String profileName) clearSearchHistory,
  }) {
    return getSearchSuggestion(query, serviceType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult? Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult? Function(String query, String serviceType)? getSearchSuggestion,
    TResult? Function(String profileName, int limit)? getSearchHistory,
    TResult? Function(String query, String profileName)? saveSearchQuery,
    TResult? Function(String query, String profileName)? deleteSearchQuery,
    TResult? Function(String profileName)? clearSearchHistory,
  }) {
    return getSearchSuggestion?.call(query, serviceType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult Function(String query, String serviceType)? getSearchSuggestion,
    TResult Function(String profileName, int limit)? getSearchHistory,
    TResult Function(String query, String profileName)? saveSearchQuery,
    TResult Function(String query, String profileName)? deleteSearchQuery,
    TResult Function(String profileName)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (getSearchSuggestion != null) {
      return getSearchSuggestion(query, serviceType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSearchResult value) getSearchResult,
    required TResult Function(GetMoreSearchResult value) getMoreSearchResult,
    required TResult Function(GetSearchSuggestion value) getSearchSuggestion,
    required TResult Function(GetSearchHistory value) getSearchHistory,
    required TResult Function(SaveSearchQuery value) saveSearchQuery,
    required TResult Function(DeleteSearchQuery value) deleteSearchQuery,
    required TResult Function(ClearSearchHistory value) clearSearchHistory,
  }) {
    return getSearchSuggestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSearchResult value)? getSearchResult,
    TResult? Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult? Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult? Function(GetSearchHistory value)? getSearchHistory,
    TResult? Function(SaveSearchQuery value)? saveSearchQuery,
    TResult? Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult? Function(ClearSearchHistory value)? clearSearchHistory,
  }) {
    return getSearchSuggestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSearchResult value)? getSearchResult,
    TResult Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult Function(GetSearchHistory value)? getSearchHistory,
    TResult Function(SaveSearchQuery value)? saveSearchQuery,
    TResult Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult Function(ClearSearchHistory value)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (getSearchSuggestion != null) {
      return getSearchSuggestion(this);
    }
    return orElse();
  }
}

abstract class GetSearchSuggestion implements SearchEvent {
  const factory GetSearchSuggestion(
      {required final String query,
      required final String serviceType}) = _$GetSearchSuggestionImpl;

  String get query;
  String get serviceType;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSearchSuggestionImplCopyWith<_$GetSearchSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSearchHistoryImplCopyWith<$Res> {
  factory _$$GetSearchHistoryImplCopyWith(_$GetSearchHistoryImpl value,
          $Res Function(_$GetSearchHistoryImpl) then) =
      __$$GetSearchHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String profileName, int limit});
}

/// @nodoc
class __$$GetSearchHistoryImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$GetSearchHistoryImpl>
    implements _$$GetSearchHistoryImplCopyWith<$Res> {
  __$$GetSearchHistoryImplCopyWithImpl(_$GetSearchHistoryImpl _value,
      $Res Function(_$GetSearchHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileName = null,
    Object? limit = null,
  }) {
    return _then(_$GetSearchHistoryImpl(
      profileName: null == profileName
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetSearchHistoryImpl implements GetSearchHistory {
  const _$GetSearchHistoryImpl({this.profileName = 'default', this.limit = 20});

  @override
  @JsonKey()
  final String profileName;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'SearchEvent.getSearchHistory(profileName: $profileName, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchHistoryImpl &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName, limit);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchHistoryImplCopyWith<_$GetSearchHistoryImpl> get copyWith =>
      __$$GetSearchHistoryImplCopyWithImpl<_$GetSearchHistoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? filter, String serviceType)
        getSearchResult,
    required TResult Function(
            String query, String? filter, String? nextPage, String serviceType)
        getMoreSearchResult,
    required TResult Function(String query, String serviceType)
        getSearchSuggestion,
    required TResult Function(String profileName, int limit) getSearchHistory,
    required TResult Function(String query, String profileName) saveSearchQuery,
    required TResult Function(String query, String profileName)
        deleteSearchQuery,
    required TResult Function(String profileName) clearSearchHistory,
  }) {
    return getSearchHistory(profileName, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult? Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult? Function(String query, String serviceType)? getSearchSuggestion,
    TResult? Function(String profileName, int limit)? getSearchHistory,
    TResult? Function(String query, String profileName)? saveSearchQuery,
    TResult? Function(String query, String profileName)? deleteSearchQuery,
    TResult? Function(String profileName)? clearSearchHistory,
  }) {
    return getSearchHistory?.call(profileName, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult Function(String query, String serviceType)? getSearchSuggestion,
    TResult Function(String profileName, int limit)? getSearchHistory,
    TResult Function(String query, String profileName)? saveSearchQuery,
    TResult Function(String query, String profileName)? deleteSearchQuery,
    TResult Function(String profileName)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (getSearchHistory != null) {
      return getSearchHistory(profileName, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSearchResult value) getSearchResult,
    required TResult Function(GetMoreSearchResult value) getMoreSearchResult,
    required TResult Function(GetSearchSuggestion value) getSearchSuggestion,
    required TResult Function(GetSearchHistory value) getSearchHistory,
    required TResult Function(SaveSearchQuery value) saveSearchQuery,
    required TResult Function(DeleteSearchQuery value) deleteSearchQuery,
    required TResult Function(ClearSearchHistory value) clearSearchHistory,
  }) {
    return getSearchHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSearchResult value)? getSearchResult,
    TResult? Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult? Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult? Function(GetSearchHistory value)? getSearchHistory,
    TResult? Function(SaveSearchQuery value)? saveSearchQuery,
    TResult? Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult? Function(ClearSearchHistory value)? clearSearchHistory,
  }) {
    return getSearchHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSearchResult value)? getSearchResult,
    TResult Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult Function(GetSearchHistory value)? getSearchHistory,
    TResult Function(SaveSearchQuery value)? saveSearchQuery,
    TResult Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult Function(ClearSearchHistory value)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (getSearchHistory != null) {
      return getSearchHistory(this);
    }
    return orElse();
  }
}

abstract class GetSearchHistory implements SearchEvent {
  const factory GetSearchHistory({final String profileName, final int limit}) =
      _$GetSearchHistoryImpl;

  String get profileName;
  int get limit;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSearchHistoryImplCopyWith<_$GetSearchHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SaveSearchQueryImplCopyWith<$Res> {
  factory _$$SaveSearchQueryImplCopyWith(_$SaveSearchQueryImpl value,
          $Res Function(_$SaveSearchQueryImpl) then) =
      __$$SaveSearchQueryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query, String profileName});
}

/// @nodoc
class __$$SaveSearchQueryImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SaveSearchQueryImpl>
    implements _$$SaveSearchQueryImplCopyWith<$Res> {
  __$$SaveSearchQueryImplCopyWithImpl(
      _$SaveSearchQueryImpl _value, $Res Function(_$SaveSearchQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? profileName = null,
  }) {
    return _then(_$SaveSearchQueryImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      profileName: null == profileName
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SaveSearchQueryImpl implements SaveSearchQuery {
  const _$SaveSearchQueryImpl(
      {required this.query, this.profileName = 'default'});

  @override
  final String query;
  @override
  @JsonKey()
  final String profileName;

  @override
  String toString() {
    return 'SearchEvent.saveSearchQuery(query: $query, profileName: $profileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveSearchQueryImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, profileName);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveSearchQueryImplCopyWith<_$SaveSearchQueryImpl> get copyWith =>
      __$$SaveSearchQueryImplCopyWithImpl<_$SaveSearchQueryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? filter, String serviceType)
        getSearchResult,
    required TResult Function(
            String query, String? filter, String? nextPage, String serviceType)
        getMoreSearchResult,
    required TResult Function(String query, String serviceType)
        getSearchSuggestion,
    required TResult Function(String profileName, int limit) getSearchHistory,
    required TResult Function(String query, String profileName) saveSearchQuery,
    required TResult Function(String query, String profileName)
        deleteSearchQuery,
    required TResult Function(String profileName) clearSearchHistory,
  }) {
    return saveSearchQuery(query, profileName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult? Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult? Function(String query, String serviceType)? getSearchSuggestion,
    TResult? Function(String profileName, int limit)? getSearchHistory,
    TResult? Function(String query, String profileName)? saveSearchQuery,
    TResult? Function(String query, String profileName)? deleteSearchQuery,
    TResult? Function(String profileName)? clearSearchHistory,
  }) {
    return saveSearchQuery?.call(query, profileName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult Function(String query, String serviceType)? getSearchSuggestion,
    TResult Function(String profileName, int limit)? getSearchHistory,
    TResult Function(String query, String profileName)? saveSearchQuery,
    TResult Function(String query, String profileName)? deleteSearchQuery,
    TResult Function(String profileName)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (saveSearchQuery != null) {
      return saveSearchQuery(query, profileName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSearchResult value) getSearchResult,
    required TResult Function(GetMoreSearchResult value) getMoreSearchResult,
    required TResult Function(GetSearchSuggestion value) getSearchSuggestion,
    required TResult Function(GetSearchHistory value) getSearchHistory,
    required TResult Function(SaveSearchQuery value) saveSearchQuery,
    required TResult Function(DeleteSearchQuery value) deleteSearchQuery,
    required TResult Function(ClearSearchHistory value) clearSearchHistory,
  }) {
    return saveSearchQuery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSearchResult value)? getSearchResult,
    TResult? Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult? Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult? Function(GetSearchHistory value)? getSearchHistory,
    TResult? Function(SaveSearchQuery value)? saveSearchQuery,
    TResult? Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult? Function(ClearSearchHistory value)? clearSearchHistory,
  }) {
    return saveSearchQuery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSearchResult value)? getSearchResult,
    TResult Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult Function(GetSearchHistory value)? getSearchHistory,
    TResult Function(SaveSearchQuery value)? saveSearchQuery,
    TResult Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult Function(ClearSearchHistory value)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (saveSearchQuery != null) {
      return saveSearchQuery(this);
    }
    return orElse();
  }
}

abstract class SaveSearchQuery implements SearchEvent {
  const factory SaveSearchQuery(
      {required final String query,
      final String profileName}) = _$SaveSearchQueryImpl;

  String get query;
  String get profileName;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveSearchQueryImplCopyWith<_$SaveSearchQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSearchQueryImplCopyWith<$Res> {
  factory _$$DeleteSearchQueryImplCopyWith(_$DeleteSearchQueryImpl value,
          $Res Function(_$DeleteSearchQueryImpl) then) =
      __$$DeleteSearchQueryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query, String profileName});
}

/// @nodoc
class __$$DeleteSearchQueryImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$DeleteSearchQueryImpl>
    implements _$$DeleteSearchQueryImplCopyWith<$Res> {
  __$$DeleteSearchQueryImplCopyWithImpl(_$DeleteSearchQueryImpl _value,
      $Res Function(_$DeleteSearchQueryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? profileName = null,
  }) {
    return _then(_$DeleteSearchQueryImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      profileName: null == profileName
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteSearchQueryImpl implements DeleteSearchQuery {
  const _$DeleteSearchQueryImpl(
      {required this.query, this.profileName = 'default'});

  @override
  final String query;
  @override
  @JsonKey()
  final String profileName;

  @override
  String toString() {
    return 'SearchEvent.deleteSearchQuery(query: $query, profileName: $profileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSearchQueryImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, profileName);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSearchQueryImplCopyWith<_$DeleteSearchQueryImpl> get copyWith =>
      __$$DeleteSearchQueryImplCopyWithImpl<_$DeleteSearchQueryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? filter, String serviceType)
        getSearchResult,
    required TResult Function(
            String query, String? filter, String? nextPage, String serviceType)
        getMoreSearchResult,
    required TResult Function(String query, String serviceType)
        getSearchSuggestion,
    required TResult Function(String profileName, int limit) getSearchHistory,
    required TResult Function(String query, String profileName) saveSearchQuery,
    required TResult Function(String query, String profileName)
        deleteSearchQuery,
    required TResult Function(String profileName) clearSearchHistory,
  }) {
    return deleteSearchQuery(query, profileName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult? Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult? Function(String query, String serviceType)? getSearchSuggestion,
    TResult? Function(String profileName, int limit)? getSearchHistory,
    TResult? Function(String query, String profileName)? saveSearchQuery,
    TResult? Function(String query, String profileName)? deleteSearchQuery,
    TResult? Function(String profileName)? clearSearchHistory,
  }) {
    return deleteSearchQuery?.call(query, profileName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult Function(String query, String serviceType)? getSearchSuggestion,
    TResult Function(String profileName, int limit)? getSearchHistory,
    TResult Function(String query, String profileName)? saveSearchQuery,
    TResult Function(String query, String profileName)? deleteSearchQuery,
    TResult Function(String profileName)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (deleteSearchQuery != null) {
      return deleteSearchQuery(query, profileName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSearchResult value) getSearchResult,
    required TResult Function(GetMoreSearchResult value) getMoreSearchResult,
    required TResult Function(GetSearchSuggestion value) getSearchSuggestion,
    required TResult Function(GetSearchHistory value) getSearchHistory,
    required TResult Function(SaveSearchQuery value) saveSearchQuery,
    required TResult Function(DeleteSearchQuery value) deleteSearchQuery,
    required TResult Function(ClearSearchHistory value) clearSearchHistory,
  }) {
    return deleteSearchQuery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSearchResult value)? getSearchResult,
    TResult? Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult? Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult? Function(GetSearchHistory value)? getSearchHistory,
    TResult? Function(SaveSearchQuery value)? saveSearchQuery,
    TResult? Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult? Function(ClearSearchHistory value)? clearSearchHistory,
  }) {
    return deleteSearchQuery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSearchResult value)? getSearchResult,
    TResult Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult Function(GetSearchHistory value)? getSearchHistory,
    TResult Function(SaveSearchQuery value)? saveSearchQuery,
    TResult Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult Function(ClearSearchHistory value)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (deleteSearchQuery != null) {
      return deleteSearchQuery(this);
    }
    return orElse();
  }
}

abstract class DeleteSearchQuery implements SearchEvent {
  const factory DeleteSearchQuery(
      {required final String query,
      final String profileName}) = _$DeleteSearchQueryImpl;

  String get query;
  String get profileName;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteSearchQueryImplCopyWith<_$DeleteSearchQueryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchHistoryImplCopyWith<$Res> {
  factory _$$ClearSearchHistoryImplCopyWith(_$ClearSearchHistoryImpl value,
          $Res Function(_$ClearSearchHistoryImpl) then) =
      __$$ClearSearchHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String profileName});
}

/// @nodoc
class __$$ClearSearchHistoryImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$ClearSearchHistoryImpl>
    implements _$$ClearSearchHistoryImplCopyWith<$Res> {
  __$$ClearSearchHistoryImplCopyWithImpl(_$ClearSearchHistoryImpl _value,
      $Res Function(_$ClearSearchHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileName = null,
  }) {
    return _then(_$ClearSearchHistoryImpl(
      profileName: null == profileName
          ? _value.profileName
          : profileName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ClearSearchHistoryImpl implements ClearSearchHistory {
  const _$ClearSearchHistoryImpl({this.profileName = 'default'});

  @override
  @JsonKey()
  final String profileName;

  @override
  String toString() {
    return 'SearchEvent.clearSearchHistory(profileName: $profileName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearSearchHistoryImpl &&
            (identical(other.profileName, profileName) ||
                other.profileName == profileName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileName);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearSearchHistoryImplCopyWith<_$ClearSearchHistoryImpl> get copyWith =>
      __$$ClearSearchHistoryImplCopyWithImpl<_$ClearSearchHistoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query, String? filter, String serviceType)
        getSearchResult,
    required TResult Function(
            String query, String? filter, String? nextPage, String serviceType)
        getMoreSearchResult,
    required TResult Function(String query, String serviceType)
        getSearchSuggestion,
    required TResult Function(String profileName, int limit) getSearchHistory,
    required TResult Function(String query, String profileName) saveSearchQuery,
    required TResult Function(String query, String profileName)
        deleteSearchQuery,
    required TResult Function(String profileName) clearSearchHistory,
  }) {
    return clearSearchHistory(profileName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult? Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult? Function(String query, String serviceType)? getSearchSuggestion,
    TResult? Function(String profileName, int limit)? getSearchHistory,
    TResult? Function(String query, String profileName)? saveSearchQuery,
    TResult? Function(String query, String profileName)? deleteSearchQuery,
    TResult? Function(String profileName)? clearSearchHistory,
  }) {
    return clearSearchHistory?.call(profileName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query, String? filter, String serviceType)?
        getSearchResult,
    TResult Function(
            String query, String? filter, String? nextPage, String serviceType)?
        getMoreSearchResult,
    TResult Function(String query, String serviceType)? getSearchSuggestion,
    TResult Function(String profileName, int limit)? getSearchHistory,
    TResult Function(String query, String profileName)? saveSearchQuery,
    TResult Function(String query, String profileName)? deleteSearchQuery,
    TResult Function(String profileName)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (clearSearchHistory != null) {
      return clearSearchHistory(profileName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSearchResult value) getSearchResult,
    required TResult Function(GetMoreSearchResult value) getMoreSearchResult,
    required TResult Function(GetSearchSuggestion value) getSearchSuggestion,
    required TResult Function(GetSearchHistory value) getSearchHistory,
    required TResult Function(SaveSearchQuery value) saveSearchQuery,
    required TResult Function(DeleteSearchQuery value) deleteSearchQuery,
    required TResult Function(ClearSearchHistory value) clearSearchHistory,
  }) {
    return clearSearchHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSearchResult value)? getSearchResult,
    TResult? Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult? Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult? Function(GetSearchHistory value)? getSearchHistory,
    TResult? Function(SaveSearchQuery value)? saveSearchQuery,
    TResult? Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult? Function(ClearSearchHistory value)? clearSearchHistory,
  }) {
    return clearSearchHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSearchResult value)? getSearchResult,
    TResult Function(GetMoreSearchResult value)? getMoreSearchResult,
    TResult Function(GetSearchSuggestion value)? getSearchSuggestion,
    TResult Function(GetSearchHistory value)? getSearchHistory,
    TResult Function(SaveSearchQuery value)? saveSearchQuery,
    TResult Function(DeleteSearchQuery value)? deleteSearchQuery,
    TResult Function(ClearSearchHistory value)? clearSearchHistory,
    required TResult orElse(),
  }) {
    if (clearSearchHistory != null) {
      return clearSearchHistory(this);
    }
    return orElse();
  }
}

abstract class ClearSearchHistory implements SearchEvent {
  const factory ClearSearchHistory({final String profileName}) =
      _$ClearSearchHistoryImpl;

  String get profileName;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClearSearchHistoryImplCopyWith<_$ClearSearchHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchState {
//
  bool get isSuggestionDisplay => throw _privateConstructorUsedError; // PIPED
  ApiStatus get fetchSearchResultStatus => throw _privateConstructorUsedError;
  SearchResp? get result => throw _privateConstructorUsedError;
  ApiStatus get fetchSuggestionStatus => throw _privateConstructorUsedError;
  List<dynamic> get suggestions => throw _privateConstructorUsedError;
  ApiStatus get fetchMoreSearchResultStatus =>
      throw _privateConstructorUsedError;
  bool get isMoreFetchCompleted =>
      throw _privateConstructorUsedError; // INVIDIOUS
  ApiStatus get fetchInvidiousSearchResultStatus =>
      throw _privateConstructorUsedError;
  List<InvidiousSearchResp> get invidiousSearchResult =>
      throw _privateConstructorUsedError;
  ApiStatus get fetchInvidiousSuggestionStatus =>
      throw _privateConstructorUsedError;
  List<dynamic> get invidiousSuggestionResult =>
      throw _privateConstructorUsedError;
  ApiStatus get fetchMoreInvidiousSearchResultStatus =>
      throw _privateConstructorUsedError;
  bool get isMoreInvidiousFetchCompleted => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError; // NEWPIPE
  ApiStatus get fetchNewPipeSearchResultStatus =>
      throw _privateConstructorUsedError;
  NewPipeSearchResp? get newPipeSearchResult =>
      throw _privateConstructorUsedError;
  ApiStatus get fetchNewPipeSuggestionStatus =>
      throw _privateConstructorUsedError;
  List<dynamic> get newPipeSuggestionResult =>
      throw _privateConstructorUsedError;
  ApiStatus get fetchMoreNewPipeSearchResultStatus =>
      throw _privateConstructorUsedError;
  bool get isMoreNewPipeFetchCompleted =>
      throw _privateConstructorUsedError; // SEARCH HISTORY
  ApiStatus get fetchSearchHistoryStatus => throw _privateConstructorUsedError;
  List<LocalSearchHistory> get searchHistory =>
      throw _privateConstructorUsedError;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {bool isSuggestionDisplay,
      ApiStatus fetchSearchResultStatus,
      SearchResp? result,
      ApiStatus fetchSuggestionStatus,
      List<dynamic> suggestions,
      ApiStatus fetchMoreSearchResultStatus,
      bool isMoreFetchCompleted,
      ApiStatus fetchInvidiousSearchResultStatus,
      List<InvidiousSearchResp> invidiousSearchResult,
      ApiStatus fetchInvidiousSuggestionStatus,
      List<dynamic> invidiousSuggestionResult,
      ApiStatus fetchMoreInvidiousSearchResultStatus,
      bool isMoreInvidiousFetchCompleted,
      int? page,
      ApiStatus fetchNewPipeSearchResultStatus,
      NewPipeSearchResp? newPipeSearchResult,
      ApiStatus fetchNewPipeSuggestionStatus,
      List<dynamic> newPipeSuggestionResult,
      ApiStatus fetchMoreNewPipeSearchResultStatus,
      bool isMoreNewPipeFetchCompleted,
      ApiStatus fetchSearchHistoryStatus,
      List<LocalSearchHistory> searchHistory});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuggestionDisplay = null,
    Object? fetchSearchResultStatus = null,
    Object? result = freezed,
    Object? fetchSuggestionStatus = null,
    Object? suggestions = null,
    Object? fetchMoreSearchResultStatus = null,
    Object? isMoreFetchCompleted = null,
    Object? fetchInvidiousSearchResultStatus = null,
    Object? invidiousSearchResult = null,
    Object? fetchInvidiousSuggestionStatus = null,
    Object? invidiousSuggestionResult = null,
    Object? fetchMoreInvidiousSearchResultStatus = null,
    Object? isMoreInvidiousFetchCompleted = null,
    Object? page = freezed,
    Object? fetchNewPipeSearchResultStatus = null,
    Object? newPipeSearchResult = freezed,
    Object? fetchNewPipeSuggestionStatus = null,
    Object? newPipeSuggestionResult = null,
    Object? fetchMoreNewPipeSearchResultStatus = null,
    Object? isMoreNewPipeFetchCompleted = null,
    Object? fetchSearchHistoryStatus = null,
    Object? searchHistory = null,
  }) {
    return _then(_value.copyWith(
      isSuggestionDisplay: null == isSuggestionDisplay
          ? _value.isSuggestionDisplay
          : isSuggestionDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchSearchResultStatus: null == fetchSearchResultStatus
          ? _value.fetchSearchResultStatus
          : fetchSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as SearchResp?,
      fetchSuggestionStatus: null == fetchSuggestionStatus
          ? _value.fetchSuggestionStatus
          : fetchSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      fetchMoreSearchResultStatus: null == fetchMoreSearchResultStatus
          ? _value.fetchMoreSearchResultStatus
          : fetchMoreSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreFetchCompleted: null == isMoreFetchCompleted
          ? _value.isMoreFetchCompleted
          : isMoreFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchInvidiousSearchResultStatus: null == fetchInvidiousSearchResultStatus
          ? _value.fetchInvidiousSearchResultStatus
          : fetchInvidiousSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousSearchResult: null == invidiousSearchResult
          ? _value.invidiousSearchResult
          : invidiousSearchResult // ignore: cast_nullable_to_non_nullable
              as List<InvidiousSearchResp>,
      fetchInvidiousSuggestionStatus: null == fetchInvidiousSuggestionStatus
          ? _value.fetchInvidiousSuggestionStatus
          : fetchInvidiousSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousSuggestionResult: null == invidiousSuggestionResult
          ? _value.invidiousSuggestionResult
          : invidiousSuggestionResult // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      fetchMoreInvidiousSearchResultStatus: null ==
              fetchMoreInvidiousSearchResultStatus
          ? _value.fetchMoreInvidiousSearchResultStatus
          : fetchMoreInvidiousSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreInvidiousFetchCompleted: null == isMoreInvidiousFetchCompleted
          ? _value.isMoreInvidiousFetchCompleted
          : isMoreInvidiousFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      fetchNewPipeSearchResultStatus: null == fetchNewPipeSearchResultStatus
          ? _value.fetchNewPipeSearchResultStatus
          : fetchNewPipeSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeSearchResult: freezed == newPipeSearchResult
          ? _value.newPipeSearchResult
          : newPipeSearchResult // ignore: cast_nullable_to_non_nullable
              as NewPipeSearchResp?,
      fetchNewPipeSuggestionStatus: null == fetchNewPipeSuggestionStatus
          ? _value.fetchNewPipeSuggestionStatus
          : fetchNewPipeSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeSuggestionResult: null == newPipeSuggestionResult
          ? _value.newPipeSuggestionResult
          : newPipeSuggestionResult // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      fetchMoreNewPipeSearchResultStatus: null ==
              fetchMoreNewPipeSearchResultStatus
          ? _value.fetchMoreNewPipeSearchResultStatus
          : fetchMoreNewPipeSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreNewPipeFetchCompleted: null == isMoreNewPipeFetchCompleted
          ? _value.isMoreNewPipeFetchCompleted
          : isMoreNewPipeFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchSearchHistoryStatus: null == fetchSearchHistoryStatus
          ? _value.fetchSearchHistoryStatus
          : fetchSearchHistoryStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      searchHistory: null == searchHistory
          ? _value.searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<LocalSearchHistory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSuggestionDisplay,
      ApiStatus fetchSearchResultStatus,
      SearchResp? result,
      ApiStatus fetchSuggestionStatus,
      List<dynamic> suggestions,
      ApiStatus fetchMoreSearchResultStatus,
      bool isMoreFetchCompleted,
      ApiStatus fetchInvidiousSearchResultStatus,
      List<InvidiousSearchResp> invidiousSearchResult,
      ApiStatus fetchInvidiousSuggestionStatus,
      List<dynamic> invidiousSuggestionResult,
      ApiStatus fetchMoreInvidiousSearchResultStatus,
      bool isMoreInvidiousFetchCompleted,
      int? page,
      ApiStatus fetchNewPipeSearchResultStatus,
      NewPipeSearchResp? newPipeSearchResult,
      ApiStatus fetchNewPipeSuggestionStatus,
      List<dynamic> newPipeSuggestionResult,
      ApiStatus fetchMoreNewPipeSearchResultStatus,
      bool isMoreNewPipeFetchCompleted,
      ApiStatus fetchSearchHistoryStatus,
      List<LocalSearchHistory> searchHistory});
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuggestionDisplay = null,
    Object? fetchSearchResultStatus = null,
    Object? result = freezed,
    Object? fetchSuggestionStatus = null,
    Object? suggestions = null,
    Object? fetchMoreSearchResultStatus = null,
    Object? isMoreFetchCompleted = null,
    Object? fetchInvidiousSearchResultStatus = null,
    Object? invidiousSearchResult = null,
    Object? fetchInvidiousSuggestionStatus = null,
    Object? invidiousSuggestionResult = null,
    Object? fetchMoreInvidiousSearchResultStatus = null,
    Object? isMoreInvidiousFetchCompleted = null,
    Object? page = freezed,
    Object? fetchNewPipeSearchResultStatus = null,
    Object? newPipeSearchResult = freezed,
    Object? fetchNewPipeSuggestionStatus = null,
    Object? newPipeSuggestionResult = null,
    Object? fetchMoreNewPipeSearchResultStatus = null,
    Object? isMoreNewPipeFetchCompleted = null,
    Object? fetchSearchHistoryStatus = null,
    Object? searchHistory = null,
  }) {
    return _then(_$SearchStateImpl(
      isSuggestionDisplay: null == isSuggestionDisplay
          ? _value.isSuggestionDisplay
          : isSuggestionDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchSearchResultStatus: null == fetchSearchResultStatus
          ? _value.fetchSearchResultStatus
          : fetchSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as SearchResp?,
      fetchSuggestionStatus: null == fetchSuggestionStatus
          ? _value.fetchSuggestionStatus
          : fetchSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      fetchMoreSearchResultStatus: null == fetchMoreSearchResultStatus
          ? _value.fetchMoreSearchResultStatus
          : fetchMoreSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreFetchCompleted: null == isMoreFetchCompleted
          ? _value.isMoreFetchCompleted
          : isMoreFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchInvidiousSearchResultStatus: null == fetchInvidiousSearchResultStatus
          ? _value.fetchInvidiousSearchResultStatus
          : fetchInvidiousSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousSearchResult: null == invidiousSearchResult
          ? _value._invidiousSearchResult
          : invidiousSearchResult // ignore: cast_nullable_to_non_nullable
              as List<InvidiousSearchResp>,
      fetchInvidiousSuggestionStatus: null == fetchInvidiousSuggestionStatus
          ? _value.fetchInvidiousSuggestionStatus
          : fetchInvidiousSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      invidiousSuggestionResult: null == invidiousSuggestionResult
          ? _value._invidiousSuggestionResult
          : invidiousSuggestionResult // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      fetchMoreInvidiousSearchResultStatus: null ==
              fetchMoreInvidiousSearchResultStatus
          ? _value.fetchMoreInvidiousSearchResultStatus
          : fetchMoreInvidiousSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreInvidiousFetchCompleted: null == isMoreInvidiousFetchCompleted
          ? _value.isMoreInvidiousFetchCompleted
          : isMoreInvidiousFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      fetchNewPipeSearchResultStatus: null == fetchNewPipeSearchResultStatus
          ? _value.fetchNewPipeSearchResultStatus
          : fetchNewPipeSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeSearchResult: freezed == newPipeSearchResult
          ? _value.newPipeSearchResult
          : newPipeSearchResult // ignore: cast_nullable_to_non_nullable
              as NewPipeSearchResp?,
      fetchNewPipeSuggestionStatus: null == fetchNewPipeSuggestionStatus
          ? _value.fetchNewPipeSuggestionStatus
          : fetchNewPipeSuggestionStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      newPipeSuggestionResult: null == newPipeSuggestionResult
          ? _value._newPipeSuggestionResult
          : newPipeSuggestionResult // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      fetchMoreNewPipeSearchResultStatus: null ==
              fetchMoreNewPipeSearchResultStatus
          ? _value.fetchMoreNewPipeSearchResultStatus
          : fetchMoreNewPipeSearchResultStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      isMoreNewPipeFetchCompleted: null == isMoreNewPipeFetchCompleted
          ? _value.isMoreNewPipeFetchCompleted
          : isMoreNewPipeFetchCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      fetchSearchHistoryStatus: null == fetchSearchHistoryStatus
          ? _value.fetchSearchHistoryStatus
          : fetchSearchHistoryStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus,
      searchHistory: null == searchHistory
          ? _value._searchHistory
          : searchHistory // ignore: cast_nullable_to_non_nullable
              as List<LocalSearchHistory>,
    ));
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl(
      {required this.isSuggestionDisplay,
      required this.fetchSearchResultStatus,
      required this.result,
      required this.fetchSuggestionStatus,
      required final List<dynamic> suggestions,
      required this.fetchMoreSearchResultStatus,
      required this.isMoreFetchCompleted,
      required this.fetchInvidiousSearchResultStatus,
      required final List<InvidiousSearchResp> invidiousSearchResult,
      required this.fetchInvidiousSuggestionStatus,
      required final List<dynamic> invidiousSuggestionResult,
      required this.fetchMoreInvidiousSearchResultStatus,
      required this.isMoreInvidiousFetchCompleted,
      this.page,
      required this.fetchNewPipeSearchResultStatus,
      required this.newPipeSearchResult,
      required this.fetchNewPipeSuggestionStatus,
      required final List<dynamic> newPipeSuggestionResult,
      required this.fetchMoreNewPipeSearchResultStatus,
      required this.isMoreNewPipeFetchCompleted,
      required this.fetchSearchHistoryStatus,
      required final List<LocalSearchHistory> searchHistory})
      : _suggestions = suggestions,
        _invidiousSearchResult = invidiousSearchResult,
        _invidiousSuggestionResult = invidiousSuggestionResult,
        _newPipeSuggestionResult = newPipeSuggestionResult,
        _searchHistory = searchHistory;

//
  @override
  final bool isSuggestionDisplay;
// PIPED
  @override
  final ApiStatus fetchSearchResultStatus;
  @override
  final SearchResp? result;
  @override
  final ApiStatus fetchSuggestionStatus;
  final List<dynamic> _suggestions;
  @override
  List<dynamic> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  final ApiStatus fetchMoreSearchResultStatus;
  @override
  final bool isMoreFetchCompleted;
// INVIDIOUS
  @override
  final ApiStatus fetchInvidiousSearchResultStatus;
  final List<InvidiousSearchResp> _invidiousSearchResult;
  @override
  List<InvidiousSearchResp> get invidiousSearchResult {
    if (_invidiousSearchResult is EqualUnmodifiableListView)
      return _invidiousSearchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invidiousSearchResult);
  }

  @override
  final ApiStatus fetchInvidiousSuggestionStatus;
  final List<dynamic> _invidiousSuggestionResult;
  @override
  List<dynamic> get invidiousSuggestionResult {
    if (_invidiousSuggestionResult is EqualUnmodifiableListView)
      return _invidiousSuggestionResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invidiousSuggestionResult);
  }

  @override
  final ApiStatus fetchMoreInvidiousSearchResultStatus;
  @override
  final bool isMoreInvidiousFetchCompleted;
  @override
  final int? page;
// NEWPIPE
  @override
  final ApiStatus fetchNewPipeSearchResultStatus;
  @override
  final NewPipeSearchResp? newPipeSearchResult;
  @override
  final ApiStatus fetchNewPipeSuggestionStatus;
  final List<dynamic> _newPipeSuggestionResult;
  @override
  List<dynamic> get newPipeSuggestionResult {
    if (_newPipeSuggestionResult is EqualUnmodifiableListView)
      return _newPipeSuggestionResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newPipeSuggestionResult);
  }

  @override
  final ApiStatus fetchMoreNewPipeSearchResultStatus;
  @override
  final bool isMoreNewPipeFetchCompleted;
// SEARCH HISTORY
  @override
  final ApiStatus fetchSearchHistoryStatus;
  final List<LocalSearchHistory> _searchHistory;
  @override
  List<LocalSearchHistory> get searchHistory {
    if (_searchHistory is EqualUnmodifiableListView) return _searchHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchHistory);
  }

  @override
  String toString() {
    return 'SearchState(isSuggestionDisplay: $isSuggestionDisplay, fetchSearchResultStatus: $fetchSearchResultStatus, result: $result, fetchSuggestionStatus: $fetchSuggestionStatus, suggestions: $suggestions, fetchMoreSearchResultStatus: $fetchMoreSearchResultStatus, isMoreFetchCompleted: $isMoreFetchCompleted, fetchInvidiousSearchResultStatus: $fetchInvidiousSearchResultStatus, invidiousSearchResult: $invidiousSearchResult, fetchInvidiousSuggestionStatus: $fetchInvidiousSuggestionStatus, invidiousSuggestionResult: $invidiousSuggestionResult, fetchMoreInvidiousSearchResultStatus: $fetchMoreInvidiousSearchResultStatus, isMoreInvidiousFetchCompleted: $isMoreInvidiousFetchCompleted, page: $page, fetchNewPipeSearchResultStatus: $fetchNewPipeSearchResultStatus, newPipeSearchResult: $newPipeSearchResult, fetchNewPipeSuggestionStatus: $fetchNewPipeSuggestionStatus, newPipeSuggestionResult: $newPipeSuggestionResult, fetchMoreNewPipeSearchResultStatus: $fetchMoreNewPipeSearchResultStatus, isMoreNewPipeFetchCompleted: $isMoreNewPipeFetchCompleted, fetchSearchHistoryStatus: $fetchSearchHistoryStatus, searchHistory: $searchHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.isSuggestionDisplay, isSuggestionDisplay) ||
                other.isSuggestionDisplay == isSuggestionDisplay) &&
            (identical(other.fetchSearchResultStatus, fetchSearchResultStatus) ||
                other.fetchSearchResultStatus == fetchSearchResultStatus) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.fetchSuggestionStatus, fetchSuggestionStatus) ||
                other.fetchSuggestionStatus == fetchSuggestionStatus) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            (identical(other.fetchMoreSearchResultStatus, fetchMoreSearchResultStatus) ||
                other.fetchMoreSearchResultStatus ==
                    fetchMoreSearchResultStatus) &&
            (identical(other.isMoreFetchCompleted, isMoreFetchCompleted) ||
                other.isMoreFetchCompleted == isMoreFetchCompleted) &&
            (identical(other.fetchInvidiousSearchResultStatus, fetchInvidiousSearchResultStatus) ||
                other.fetchInvidiousSearchResultStatus ==
                    fetchInvidiousSearchResultStatus) &&
            const DeepCollectionEquality()
                .equals(other._invidiousSearchResult, _invidiousSearchResult) &&
            (identical(other.fetchInvidiousSuggestionStatus, fetchInvidiousSuggestionStatus) ||
                other.fetchInvidiousSuggestionStatus ==
                    fetchInvidiousSuggestionStatus) &&
            const DeepCollectionEquality().equals(
                other._invidiousSuggestionResult, _invidiousSuggestionResult) &&
            (identical(other.fetchMoreInvidiousSearchResultStatus, fetchMoreInvidiousSearchResultStatus) ||
                other.fetchMoreInvidiousSearchResultStatus ==
                    fetchMoreInvidiousSearchResultStatus) &&
            (identical(other.isMoreInvidiousFetchCompleted, isMoreInvidiousFetchCompleted) ||
                other.isMoreInvidiousFetchCompleted ==
                    isMoreInvidiousFetchCompleted) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.fetchNewPipeSearchResultStatus, fetchNewPipeSearchResultStatus) ||
                other.fetchNewPipeSearchResultStatus ==
                    fetchNewPipeSearchResultStatus) &&
            (identical(other.newPipeSearchResult, newPipeSearchResult) ||
                other.newPipeSearchResult == newPipeSearchResult) &&
            (identical(other.fetchNewPipeSuggestionStatus, fetchNewPipeSuggestionStatus) ||
                other.fetchNewPipeSuggestionStatus ==
                    fetchNewPipeSuggestionStatus) &&
            const DeepCollectionEquality()
                .equals(other._newPipeSuggestionResult, _newPipeSuggestionResult) &&
            (identical(other.fetchMoreNewPipeSearchResultStatus, fetchMoreNewPipeSearchResultStatus) || other.fetchMoreNewPipeSearchResultStatus == fetchMoreNewPipeSearchResultStatus) &&
            (identical(other.isMoreNewPipeFetchCompleted, isMoreNewPipeFetchCompleted) || other.isMoreNewPipeFetchCompleted == isMoreNewPipeFetchCompleted) &&
            (identical(other.fetchSearchHistoryStatus, fetchSearchHistoryStatus) || other.fetchSearchHistoryStatus == fetchSearchHistoryStatus) &&
            const DeepCollectionEquality().equals(other._searchHistory, _searchHistory));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isSuggestionDisplay,
        fetchSearchResultStatus,
        result,
        fetchSuggestionStatus,
        const DeepCollectionEquality().hash(_suggestions),
        fetchMoreSearchResultStatus,
        isMoreFetchCompleted,
        fetchInvidiousSearchResultStatus,
        const DeepCollectionEquality().hash(_invidiousSearchResult),
        fetchInvidiousSuggestionStatus,
        const DeepCollectionEquality().hash(_invidiousSuggestionResult),
        fetchMoreInvidiousSearchResultStatus,
        isMoreInvidiousFetchCompleted,
        page,
        fetchNewPipeSearchResultStatus,
        newPipeSearchResult,
        fetchNewPipeSuggestionStatus,
        const DeepCollectionEquality().hash(_newPipeSuggestionResult),
        fetchMoreNewPipeSearchResultStatus,
        isMoreNewPipeFetchCompleted,
        fetchSearchHistoryStatus,
        const DeepCollectionEquality().hash(_searchHistory)
      ]);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
          {required final bool isSuggestionDisplay,
          required final ApiStatus fetchSearchResultStatus,
          required final SearchResp? result,
          required final ApiStatus fetchSuggestionStatus,
          required final List<dynamic> suggestions,
          required final ApiStatus fetchMoreSearchResultStatus,
          required final bool isMoreFetchCompleted,
          required final ApiStatus fetchInvidiousSearchResultStatus,
          required final List<InvidiousSearchResp> invidiousSearchResult,
          required final ApiStatus fetchInvidiousSuggestionStatus,
          required final List<dynamic> invidiousSuggestionResult,
          required final ApiStatus fetchMoreInvidiousSearchResultStatus,
          required final bool isMoreInvidiousFetchCompleted,
          final int? page,
          required final ApiStatus fetchNewPipeSearchResultStatus,
          required final NewPipeSearchResp? newPipeSearchResult,
          required final ApiStatus fetchNewPipeSuggestionStatus,
          required final List<dynamic> newPipeSuggestionResult,
          required final ApiStatus fetchMoreNewPipeSearchResultStatus,
          required final bool isMoreNewPipeFetchCompleted,
          required final ApiStatus fetchSearchHistoryStatus,
          required final List<LocalSearchHistory> searchHistory}) =
      _$SearchStateImpl;

//
  @override
  bool get isSuggestionDisplay; // PIPED
  @override
  ApiStatus get fetchSearchResultStatus;
  @override
  SearchResp? get result;
  @override
  ApiStatus get fetchSuggestionStatus;
  @override
  List<dynamic> get suggestions;
  @override
  ApiStatus get fetchMoreSearchResultStatus;
  @override
  bool get isMoreFetchCompleted; // INVIDIOUS
  @override
  ApiStatus get fetchInvidiousSearchResultStatus;
  @override
  List<InvidiousSearchResp> get invidiousSearchResult;
  @override
  ApiStatus get fetchInvidiousSuggestionStatus;
  @override
  List<dynamic> get invidiousSuggestionResult;
  @override
  ApiStatus get fetchMoreInvidiousSearchResultStatus;
  @override
  bool get isMoreInvidiousFetchCompleted;
  @override
  int? get page; // NEWPIPE
  @override
  ApiStatus get fetchNewPipeSearchResultStatus;
  @override
  NewPipeSearchResp? get newPipeSearchResult;
  @override
  ApiStatus get fetchNewPipeSuggestionStatus;
  @override
  List<dynamic> get newPipeSuggestionResult;
  @override
  ApiStatus get fetchMoreNewPipeSearchResultStatus;
  @override
  bool get isMoreNewPipeFetchCompleted; // SEARCH HISTORY
  @override
  ApiStatus get fetchSearchHistoryStatus;
  @override
  List<LocalSearchHistory> get searchHistory;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
