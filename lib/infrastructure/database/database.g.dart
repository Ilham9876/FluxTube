// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SettingsEntriesTable extends SettingsEntries
    with TableInfo<$SettingsEntriesTable, SettingsEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings_entries';
  @override
  VerificationContext validateIntegrity(Insertable<SettingsEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value']),
    );
  }

  @override
  $SettingsEntriesTable createAlias(String alias) {
    return $SettingsEntriesTable(attachedDatabase, alias);
  }
}

class SettingsEntry extends DataClass implements Insertable<SettingsEntry> {
  final int id;
  final String name;
  final String? value;
  const SettingsEntry({required this.id, required this.name, this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<String>(value);
    }
    return map;
  }

  SettingsEntriesCompanion toCompanion(bool nullToAbsent) {
    return SettingsEntriesCompanion(
      id: Value(id),
      name: Value(name),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
    );
  }

  factory SettingsEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsEntry(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<String?>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<String?>(value),
    };
  }

  SettingsEntry copyWith(
          {int? id,
          String? name,
          Value<String?> value = const Value.absent()}) =>
      SettingsEntry(
        id: id ?? this.id,
        name: name ?? this.name,
        value: value.present ? value.value : this.value,
      );
  SettingsEntry copyWithCompanion(SettingsEntriesCompanion data) {
    return SettingsEntry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsEntry(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsEntry &&
          other.id == this.id &&
          other.name == this.name &&
          other.value == this.value);
}

class SettingsEntriesCompanion extends UpdateCompanion<SettingsEntry> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> value;
  const SettingsEntriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.value = const Value.absent(),
  });
  SettingsEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.value = const Value.absent(),
  }) : name = Value(name);
  static Insertable<SettingsEntry> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    });
  }

  SettingsEntriesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String?>? value}) {
    return SettingsEntriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsEntriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

class $LocalStoreVideosTable extends LocalStoreVideos
    with TableInfo<$LocalStoreVideosTable, LocalStoreVideo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocalStoreVideosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _videoIdMeta =
      const VerificationMeta('videoId');
  @override
  late final GeneratedColumn<String> videoId = GeneratedColumn<String>(
      'video_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileNameMeta =
      const VerificationMeta('profileName');
  @override
  late final GeneratedColumn<String> profileName = GeneratedColumn<String>(
      'profile_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int> views = GeneratedColumn<int>(
      'views', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _uploadedDateMeta =
      const VerificationMeta('uploadedDate');
  @override
  late final GeneratedColumn<String> uploadedDate = GeneratedColumn<String>(
      'uploaded_date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _uploaderNameMeta =
      const VerificationMeta('uploaderName');
  @override
  late final GeneratedColumn<String> uploaderName = GeneratedColumn<String>(
      'uploader_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _uploaderIdMeta =
      const VerificationMeta('uploaderId');
  @override
  late final GeneratedColumn<String> uploaderId = GeneratedColumn<String>(
      'uploader_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _uploaderAvatarMeta =
      const VerificationMeta('uploaderAvatar');
  @override
  late final GeneratedColumn<String> uploaderAvatar = GeneratedColumn<String>(
      'uploader_avatar', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _uploaderSubscriberCountMeta =
      const VerificationMeta('uploaderSubscriberCount');
  @override
  late final GeneratedColumn<String> uploaderSubscriberCount =
      GeneratedColumn<String>('uploader_subscriber_count', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _uploaderVerifiedMeta =
      const VerificationMeta('uploaderVerified');
  @override
  late final GeneratedColumn<bool> uploaderVerified = GeneratedColumn<bool>(
      'uploader_verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("uploader_verified" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isSavedMeta =
      const VerificationMeta('isSaved');
  @override
  late final GeneratedColumn<bool> isSaved = GeneratedColumn<bool>(
      'is_saved', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_saved" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isHistoryMeta =
      const VerificationMeta('isHistory');
  @override
  late final GeneratedColumn<bool> isHistory = GeneratedColumn<bool>(
      'is_history', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_history" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isLiveMeta = const VerificationMeta('isLive');
  @override
  late final GeneratedColumn<bool> isLive = GeneratedColumn<bool>(
      'is_live', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_live" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _playbackPositionMeta =
      const VerificationMeta('playbackPosition');
  @override
  late final GeneratedColumn<int> playbackPosition = GeneratedColumn<int>(
      'playback_position', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        videoId,
        profileName,
        title,
        views,
        thumbnail,
        uploadedDate,
        uploaderName,
        uploaderId,
        uploaderAvatar,
        uploaderSubscriberCount,
        duration,
        uploaderVerified,
        isSaved,
        isHistory,
        isLive,
        playbackPosition,
        time
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_store_videos';
  @override
  VerificationContext validateIntegrity(Insertable<LocalStoreVideo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('video_id')) {
      context.handle(_videoIdMeta,
          videoId.isAcceptableOrUnknown(data['video_id']!, _videoIdMeta));
    } else if (isInserting) {
      context.missing(_videoIdMeta);
    }
    if (data.containsKey('profile_name')) {
      context.handle(
          _profileNameMeta,
          profileName.isAcceptableOrUnknown(
              data['profile_name']!, _profileNameMeta));
    } else if (isInserting) {
      context.missing(_profileNameMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    }
    if (data.containsKey('uploaded_date')) {
      context.handle(
          _uploadedDateMeta,
          uploadedDate.isAcceptableOrUnknown(
              data['uploaded_date']!, _uploadedDateMeta));
    }
    if (data.containsKey('uploader_name')) {
      context.handle(
          _uploaderNameMeta,
          uploaderName.isAcceptableOrUnknown(
              data['uploader_name']!, _uploaderNameMeta));
    }
    if (data.containsKey('uploader_id')) {
      context.handle(
          _uploaderIdMeta,
          uploaderId.isAcceptableOrUnknown(
              data['uploader_id']!, _uploaderIdMeta));
    }
    if (data.containsKey('uploader_avatar')) {
      context.handle(
          _uploaderAvatarMeta,
          uploaderAvatar.isAcceptableOrUnknown(
              data['uploader_avatar']!, _uploaderAvatarMeta));
    }
    if (data.containsKey('uploader_subscriber_count')) {
      context.handle(
          _uploaderSubscriberCountMeta,
          uploaderSubscriberCount.isAcceptableOrUnknown(
              data['uploader_subscriber_count']!,
              _uploaderSubscriberCountMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('uploader_verified')) {
      context.handle(
          _uploaderVerifiedMeta,
          uploaderVerified.isAcceptableOrUnknown(
              data['uploader_verified']!, _uploaderVerifiedMeta));
    }
    if (data.containsKey('is_saved')) {
      context.handle(_isSavedMeta,
          isSaved.isAcceptableOrUnknown(data['is_saved']!, _isSavedMeta));
    }
    if (data.containsKey('is_history')) {
      context.handle(_isHistoryMeta,
          isHistory.isAcceptableOrUnknown(data['is_history']!, _isHistoryMeta));
    }
    if (data.containsKey('is_live')) {
      context.handle(_isLiveMeta,
          isLive.isAcceptableOrUnknown(data['is_live']!, _isLiveMeta));
    }
    if (data.containsKey('playback_position')) {
      context.handle(
          _playbackPositionMeta,
          playbackPosition.isAcceptableOrUnknown(
              data['playback_position']!, _playbackPositionMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {videoId, profileName},
      ];
  @override
  LocalStoreVideo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocalStoreVideo(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      videoId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_id'])!,
      profileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_name'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      views: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}views']),
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail']),
      uploadedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uploaded_date']),
      uploaderName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uploader_name']),
      uploaderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uploader_id']),
      uploaderAvatar: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uploader_avatar']),
      uploaderSubscriberCount: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}uploader_subscriber_count']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      uploaderVerified: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}uploader_verified'])!,
      isSaved: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_saved'])!,
      isHistory: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_history'])!,
      isLive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_live'])!,
      playbackPosition: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}playback_position']),
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time']),
    );
  }

  @override
  $LocalStoreVideosTable createAlias(String alias) {
    return $LocalStoreVideosTable(attachedDatabase, alias);
  }
}

class LocalStoreVideo extends DataClass implements Insertable<LocalStoreVideo> {
  final int id;
  final String videoId;
  final String profileName;
  final String? title;
  final int? views;
  final String? thumbnail;
  final String? uploadedDate;
  final String? uploaderName;
  final String? uploaderId;
  final String? uploaderAvatar;
  final String? uploaderSubscriberCount;
  final int? duration;
  final bool uploaderVerified;
  final bool isSaved;
  final bool isHistory;
  final bool isLive;
  final int? playbackPosition;
  final DateTime? time;
  const LocalStoreVideo(
      {required this.id,
      required this.videoId,
      required this.profileName,
      this.title,
      this.views,
      this.thumbnail,
      this.uploadedDate,
      this.uploaderName,
      this.uploaderId,
      this.uploaderAvatar,
      this.uploaderSubscriberCount,
      this.duration,
      required this.uploaderVerified,
      required this.isSaved,
      required this.isHistory,
      required this.isLive,
      this.playbackPosition,
      this.time});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['video_id'] = Variable<String>(videoId);
    map['profile_name'] = Variable<String>(profileName);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || views != null) {
      map['views'] = Variable<int>(views);
    }
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    if (!nullToAbsent || uploadedDate != null) {
      map['uploaded_date'] = Variable<String>(uploadedDate);
    }
    if (!nullToAbsent || uploaderName != null) {
      map['uploader_name'] = Variable<String>(uploaderName);
    }
    if (!nullToAbsent || uploaderId != null) {
      map['uploader_id'] = Variable<String>(uploaderId);
    }
    if (!nullToAbsent || uploaderAvatar != null) {
      map['uploader_avatar'] = Variable<String>(uploaderAvatar);
    }
    if (!nullToAbsent || uploaderSubscriberCount != null) {
      map['uploader_subscriber_count'] =
          Variable<String>(uploaderSubscriberCount);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    map['uploader_verified'] = Variable<bool>(uploaderVerified);
    map['is_saved'] = Variable<bool>(isSaved);
    map['is_history'] = Variable<bool>(isHistory);
    map['is_live'] = Variable<bool>(isLive);
    if (!nullToAbsent || playbackPosition != null) {
      map['playback_position'] = Variable<int>(playbackPosition);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<DateTime>(time);
    }
    return map;
  }

  LocalStoreVideosCompanion toCompanion(bool nullToAbsent) {
    return LocalStoreVideosCompanion(
      id: Value(id),
      videoId: Value(videoId),
      profileName: Value(profileName),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
      uploadedDate: uploadedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(uploadedDate),
      uploaderName: uploaderName == null && nullToAbsent
          ? const Value.absent()
          : Value(uploaderName),
      uploaderId: uploaderId == null && nullToAbsent
          ? const Value.absent()
          : Value(uploaderId),
      uploaderAvatar: uploaderAvatar == null && nullToAbsent
          ? const Value.absent()
          : Value(uploaderAvatar),
      uploaderSubscriberCount: uploaderSubscriberCount == null && nullToAbsent
          ? const Value.absent()
          : Value(uploaderSubscriberCount),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      uploaderVerified: Value(uploaderVerified),
      isSaved: Value(isSaved),
      isHistory: Value(isHistory),
      isLive: Value(isLive),
      playbackPosition: playbackPosition == null && nullToAbsent
          ? const Value.absent()
          : Value(playbackPosition),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
    );
  }

  factory LocalStoreVideo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocalStoreVideo(
      id: serializer.fromJson<int>(json['id']),
      videoId: serializer.fromJson<String>(json['videoId']),
      profileName: serializer.fromJson<String>(json['profileName']),
      title: serializer.fromJson<String?>(json['title']),
      views: serializer.fromJson<int?>(json['views']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
      uploadedDate: serializer.fromJson<String?>(json['uploadedDate']),
      uploaderName: serializer.fromJson<String?>(json['uploaderName']),
      uploaderId: serializer.fromJson<String?>(json['uploaderId']),
      uploaderAvatar: serializer.fromJson<String?>(json['uploaderAvatar']),
      uploaderSubscriberCount:
          serializer.fromJson<String?>(json['uploaderSubscriberCount']),
      duration: serializer.fromJson<int?>(json['duration']),
      uploaderVerified: serializer.fromJson<bool>(json['uploaderVerified']),
      isSaved: serializer.fromJson<bool>(json['isSaved']),
      isHistory: serializer.fromJson<bool>(json['isHistory']),
      isLive: serializer.fromJson<bool>(json['isLive']),
      playbackPosition: serializer.fromJson<int?>(json['playbackPosition']),
      time: serializer.fromJson<DateTime?>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'videoId': serializer.toJson<String>(videoId),
      'profileName': serializer.toJson<String>(profileName),
      'title': serializer.toJson<String?>(title),
      'views': serializer.toJson<int?>(views),
      'thumbnail': serializer.toJson<String?>(thumbnail),
      'uploadedDate': serializer.toJson<String?>(uploadedDate),
      'uploaderName': serializer.toJson<String?>(uploaderName),
      'uploaderId': serializer.toJson<String?>(uploaderId),
      'uploaderAvatar': serializer.toJson<String?>(uploaderAvatar),
      'uploaderSubscriberCount':
          serializer.toJson<String?>(uploaderSubscriberCount),
      'duration': serializer.toJson<int?>(duration),
      'uploaderVerified': serializer.toJson<bool>(uploaderVerified),
      'isSaved': serializer.toJson<bool>(isSaved),
      'isHistory': serializer.toJson<bool>(isHistory),
      'isLive': serializer.toJson<bool>(isLive),
      'playbackPosition': serializer.toJson<int?>(playbackPosition),
      'time': serializer.toJson<DateTime?>(time),
    };
  }

  LocalStoreVideo copyWith(
          {int? id,
          String? videoId,
          String? profileName,
          Value<String?> title = const Value.absent(),
          Value<int?> views = const Value.absent(),
          Value<String?> thumbnail = const Value.absent(),
          Value<String?> uploadedDate = const Value.absent(),
          Value<String?> uploaderName = const Value.absent(),
          Value<String?> uploaderId = const Value.absent(),
          Value<String?> uploaderAvatar = const Value.absent(),
          Value<String?> uploaderSubscriberCount = const Value.absent(),
          Value<int?> duration = const Value.absent(),
          bool? uploaderVerified,
          bool? isSaved,
          bool? isHistory,
          bool? isLive,
          Value<int?> playbackPosition = const Value.absent(),
          Value<DateTime?> time = const Value.absent()}) =>
      LocalStoreVideo(
        id: id ?? this.id,
        videoId: videoId ?? this.videoId,
        profileName: profileName ?? this.profileName,
        title: title.present ? title.value : this.title,
        views: views.present ? views.value : this.views,
        thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
        uploadedDate:
            uploadedDate.present ? uploadedDate.value : this.uploadedDate,
        uploaderName:
            uploaderName.present ? uploaderName.value : this.uploaderName,
        uploaderId: uploaderId.present ? uploaderId.value : this.uploaderId,
        uploaderAvatar:
            uploaderAvatar.present ? uploaderAvatar.value : this.uploaderAvatar,
        uploaderSubscriberCount: uploaderSubscriberCount.present
            ? uploaderSubscriberCount.value
            : this.uploaderSubscriberCount,
        duration: duration.present ? duration.value : this.duration,
        uploaderVerified: uploaderVerified ?? this.uploaderVerified,
        isSaved: isSaved ?? this.isSaved,
        isHistory: isHistory ?? this.isHistory,
        isLive: isLive ?? this.isLive,
        playbackPosition: playbackPosition.present
            ? playbackPosition.value
            : this.playbackPosition,
        time: time.present ? time.value : this.time,
      );
  LocalStoreVideo copyWithCompanion(LocalStoreVideosCompanion data) {
    return LocalStoreVideo(
      id: data.id.present ? data.id.value : this.id,
      videoId: data.videoId.present ? data.videoId.value : this.videoId,
      profileName:
          data.profileName.present ? data.profileName.value : this.profileName,
      title: data.title.present ? data.title.value : this.title,
      views: data.views.present ? data.views.value : this.views,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
      uploadedDate: data.uploadedDate.present
          ? data.uploadedDate.value
          : this.uploadedDate,
      uploaderName: data.uploaderName.present
          ? data.uploaderName.value
          : this.uploaderName,
      uploaderId:
          data.uploaderId.present ? data.uploaderId.value : this.uploaderId,
      uploaderAvatar: data.uploaderAvatar.present
          ? data.uploaderAvatar.value
          : this.uploaderAvatar,
      uploaderSubscriberCount: data.uploaderSubscriberCount.present
          ? data.uploaderSubscriberCount.value
          : this.uploaderSubscriberCount,
      duration: data.duration.present ? data.duration.value : this.duration,
      uploaderVerified: data.uploaderVerified.present
          ? data.uploaderVerified.value
          : this.uploaderVerified,
      isSaved: data.isSaved.present ? data.isSaved.value : this.isSaved,
      isHistory: data.isHistory.present ? data.isHistory.value : this.isHistory,
      isLive: data.isLive.present ? data.isLive.value : this.isLive,
      playbackPosition: data.playbackPosition.present
          ? data.playbackPosition.value
          : this.playbackPosition,
      time: data.time.present ? data.time.value : this.time,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocalStoreVideo(')
          ..write('id: $id, ')
          ..write('videoId: $videoId, ')
          ..write('profileName: $profileName, ')
          ..write('title: $title, ')
          ..write('views: $views, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('uploadedDate: $uploadedDate, ')
          ..write('uploaderName: $uploaderName, ')
          ..write('uploaderId: $uploaderId, ')
          ..write('uploaderAvatar: $uploaderAvatar, ')
          ..write('uploaderSubscriberCount: $uploaderSubscriberCount, ')
          ..write('duration: $duration, ')
          ..write('uploaderVerified: $uploaderVerified, ')
          ..write('isSaved: $isSaved, ')
          ..write('isHistory: $isHistory, ')
          ..write('isLive: $isLive, ')
          ..write('playbackPosition: $playbackPosition, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      videoId,
      profileName,
      title,
      views,
      thumbnail,
      uploadedDate,
      uploaderName,
      uploaderId,
      uploaderAvatar,
      uploaderSubscriberCount,
      duration,
      uploaderVerified,
      isSaved,
      isHistory,
      isLive,
      playbackPosition,
      time);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocalStoreVideo &&
          other.id == this.id &&
          other.videoId == this.videoId &&
          other.profileName == this.profileName &&
          other.title == this.title &&
          other.views == this.views &&
          other.thumbnail == this.thumbnail &&
          other.uploadedDate == this.uploadedDate &&
          other.uploaderName == this.uploaderName &&
          other.uploaderId == this.uploaderId &&
          other.uploaderAvatar == this.uploaderAvatar &&
          other.uploaderSubscriberCount == this.uploaderSubscriberCount &&
          other.duration == this.duration &&
          other.uploaderVerified == this.uploaderVerified &&
          other.isSaved == this.isSaved &&
          other.isHistory == this.isHistory &&
          other.isLive == this.isLive &&
          other.playbackPosition == this.playbackPosition &&
          other.time == this.time);
}

class LocalStoreVideosCompanion extends UpdateCompanion<LocalStoreVideo> {
  final Value<int> id;
  final Value<String> videoId;
  final Value<String> profileName;
  final Value<String?> title;
  final Value<int?> views;
  final Value<String?> thumbnail;
  final Value<String?> uploadedDate;
  final Value<String?> uploaderName;
  final Value<String?> uploaderId;
  final Value<String?> uploaderAvatar;
  final Value<String?> uploaderSubscriberCount;
  final Value<int?> duration;
  final Value<bool> uploaderVerified;
  final Value<bool> isSaved;
  final Value<bool> isHistory;
  final Value<bool> isLive;
  final Value<int?> playbackPosition;
  final Value<DateTime?> time;
  const LocalStoreVideosCompanion({
    this.id = const Value.absent(),
    this.videoId = const Value.absent(),
    this.profileName = const Value.absent(),
    this.title = const Value.absent(),
    this.views = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.uploadedDate = const Value.absent(),
    this.uploaderName = const Value.absent(),
    this.uploaderId = const Value.absent(),
    this.uploaderAvatar = const Value.absent(),
    this.uploaderSubscriberCount = const Value.absent(),
    this.duration = const Value.absent(),
    this.uploaderVerified = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.isHistory = const Value.absent(),
    this.isLive = const Value.absent(),
    this.playbackPosition = const Value.absent(),
    this.time = const Value.absent(),
  });
  LocalStoreVideosCompanion.insert({
    this.id = const Value.absent(),
    required String videoId,
    required String profileName,
    this.title = const Value.absent(),
    this.views = const Value.absent(),
    this.thumbnail = const Value.absent(),
    this.uploadedDate = const Value.absent(),
    this.uploaderName = const Value.absent(),
    this.uploaderId = const Value.absent(),
    this.uploaderAvatar = const Value.absent(),
    this.uploaderSubscriberCount = const Value.absent(),
    this.duration = const Value.absent(),
    this.uploaderVerified = const Value.absent(),
    this.isSaved = const Value.absent(),
    this.isHistory = const Value.absent(),
    this.isLive = const Value.absent(),
    this.playbackPosition = const Value.absent(),
    this.time = const Value.absent(),
  })  : videoId = Value(videoId),
        profileName = Value(profileName);
  static Insertable<LocalStoreVideo> custom({
    Expression<int>? id,
    Expression<String>? videoId,
    Expression<String>? profileName,
    Expression<String>? title,
    Expression<int>? views,
    Expression<String>? thumbnail,
    Expression<String>? uploadedDate,
    Expression<String>? uploaderName,
    Expression<String>? uploaderId,
    Expression<String>? uploaderAvatar,
    Expression<String>? uploaderSubscriberCount,
    Expression<int>? duration,
    Expression<bool>? uploaderVerified,
    Expression<bool>? isSaved,
    Expression<bool>? isHistory,
    Expression<bool>? isLive,
    Expression<int>? playbackPosition,
    Expression<DateTime>? time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (videoId != null) 'video_id': videoId,
      if (profileName != null) 'profile_name': profileName,
      if (title != null) 'title': title,
      if (views != null) 'views': views,
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (uploadedDate != null) 'uploaded_date': uploadedDate,
      if (uploaderName != null) 'uploader_name': uploaderName,
      if (uploaderId != null) 'uploader_id': uploaderId,
      if (uploaderAvatar != null) 'uploader_avatar': uploaderAvatar,
      if (uploaderSubscriberCount != null)
        'uploader_subscriber_count': uploaderSubscriberCount,
      if (duration != null) 'duration': duration,
      if (uploaderVerified != null) 'uploader_verified': uploaderVerified,
      if (isSaved != null) 'is_saved': isSaved,
      if (isHistory != null) 'is_history': isHistory,
      if (isLive != null) 'is_live': isLive,
      if (playbackPosition != null) 'playback_position': playbackPosition,
      if (time != null) 'time': time,
    });
  }

  LocalStoreVideosCompanion copyWith(
      {Value<int>? id,
      Value<String>? videoId,
      Value<String>? profileName,
      Value<String?>? title,
      Value<int?>? views,
      Value<String?>? thumbnail,
      Value<String?>? uploadedDate,
      Value<String?>? uploaderName,
      Value<String?>? uploaderId,
      Value<String?>? uploaderAvatar,
      Value<String?>? uploaderSubscriberCount,
      Value<int?>? duration,
      Value<bool>? uploaderVerified,
      Value<bool>? isSaved,
      Value<bool>? isHistory,
      Value<bool>? isLive,
      Value<int?>? playbackPosition,
      Value<DateTime?>? time}) {
    return LocalStoreVideosCompanion(
      id: id ?? this.id,
      videoId: videoId ?? this.videoId,
      profileName: profileName ?? this.profileName,
      title: title ?? this.title,
      views: views ?? this.views,
      thumbnail: thumbnail ?? this.thumbnail,
      uploadedDate: uploadedDate ?? this.uploadedDate,
      uploaderName: uploaderName ?? this.uploaderName,
      uploaderId: uploaderId ?? this.uploaderId,
      uploaderAvatar: uploaderAvatar ?? this.uploaderAvatar,
      uploaderSubscriberCount:
          uploaderSubscriberCount ?? this.uploaderSubscriberCount,
      duration: duration ?? this.duration,
      uploaderVerified: uploaderVerified ?? this.uploaderVerified,
      isSaved: isSaved ?? this.isSaved,
      isHistory: isHistory ?? this.isHistory,
      isLive: isLive ?? this.isLive,
      playbackPosition: playbackPosition ?? this.playbackPosition,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (videoId.present) {
      map['video_id'] = Variable<String>(videoId.value);
    }
    if (profileName.present) {
      map['profile_name'] = Variable<String>(profileName.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (views.present) {
      map['views'] = Variable<int>(views.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    if (uploadedDate.present) {
      map['uploaded_date'] = Variable<String>(uploadedDate.value);
    }
    if (uploaderName.present) {
      map['uploader_name'] = Variable<String>(uploaderName.value);
    }
    if (uploaderId.present) {
      map['uploader_id'] = Variable<String>(uploaderId.value);
    }
    if (uploaderAvatar.present) {
      map['uploader_avatar'] = Variable<String>(uploaderAvatar.value);
    }
    if (uploaderSubscriberCount.present) {
      map['uploader_subscriber_count'] =
          Variable<String>(uploaderSubscriberCount.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (uploaderVerified.present) {
      map['uploader_verified'] = Variable<bool>(uploaderVerified.value);
    }
    if (isSaved.present) {
      map['is_saved'] = Variable<bool>(isSaved.value);
    }
    if (isHistory.present) {
      map['is_history'] = Variable<bool>(isHistory.value);
    }
    if (isLive.present) {
      map['is_live'] = Variable<bool>(isLive.value);
    }
    if (playbackPosition.present) {
      map['playback_position'] = Variable<int>(playbackPosition.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocalStoreVideosCompanion(')
          ..write('id: $id, ')
          ..write('videoId: $videoId, ')
          ..write('profileName: $profileName, ')
          ..write('title: $title, ')
          ..write('views: $views, ')
          ..write('thumbnail: $thumbnail, ')
          ..write('uploadedDate: $uploadedDate, ')
          ..write('uploaderName: $uploaderName, ')
          ..write('uploaderId: $uploaderId, ')
          ..write('uploaderAvatar: $uploaderAvatar, ')
          ..write('uploaderSubscriberCount: $uploaderSubscriberCount, ')
          ..write('duration: $duration, ')
          ..write('uploaderVerified: $uploaderVerified, ')
          ..write('isSaved: $isSaved, ')
          ..write('isHistory: $isHistory, ')
          ..write('isLive: $isLive, ')
          ..write('playbackPosition: $playbackPosition, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }
}

class $SubscriptionsTable extends Subscriptions
    with TableInfo<$SubscriptionsTable, Subscription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubscriptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _channelIdMeta =
      const VerificationMeta('channelId');
  @override
  late final GeneratedColumn<String> channelId = GeneratedColumn<String>(
      'channel_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileNameMeta =
      const VerificationMeta('profileName');
  @override
  late final GeneratedColumn<String> profileName = GeneratedColumn<String>(
      'profile_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _channelNameMeta =
      const VerificationMeta('channelName');
  @override
  late final GeneratedColumn<String> channelName = GeneratedColumn<String>(
      'channel_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isVerifiedMeta =
      const VerificationMeta('isVerified');
  @override
  late final GeneratedColumn<bool> isVerified = GeneratedColumn<bool>(
      'is_verified', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_verified" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _avatarUrlMeta =
      const VerificationMeta('avatarUrl');
  @override
  late final GeneratedColumn<String> avatarUrl = GeneratedColumn<String>(
      'avatar_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, channelId, profileName, channelName, isVerified, avatarUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subscriptions';
  @override
  VerificationContext validateIntegrity(Insertable<Subscription> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('channel_id')) {
      context.handle(_channelIdMeta,
          channelId.isAcceptableOrUnknown(data['channel_id']!, _channelIdMeta));
    } else if (isInserting) {
      context.missing(_channelIdMeta);
    }
    if (data.containsKey('profile_name')) {
      context.handle(
          _profileNameMeta,
          profileName.isAcceptableOrUnknown(
              data['profile_name']!, _profileNameMeta));
    } else if (isInserting) {
      context.missing(_profileNameMeta);
    }
    if (data.containsKey('channel_name')) {
      context.handle(
          _channelNameMeta,
          channelName.isAcceptableOrUnknown(
              data['channel_name']!, _channelNameMeta));
    } else if (isInserting) {
      context.missing(_channelNameMeta);
    }
    if (data.containsKey('is_verified')) {
      context.handle(
          _isVerifiedMeta,
          isVerified.isAcceptableOrUnknown(
              data['is_verified']!, _isVerifiedMeta));
    }
    if (data.containsKey('avatar_url')) {
      context.handle(_avatarUrlMeta,
          avatarUrl.isAcceptableOrUnknown(data['avatar_url']!, _avatarUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {channelId, profileName},
      ];
  @override
  Subscription map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subscription(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      channelId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}channel_id'])!,
      profileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_name'])!,
      channelName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}channel_name'])!,
      isVerified: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_verified'])!,
      avatarUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}avatar_url']),
    );
  }

  @override
  $SubscriptionsTable createAlias(String alias) {
    return $SubscriptionsTable(attachedDatabase, alias);
  }
}

class Subscription extends DataClass implements Insertable<Subscription> {
  final int id;
  final String channelId;
  final String profileName;
  final String channelName;
  final bool isVerified;
  final String? avatarUrl;
  const Subscription(
      {required this.id,
      required this.channelId,
      required this.profileName,
      required this.channelName,
      required this.isVerified,
      this.avatarUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['channel_id'] = Variable<String>(channelId);
    map['profile_name'] = Variable<String>(profileName);
    map['channel_name'] = Variable<String>(channelName);
    map['is_verified'] = Variable<bool>(isVerified);
    if (!nullToAbsent || avatarUrl != null) {
      map['avatar_url'] = Variable<String>(avatarUrl);
    }
    return map;
  }

  SubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return SubscriptionsCompanion(
      id: Value(id),
      channelId: Value(channelId),
      profileName: Value(profileName),
      channelName: Value(channelName),
      isVerified: Value(isVerified),
      avatarUrl: avatarUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarUrl),
    );
  }

  factory Subscription.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subscription(
      id: serializer.fromJson<int>(json['id']),
      channelId: serializer.fromJson<String>(json['channelId']),
      profileName: serializer.fromJson<String>(json['profileName']),
      channelName: serializer.fromJson<String>(json['channelName']),
      isVerified: serializer.fromJson<bool>(json['isVerified']),
      avatarUrl: serializer.fromJson<String?>(json['avatarUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'channelId': serializer.toJson<String>(channelId),
      'profileName': serializer.toJson<String>(profileName),
      'channelName': serializer.toJson<String>(channelName),
      'isVerified': serializer.toJson<bool>(isVerified),
      'avatarUrl': serializer.toJson<String?>(avatarUrl),
    };
  }

  Subscription copyWith(
          {int? id,
          String? channelId,
          String? profileName,
          String? channelName,
          bool? isVerified,
          Value<String?> avatarUrl = const Value.absent()}) =>
      Subscription(
        id: id ?? this.id,
        channelId: channelId ?? this.channelId,
        profileName: profileName ?? this.profileName,
        channelName: channelName ?? this.channelName,
        isVerified: isVerified ?? this.isVerified,
        avatarUrl: avatarUrl.present ? avatarUrl.value : this.avatarUrl,
      );
  Subscription copyWithCompanion(SubscriptionsCompanion data) {
    return Subscription(
      id: data.id.present ? data.id.value : this.id,
      channelId: data.channelId.present ? data.channelId.value : this.channelId,
      profileName:
          data.profileName.present ? data.profileName.value : this.profileName,
      channelName:
          data.channelName.present ? data.channelName.value : this.channelName,
      isVerified:
          data.isVerified.present ? data.isVerified.value : this.isVerified,
      avatarUrl: data.avatarUrl.present ? data.avatarUrl.value : this.avatarUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subscription(')
          ..write('id: $id, ')
          ..write('channelId: $channelId, ')
          ..write('profileName: $profileName, ')
          ..write('channelName: $channelName, ')
          ..write('isVerified: $isVerified, ')
          ..write('avatarUrl: $avatarUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, channelId, profileName, channelName, isVerified, avatarUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subscription &&
          other.id == this.id &&
          other.channelId == this.channelId &&
          other.profileName == this.profileName &&
          other.channelName == this.channelName &&
          other.isVerified == this.isVerified &&
          other.avatarUrl == this.avatarUrl);
}

class SubscriptionsCompanion extends UpdateCompanion<Subscription> {
  final Value<int> id;
  final Value<String> channelId;
  final Value<String> profileName;
  final Value<String> channelName;
  final Value<bool> isVerified;
  final Value<String?> avatarUrl;
  const SubscriptionsCompanion({
    this.id = const Value.absent(),
    this.channelId = const Value.absent(),
    this.profileName = const Value.absent(),
    this.channelName = const Value.absent(),
    this.isVerified = const Value.absent(),
    this.avatarUrl = const Value.absent(),
  });
  SubscriptionsCompanion.insert({
    this.id = const Value.absent(),
    required String channelId,
    required String profileName,
    required String channelName,
    this.isVerified = const Value.absent(),
    this.avatarUrl = const Value.absent(),
  })  : channelId = Value(channelId),
        profileName = Value(profileName),
        channelName = Value(channelName);
  static Insertable<Subscription> custom({
    Expression<int>? id,
    Expression<String>? channelId,
    Expression<String>? profileName,
    Expression<String>? channelName,
    Expression<bool>? isVerified,
    Expression<String>? avatarUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (channelId != null) 'channel_id': channelId,
      if (profileName != null) 'profile_name': profileName,
      if (channelName != null) 'channel_name': channelName,
      if (isVerified != null) 'is_verified': isVerified,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
    });
  }

  SubscriptionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? channelId,
      Value<String>? profileName,
      Value<String>? channelName,
      Value<bool>? isVerified,
      Value<String?>? avatarUrl}) {
    return SubscriptionsCompanion(
      id: id ?? this.id,
      channelId: channelId ?? this.channelId,
      profileName: profileName ?? this.profileName,
      channelName: channelName ?? this.channelName,
      isVerified: isVerified ?? this.isVerified,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (channelId.present) {
      map['channel_id'] = Variable<String>(channelId.value);
    }
    if (profileName.present) {
      map['profile_name'] = Variable<String>(profileName.value);
    }
    if (channelName.present) {
      map['channel_name'] = Variable<String>(channelName.value);
    }
    if (isVerified.present) {
      map['is_verified'] = Variable<bool>(isVerified.value);
    }
    if (avatarUrl.present) {
      map['avatar_url'] = Variable<String>(avatarUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubscriptionsCompanion(')
          ..write('id: $id, ')
          ..write('channelId: $channelId, ')
          ..write('profileName: $profileName, ')
          ..write('channelName: $channelName, ')
          ..write('isVerified: $isVerified, ')
          ..write('avatarUrl: $avatarUrl')
          ..write(')'))
        .toString();
  }
}

class $SearchHistoryEntriesTable extends SearchHistoryEntries
    with TableInfo<$SearchHistoryEntriesTable, SearchHistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchHistoryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _queryMeta = const VerificationMeta('query');
  @override
  late final GeneratedColumn<String> query = GeneratedColumn<String>(
      'query', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileNameMeta =
      const VerificationMeta('profileName');
  @override
  late final GeneratedColumn<String> profileName = GeneratedColumn<String>(
      'profile_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _searchedAtMeta =
      const VerificationMeta('searchedAt');
  @override
  late final GeneratedColumn<DateTime> searchedAt = GeneratedColumn<DateTime>(
      'searched_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _searchCountMeta =
      const VerificationMeta('searchCount');
  @override
  late final GeneratedColumn<int> searchCount = GeneratedColumn<int>(
      'search_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns =>
      [id, query, profileName, searchedAt, searchCount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_history_entries';
  @override
  VerificationContext validateIntegrity(Insertable<SearchHistoryEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('query')) {
      context.handle(
          _queryMeta, query.isAcceptableOrUnknown(data['query']!, _queryMeta));
    } else if (isInserting) {
      context.missing(_queryMeta);
    }
    if (data.containsKey('profile_name')) {
      context.handle(
          _profileNameMeta,
          profileName.isAcceptableOrUnknown(
              data['profile_name']!, _profileNameMeta));
    } else if (isInserting) {
      context.missing(_profileNameMeta);
    }
    if (data.containsKey('searched_at')) {
      context.handle(
          _searchedAtMeta,
          searchedAt.isAcceptableOrUnknown(
              data['searched_at']!, _searchedAtMeta));
    } else if (isInserting) {
      context.missing(_searchedAtMeta);
    }
    if (data.containsKey('search_count')) {
      context.handle(
          _searchCountMeta,
          searchCount.isAcceptableOrUnknown(
              data['search_count']!, _searchCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {query, profileName},
      ];
  @override
  SearchHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchHistoryEntry(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      query: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}query'])!,
      profileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_name'])!,
      searchedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}searched_at'])!,
      searchCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}search_count'])!,
    );
  }

  @override
  $SearchHistoryEntriesTable createAlias(String alias) {
    return $SearchHistoryEntriesTable(attachedDatabase, alias);
  }
}

class SearchHistoryEntry extends DataClass
    implements Insertable<SearchHistoryEntry> {
  final int id;
  final String query;
  final String profileName;
  final DateTime searchedAt;
  final int searchCount;
  const SearchHistoryEntry(
      {required this.id,
      required this.query,
      required this.profileName,
      required this.searchedAt,
      required this.searchCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['query'] = Variable<String>(query);
    map['profile_name'] = Variable<String>(profileName);
    map['searched_at'] = Variable<DateTime>(searchedAt);
    map['search_count'] = Variable<int>(searchCount);
    return map;
  }

  SearchHistoryEntriesCompanion toCompanion(bool nullToAbsent) {
    return SearchHistoryEntriesCompanion(
      id: Value(id),
      query: Value(query),
      profileName: Value(profileName),
      searchedAt: Value(searchedAt),
      searchCount: Value(searchCount),
    );
  }

  factory SearchHistoryEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchHistoryEntry(
      id: serializer.fromJson<int>(json['id']),
      query: serializer.fromJson<String>(json['query']),
      profileName: serializer.fromJson<String>(json['profileName']),
      searchedAt: serializer.fromJson<DateTime>(json['searchedAt']),
      searchCount: serializer.fromJson<int>(json['searchCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'query': serializer.toJson<String>(query),
      'profileName': serializer.toJson<String>(profileName),
      'searchedAt': serializer.toJson<DateTime>(searchedAt),
      'searchCount': serializer.toJson<int>(searchCount),
    };
  }

  SearchHistoryEntry copyWith(
          {int? id,
          String? query,
          String? profileName,
          DateTime? searchedAt,
          int? searchCount}) =>
      SearchHistoryEntry(
        id: id ?? this.id,
        query: query ?? this.query,
        profileName: profileName ?? this.profileName,
        searchedAt: searchedAt ?? this.searchedAt,
        searchCount: searchCount ?? this.searchCount,
      );
  SearchHistoryEntry copyWithCompanion(SearchHistoryEntriesCompanion data) {
    return SearchHistoryEntry(
      id: data.id.present ? data.id.value : this.id,
      query: data.query.present ? data.query.value : this.query,
      profileName:
          data.profileName.present ? data.profileName.value : this.profileName,
      searchedAt:
          data.searchedAt.present ? data.searchedAt.value : this.searchedAt,
      searchCount:
          data.searchCount.present ? data.searchCount.value : this.searchCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryEntry(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('profileName: $profileName, ')
          ..write('searchedAt: $searchedAt, ')
          ..write('searchCount: $searchCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, query, profileName, searchedAt, searchCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchHistoryEntry &&
          other.id == this.id &&
          other.query == this.query &&
          other.profileName == this.profileName &&
          other.searchedAt == this.searchedAt &&
          other.searchCount == this.searchCount);
}

class SearchHistoryEntriesCompanion
    extends UpdateCompanion<SearchHistoryEntry> {
  final Value<int> id;
  final Value<String> query;
  final Value<String> profileName;
  final Value<DateTime> searchedAt;
  final Value<int> searchCount;
  const SearchHistoryEntriesCompanion({
    this.id = const Value.absent(),
    this.query = const Value.absent(),
    this.profileName = const Value.absent(),
    this.searchedAt = const Value.absent(),
    this.searchCount = const Value.absent(),
  });
  SearchHistoryEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String query,
    required String profileName,
    required DateTime searchedAt,
    this.searchCount = const Value.absent(),
  })  : query = Value(query),
        profileName = Value(profileName),
        searchedAt = Value(searchedAt);
  static Insertable<SearchHistoryEntry> custom({
    Expression<int>? id,
    Expression<String>? query,
    Expression<String>? profileName,
    Expression<DateTime>? searchedAt,
    Expression<int>? searchCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (query != null) 'query': query,
      if (profileName != null) 'profile_name': profileName,
      if (searchedAt != null) 'searched_at': searchedAt,
      if (searchCount != null) 'search_count': searchCount,
    });
  }

  SearchHistoryEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? query,
      Value<String>? profileName,
      Value<DateTime>? searchedAt,
      Value<int>? searchCount}) {
    return SearchHistoryEntriesCompanion(
      id: id ?? this.id,
      query: query ?? this.query,
      profileName: profileName ?? this.profileName,
      searchedAt: searchedAt ?? this.searchedAt,
      searchCount: searchCount ?? this.searchCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (query.present) {
      map['query'] = Variable<String>(query.value);
    }
    if (profileName.present) {
      map['profile_name'] = Variable<String>(profileName.value);
    }
    if (searchedAt.present) {
      map['searched_at'] = Variable<DateTime>(searchedAt.value);
    }
    if (searchCount.present) {
      map['search_count'] = Variable<int>(searchCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchHistoryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('query: $query, ')
          ..write('profileName: $profileName, ')
          ..write('searchedAt: $searchedAt, ')
          ..write('searchCount: $searchCount')
          ..write(')'))
        .toString();
  }
}

class $UserInteractionsTable extends UserInteractions
    with TableInfo<$UserInteractionsTable, UserInteraction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserInteractionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _interactionTypeMeta =
      const VerificationMeta('interactionType');
  @override
  late final GeneratedColumn<int> interactionType = GeneratedColumn<int>(
      'interaction_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _profileNameMeta =
      const VerificationMeta('profileName');
  @override
  late final GeneratedColumn<String> profileName = GeneratedColumn<String>(
      'profile_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(1.0));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _channelNameMeta =
      const VerificationMeta('channelName');
  @override
  late final GeneratedColumn<String> channelName = GeneratedColumn<String>(
      'channel_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        entityId,
        interactionType,
        profileName,
        timestamp,
        weight,
        title,
        channelName,
        category,
        tags
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_interactions';
  @override
  VerificationContext validateIntegrity(Insertable<UserInteraction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    } else if (isInserting) {
      context.missing(_entityIdMeta);
    }
    if (data.containsKey('interaction_type')) {
      context.handle(
          _interactionTypeMeta,
          interactionType.isAcceptableOrUnknown(
              data['interaction_type']!, _interactionTypeMeta));
    } else if (isInserting) {
      context.missing(_interactionTypeMeta);
    }
    if (data.containsKey('profile_name')) {
      context.handle(
          _profileNameMeta,
          profileName.isAcceptableOrUnknown(
              data['profile_name']!, _profileNameMeta));
    } else if (isInserting) {
      context.missing(_profileNameMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('channel_name')) {
      context.handle(
          _channelNameMeta,
          channelName.isAcceptableOrUnknown(
              data['channel_name']!, _channelNameMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {interactionType, entityId, profileName},
      ];
  @override
  UserInteraction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserInteraction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id'])!,
      interactionType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}interaction_type'])!,
      profileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_name'])!,
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      channelName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}channel_name']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags']),
    );
  }

  @override
  $UserInteractionsTable createAlias(String alias) {
    return $UserInteractionsTable(attachedDatabase, alias);
  }
}

class UserInteraction extends DataClass implements Insertable<UserInteraction> {
  final int id;
  final String entityId;
  final int interactionType;
  final String profileName;
  final DateTime timestamp;
  final double weight;
  final String? title;
  final String? channelName;
  final String? category;
  final String? tags;
  const UserInteraction(
      {required this.id,
      required this.entityId,
      required this.interactionType,
      required this.profileName,
      required this.timestamp,
      required this.weight,
      this.title,
      this.channelName,
      this.category,
      this.tags});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_id'] = Variable<String>(entityId);
    map['interaction_type'] = Variable<int>(interactionType);
    map['profile_name'] = Variable<String>(profileName);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['weight'] = Variable<double>(weight);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || channelName != null) {
      map['channel_name'] = Variable<String>(channelName);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    return map;
  }

  UserInteractionsCompanion toCompanion(bool nullToAbsent) {
    return UserInteractionsCompanion(
      id: Value(id),
      entityId: Value(entityId),
      interactionType: Value(interactionType),
      profileName: Value(profileName),
      timestamp: Value(timestamp),
      weight: Value(weight),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      channelName: channelName == null && nullToAbsent
          ? const Value.absent()
          : Value(channelName),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
    );
  }

  factory UserInteraction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserInteraction(
      id: serializer.fromJson<int>(json['id']),
      entityId: serializer.fromJson<String>(json['entityId']),
      interactionType: serializer.fromJson<int>(json['interactionType']),
      profileName: serializer.fromJson<String>(json['profileName']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      weight: serializer.fromJson<double>(json['weight']),
      title: serializer.fromJson<String?>(json['title']),
      channelName: serializer.fromJson<String?>(json['channelName']),
      category: serializer.fromJson<String?>(json['category']),
      tags: serializer.fromJson<String?>(json['tags']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityId': serializer.toJson<String>(entityId),
      'interactionType': serializer.toJson<int>(interactionType),
      'profileName': serializer.toJson<String>(profileName),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'weight': serializer.toJson<double>(weight),
      'title': serializer.toJson<String?>(title),
      'channelName': serializer.toJson<String?>(channelName),
      'category': serializer.toJson<String?>(category),
      'tags': serializer.toJson<String?>(tags),
    };
  }

  UserInteraction copyWith(
          {int? id,
          String? entityId,
          int? interactionType,
          String? profileName,
          DateTime? timestamp,
          double? weight,
          Value<String?> title = const Value.absent(),
          Value<String?> channelName = const Value.absent(),
          Value<String?> category = const Value.absent(),
          Value<String?> tags = const Value.absent()}) =>
      UserInteraction(
        id: id ?? this.id,
        entityId: entityId ?? this.entityId,
        interactionType: interactionType ?? this.interactionType,
        profileName: profileName ?? this.profileName,
        timestamp: timestamp ?? this.timestamp,
        weight: weight ?? this.weight,
        title: title.present ? title.value : this.title,
        channelName: channelName.present ? channelName.value : this.channelName,
        category: category.present ? category.value : this.category,
        tags: tags.present ? tags.value : this.tags,
      );
  UserInteraction copyWithCompanion(UserInteractionsCompanion data) {
    return UserInteraction(
      id: data.id.present ? data.id.value : this.id,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      interactionType: data.interactionType.present
          ? data.interactionType.value
          : this.interactionType,
      profileName:
          data.profileName.present ? data.profileName.value : this.profileName,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      weight: data.weight.present ? data.weight.value : this.weight,
      title: data.title.present ? data.title.value : this.title,
      channelName:
          data.channelName.present ? data.channelName.value : this.channelName,
      category: data.category.present ? data.category.value : this.category,
      tags: data.tags.present ? data.tags.value : this.tags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserInteraction(')
          ..write('id: $id, ')
          ..write('entityId: $entityId, ')
          ..write('interactionType: $interactionType, ')
          ..write('profileName: $profileName, ')
          ..write('timestamp: $timestamp, ')
          ..write('weight: $weight, ')
          ..write('title: $title, ')
          ..write('channelName: $channelName, ')
          ..write('category: $category, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entityId, interactionType, profileName,
      timestamp, weight, title, channelName, category, tags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInteraction &&
          other.id == this.id &&
          other.entityId == this.entityId &&
          other.interactionType == this.interactionType &&
          other.profileName == this.profileName &&
          other.timestamp == this.timestamp &&
          other.weight == this.weight &&
          other.title == this.title &&
          other.channelName == this.channelName &&
          other.category == this.category &&
          other.tags == this.tags);
}

class UserInteractionsCompanion extends UpdateCompanion<UserInteraction> {
  final Value<int> id;
  final Value<String> entityId;
  final Value<int> interactionType;
  final Value<String> profileName;
  final Value<DateTime> timestamp;
  final Value<double> weight;
  final Value<String?> title;
  final Value<String?> channelName;
  final Value<String?> category;
  final Value<String?> tags;
  const UserInteractionsCompanion({
    this.id = const Value.absent(),
    this.entityId = const Value.absent(),
    this.interactionType = const Value.absent(),
    this.profileName = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.weight = const Value.absent(),
    this.title = const Value.absent(),
    this.channelName = const Value.absent(),
    this.category = const Value.absent(),
    this.tags = const Value.absent(),
  });
  UserInteractionsCompanion.insert({
    this.id = const Value.absent(),
    required String entityId,
    required int interactionType,
    required String profileName,
    required DateTime timestamp,
    this.weight = const Value.absent(),
    this.title = const Value.absent(),
    this.channelName = const Value.absent(),
    this.category = const Value.absent(),
    this.tags = const Value.absent(),
  })  : entityId = Value(entityId),
        interactionType = Value(interactionType),
        profileName = Value(profileName),
        timestamp = Value(timestamp);
  static Insertable<UserInteraction> custom({
    Expression<int>? id,
    Expression<String>? entityId,
    Expression<int>? interactionType,
    Expression<String>? profileName,
    Expression<DateTime>? timestamp,
    Expression<double>? weight,
    Expression<String>? title,
    Expression<String>? channelName,
    Expression<String>? category,
    Expression<String>? tags,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityId != null) 'entity_id': entityId,
      if (interactionType != null) 'interaction_type': interactionType,
      if (profileName != null) 'profile_name': profileName,
      if (timestamp != null) 'timestamp': timestamp,
      if (weight != null) 'weight': weight,
      if (title != null) 'title': title,
      if (channelName != null) 'channel_name': channelName,
      if (category != null) 'category': category,
      if (tags != null) 'tags': tags,
    });
  }

  UserInteractionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityId,
      Value<int>? interactionType,
      Value<String>? profileName,
      Value<DateTime>? timestamp,
      Value<double>? weight,
      Value<String?>? title,
      Value<String?>? channelName,
      Value<String?>? category,
      Value<String?>? tags}) {
    return UserInteractionsCompanion(
      id: id ?? this.id,
      entityId: entityId ?? this.entityId,
      interactionType: interactionType ?? this.interactionType,
      profileName: profileName ?? this.profileName,
      timestamp: timestamp ?? this.timestamp,
      weight: weight ?? this.weight,
      title: title ?? this.title,
      channelName: channelName ?? this.channelName,
      category: category ?? this.category,
      tags: tags ?? this.tags,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (interactionType.present) {
      map['interaction_type'] = Variable<int>(interactionType.value);
    }
    if (profileName.present) {
      map['profile_name'] = Variable<String>(profileName.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (channelName.present) {
      map['channel_name'] = Variable<String>(channelName.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserInteractionsCompanion(')
          ..write('id: $id, ')
          ..write('entityId: $entityId, ')
          ..write('interactionType: $interactionType, ')
          ..write('profileName: $profileName, ')
          ..write('timestamp: $timestamp, ')
          ..write('weight: $weight, ')
          ..write('title: $title, ')
          ..write('channelName: $channelName, ')
          ..write('category: $category, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }
}

class $UserTopicPreferencesTable extends UserTopicPreferences
    with TableInfo<$UserTopicPreferencesTable, UserTopicPreference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTopicPreferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _topicMeta = const VerificationMeta('topic');
  @override
  late final GeneratedColumn<String> topic = GeneratedColumn<String>(
      'topic', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileNameMeta =
      const VerificationMeta('profileName');
  @override
  late final GeneratedColumn<String> profileName = GeneratedColumn<String>(
      'profile_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relevanceScoreMeta =
      const VerificationMeta('relevanceScore');
  @override
  late final GeneratedColumn<double> relevanceScore = GeneratedColumn<double>(
      'relevance_score', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, topic, profileName, relevanceScore, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_topic_preferences';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserTopicPreference> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('topic')) {
      context.handle(
          _topicMeta, topic.isAcceptableOrUnknown(data['topic']!, _topicMeta));
    } else if (isInserting) {
      context.missing(_topicMeta);
    }
    if (data.containsKey('profile_name')) {
      context.handle(
          _profileNameMeta,
          profileName.isAcceptableOrUnknown(
              data['profile_name']!, _profileNameMeta));
    } else if (isInserting) {
      context.missing(_profileNameMeta);
    }
    if (data.containsKey('relevance_score')) {
      context.handle(
          _relevanceScoreMeta,
          relevanceScore.isAcceptableOrUnknown(
              data['relevance_score']!, _relevanceScoreMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {topic, profileName},
      ];
  @override
  UserTopicPreference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTopicPreference(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      topic: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}topic'])!,
      profileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_name'])!,
      relevanceScore: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}relevance_score'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $UserTopicPreferencesTable createAlias(String alias) {
    return $UserTopicPreferencesTable(attachedDatabase, alias);
  }
}

class UserTopicPreference extends DataClass
    implements Insertable<UserTopicPreference> {
  final int id;
  final String topic;
  final String profileName;
  final double relevanceScore;
  final DateTime lastUpdated;
  const UserTopicPreference(
      {required this.id,
      required this.topic,
      required this.profileName,
      required this.relevanceScore,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['topic'] = Variable<String>(topic);
    map['profile_name'] = Variable<String>(profileName);
    map['relevance_score'] = Variable<double>(relevanceScore);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  UserTopicPreferencesCompanion toCompanion(bool nullToAbsent) {
    return UserTopicPreferencesCompanion(
      id: Value(id),
      topic: Value(topic),
      profileName: Value(profileName),
      relevanceScore: Value(relevanceScore),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory UserTopicPreference.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTopicPreference(
      id: serializer.fromJson<int>(json['id']),
      topic: serializer.fromJson<String>(json['topic']),
      profileName: serializer.fromJson<String>(json['profileName']),
      relevanceScore: serializer.fromJson<double>(json['relevanceScore']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'topic': serializer.toJson<String>(topic),
      'profileName': serializer.toJson<String>(profileName),
      'relevanceScore': serializer.toJson<double>(relevanceScore),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  UserTopicPreference copyWith(
          {int? id,
          String? topic,
          String? profileName,
          double? relevanceScore,
          DateTime? lastUpdated}) =>
      UserTopicPreference(
        id: id ?? this.id,
        topic: topic ?? this.topic,
        profileName: profileName ?? this.profileName,
        relevanceScore: relevanceScore ?? this.relevanceScore,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  UserTopicPreference copyWithCompanion(UserTopicPreferencesCompanion data) {
    return UserTopicPreference(
      id: data.id.present ? data.id.value : this.id,
      topic: data.topic.present ? data.topic.value : this.topic,
      profileName:
          data.profileName.present ? data.profileName.value : this.profileName,
      relevanceScore: data.relevanceScore.present
          ? data.relevanceScore.value
          : this.relevanceScore,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTopicPreference(')
          ..write('id: $id, ')
          ..write('topic: $topic, ')
          ..write('profileName: $profileName, ')
          ..write('relevanceScore: $relevanceScore, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, topic, profileName, relevanceScore, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTopicPreference &&
          other.id == this.id &&
          other.topic == this.topic &&
          other.profileName == this.profileName &&
          other.relevanceScore == this.relevanceScore &&
          other.lastUpdated == this.lastUpdated);
}

class UserTopicPreferencesCompanion
    extends UpdateCompanion<UserTopicPreference> {
  final Value<int> id;
  final Value<String> topic;
  final Value<String> profileName;
  final Value<double> relevanceScore;
  final Value<DateTime> lastUpdated;
  const UserTopicPreferencesCompanion({
    this.id = const Value.absent(),
    this.topic = const Value.absent(),
    this.profileName = const Value.absent(),
    this.relevanceScore = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  });
  UserTopicPreferencesCompanion.insert({
    this.id = const Value.absent(),
    required String topic,
    required String profileName,
    this.relevanceScore = const Value.absent(),
    required DateTime lastUpdated,
  })  : topic = Value(topic),
        profileName = Value(profileName),
        lastUpdated = Value(lastUpdated);
  static Insertable<UserTopicPreference> custom({
    Expression<int>? id,
    Expression<String>? topic,
    Expression<String>? profileName,
    Expression<double>? relevanceScore,
    Expression<DateTime>? lastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (topic != null) 'topic': topic,
      if (profileName != null) 'profile_name': profileName,
      if (relevanceScore != null) 'relevance_score': relevanceScore,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  UserTopicPreferencesCompanion copyWith(
      {Value<int>? id,
      Value<String>? topic,
      Value<String>? profileName,
      Value<double>? relevanceScore,
      Value<DateTime>? lastUpdated}) {
    return UserTopicPreferencesCompanion(
      id: id ?? this.id,
      topic: topic ?? this.topic,
      profileName: profileName ?? this.profileName,
      relevanceScore: relevanceScore ?? this.relevanceScore,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (topic.present) {
      map['topic'] = Variable<String>(topic.value);
    }
    if (profileName.present) {
      map['profile_name'] = Variable<String>(profileName.value);
    }
    if (relevanceScore.present) {
      map['relevance_score'] = Variable<double>(relevanceScore.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTopicPreferencesCompanion(')
          ..write('id: $id, ')
          ..write('topic: $topic, ')
          ..write('profileName: $profileName, ')
          ..write('relevanceScore: $relevanceScore, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }
}

class $DownloadItemsTable extends DownloadItems
    with TableInfo<$DownloadItemsTable, DownloadItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _videoIdMeta =
      const VerificationMeta('videoId');
  @override
  late final GeneratedColumn<String> videoId = GeneratedColumn<String>(
      'video_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _profileNameMeta =
      const VerificationMeta('profileName');
  @override
  late final GeneratedColumn<String> profileName = GeneratedColumn<String>(
      'profile_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _channelNameMeta =
      const VerificationMeta('channelName');
  @override
  late final GeneratedColumn<String> channelName = GeneratedColumn<String>(
      'channel_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  @override
  late final GeneratedColumn<String> thumbnailUrl = GeneratedColumn<String>(
      'thumbnail_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _videoQualityMeta =
      const VerificationMeta('videoQuality');
  @override
  late final GeneratedColumn<String> videoQuality = GeneratedColumn<String>(
      'video_quality', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioQualityMeta =
      const VerificationMeta('audioQuality');
  @override
  late final GeneratedColumn<String> audioQuality = GeneratedColumn<String>(
      'audio_quality', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _downloadTypeMeta =
      const VerificationMeta('downloadType');
  @override
  late final GeneratedColumn<int> downloadType = GeneratedColumn<int>(
      'download_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _videoUrlMeta =
      const VerificationMeta('videoUrl');
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
      'video_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioUrlMeta =
      const VerificationMeta('audioUrl');
  @override
  late final GeneratedColumn<String> audioUrl = GeneratedColumn<String>(
      'audio_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _videoFilePathMeta =
      const VerificationMeta('videoFilePath');
  @override
  late final GeneratedColumn<String> videoFilePath = GeneratedColumn<String>(
      'video_file_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _audioFilePathMeta =
      const VerificationMeta('audioFilePath');
  @override
  late final GeneratedColumn<String> audioFilePath = GeneratedColumn<String>(
      'audio_file_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _outputFilePathMeta =
      const VerificationMeta('outputFilePath');
  @override
  late final GeneratedColumn<String> outputFilePath = GeneratedColumn<String>(
      'output_file_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalBytesMeta =
      const VerificationMeta('totalBytes');
  @override
  late final GeneratedColumn<int> totalBytes = GeneratedColumn<int>(
      'total_bytes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _videoTotalBytesMeta =
      const VerificationMeta('videoTotalBytes');
  @override
  late final GeneratedColumn<int> videoTotalBytes = GeneratedColumn<int>(
      'video_total_bytes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _audioTotalBytesMeta =
      const VerificationMeta('audioTotalBytes');
  @override
  late final GeneratedColumn<int> audioTotalBytes = GeneratedColumn<int>(
      'audio_total_bytes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _downloadedBytesMeta =
      const VerificationMeta('downloadedBytes');
  @override
  late final GeneratedColumn<int> downloadedBytes = GeneratedColumn<int>(
      'downloaded_bytes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _videoDownloadedBytesMeta =
      const VerificationMeta('videoDownloadedBytes');
  @override
  late final GeneratedColumn<int> videoDownloadedBytes = GeneratedColumn<int>(
      'video_downloaded_bytes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _audioDownloadedBytesMeta =
      const VerificationMeta('audioDownloadedBytes');
  @override
  late final GeneratedColumn<int> audioDownloadedBytes = GeneratedColumn<int>(
      'audio_downloaded_bytes', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _downloadSpeedMeta =
      const VerificationMeta('downloadSpeed');
  @override
  late final GeneratedColumn<int> downloadSpeed = GeneratedColumn<int>(
      'download_speed', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _etaSecondsMeta =
      const VerificationMeta('etaSeconds');
  @override
  late final GeneratedColumn<int> etaSeconds = GeneratedColumn<int>(
      'eta_seconds', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _currentPhaseMeta =
      const VerificationMeta('currentPhase');
  @override
  late final GeneratedColumn<String> currentPhase = GeneratedColumn<String>(
      'current_phase', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _errorMessageMeta =
      const VerificationMeta('errorMessage');
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
      'error_message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
      'completed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _videoProgressMeta =
      const VerificationMeta('videoProgress');
  @override
  late final GeneratedColumn<double> videoProgress = GeneratedColumn<double>(
      'video_progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _audioProgressMeta =
      const VerificationMeta('audioProgress');
  @override
  late final GeneratedColumn<double> audioProgress = GeneratedColumn<double>(
      'audio_progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        videoId,
        profileName,
        title,
        channelName,
        thumbnailUrl,
        duration,
        videoQuality,
        audioQuality,
        downloadType,
        status,
        videoUrl,
        audioUrl,
        videoFilePath,
        audioFilePath,
        outputFilePath,
        totalBytes,
        videoTotalBytes,
        audioTotalBytes,
        downloadedBytes,
        videoDownloadedBytes,
        audioDownloadedBytes,
        downloadSpeed,
        etaSeconds,
        currentPhase,
        errorMessage,
        retryCount,
        createdAt,
        startedAt,
        completedAt,
        videoProgress,
        audioProgress
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'download_items';
  @override
  VerificationContext validateIntegrity(Insertable<DownloadItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('video_id')) {
      context.handle(_videoIdMeta,
          videoId.isAcceptableOrUnknown(data['video_id']!, _videoIdMeta));
    } else if (isInserting) {
      context.missing(_videoIdMeta);
    }
    if (data.containsKey('profile_name')) {
      context.handle(
          _profileNameMeta,
          profileName.isAcceptableOrUnknown(
              data['profile_name']!, _profileNameMeta));
    } else if (isInserting) {
      context.missing(_profileNameMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('channel_name')) {
      context.handle(
          _channelNameMeta,
          channelName.isAcceptableOrUnknown(
              data['channel_name']!, _channelNameMeta));
    } else if (isInserting) {
      context.missing(_channelNameMeta);
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableOrUnknown(
              data['thumbnail_url']!, _thumbnailUrlMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('video_quality')) {
      context.handle(
          _videoQualityMeta,
          videoQuality.isAcceptableOrUnknown(
              data['video_quality']!, _videoQualityMeta));
    }
    if (data.containsKey('audio_quality')) {
      context.handle(
          _audioQualityMeta,
          audioQuality.isAcceptableOrUnknown(
              data['audio_quality']!, _audioQualityMeta));
    }
    if (data.containsKey('download_type')) {
      context.handle(
          _downloadTypeMeta,
          downloadType.isAcceptableOrUnknown(
              data['download_type']!, _downloadTypeMeta));
    } else if (isInserting) {
      context.missing(_downloadTypeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('video_url')) {
      context.handle(_videoUrlMeta,
          videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta));
    }
    if (data.containsKey('audio_url')) {
      context.handle(_audioUrlMeta,
          audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta));
    }
    if (data.containsKey('video_file_path')) {
      context.handle(
          _videoFilePathMeta,
          videoFilePath.isAcceptableOrUnknown(
              data['video_file_path']!, _videoFilePathMeta));
    }
    if (data.containsKey('audio_file_path')) {
      context.handle(
          _audioFilePathMeta,
          audioFilePath.isAcceptableOrUnknown(
              data['audio_file_path']!, _audioFilePathMeta));
    }
    if (data.containsKey('output_file_path')) {
      context.handle(
          _outputFilePathMeta,
          outputFilePath.isAcceptableOrUnknown(
              data['output_file_path']!, _outputFilePathMeta));
    }
    if (data.containsKey('total_bytes')) {
      context.handle(
          _totalBytesMeta,
          totalBytes.isAcceptableOrUnknown(
              data['total_bytes']!, _totalBytesMeta));
    }
    if (data.containsKey('video_total_bytes')) {
      context.handle(
          _videoTotalBytesMeta,
          videoTotalBytes.isAcceptableOrUnknown(
              data['video_total_bytes']!, _videoTotalBytesMeta));
    }
    if (data.containsKey('audio_total_bytes')) {
      context.handle(
          _audioTotalBytesMeta,
          audioTotalBytes.isAcceptableOrUnknown(
              data['audio_total_bytes']!, _audioTotalBytesMeta));
    }
    if (data.containsKey('downloaded_bytes')) {
      context.handle(
          _downloadedBytesMeta,
          downloadedBytes.isAcceptableOrUnknown(
              data['downloaded_bytes']!, _downloadedBytesMeta));
    }
    if (data.containsKey('video_downloaded_bytes')) {
      context.handle(
          _videoDownloadedBytesMeta,
          videoDownloadedBytes.isAcceptableOrUnknown(
              data['video_downloaded_bytes']!, _videoDownloadedBytesMeta));
    }
    if (data.containsKey('audio_downloaded_bytes')) {
      context.handle(
          _audioDownloadedBytesMeta,
          audioDownloadedBytes.isAcceptableOrUnknown(
              data['audio_downloaded_bytes']!, _audioDownloadedBytesMeta));
    }
    if (data.containsKey('download_speed')) {
      context.handle(
          _downloadSpeedMeta,
          downloadSpeed.isAcceptableOrUnknown(
              data['download_speed']!, _downloadSpeedMeta));
    }
    if (data.containsKey('eta_seconds')) {
      context.handle(
          _etaSecondsMeta,
          etaSeconds.isAcceptableOrUnknown(
              data['eta_seconds']!, _etaSecondsMeta));
    }
    if (data.containsKey('current_phase')) {
      context.handle(
          _currentPhaseMeta,
          currentPhase.isAcceptableOrUnknown(
              data['current_phase']!, _currentPhaseMeta));
    }
    if (data.containsKey('error_message')) {
      context.handle(
          _errorMessageMeta,
          errorMessage.isAcceptableOrUnknown(
              data['error_message']!, _errorMessageMeta));
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    }
    if (data.containsKey('completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('video_progress')) {
      context.handle(
          _videoProgressMeta,
          videoProgress.isAcceptableOrUnknown(
              data['video_progress']!, _videoProgressMeta));
    }
    if (data.containsKey('audio_progress')) {
      context.handle(
          _audioProgressMeta,
          audioProgress.isAcceptableOrUnknown(
              data['audio_progress']!, _audioProgressMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DownloadItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DownloadItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      videoId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_id'])!,
      profileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_name'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      channelName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}channel_name'])!,
      thumbnailUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail_url']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      videoQuality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_quality']),
      audioQuality: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audio_quality']),
      downloadType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}download_type'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      videoUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_url']),
      audioUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audio_url']),
      videoFilePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}video_file_path']),
      audioFilePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}audio_file_path']),
      outputFilePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}output_file_path']),
      totalBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_bytes']),
      videoTotalBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}video_total_bytes']),
      audioTotalBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}audio_total_bytes']),
      downloadedBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}downloaded_bytes'])!,
      videoDownloadedBytes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}video_downloaded_bytes'])!,
      audioDownloadedBytes: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audio_downloaded_bytes'])!,
      downloadSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}download_speed'])!,
      etaSeconds: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}eta_seconds']),
      currentPhase: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}current_phase']),
      errorMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error_message']),
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at']),
      completedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}completed_at']),
      videoProgress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}video_progress'])!,
      audioProgress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}audio_progress'])!,
    );
  }

  @override
  $DownloadItemsTable createAlias(String alias) {
    return $DownloadItemsTable(attachedDatabase, alias);
  }
}

class DownloadItem extends DataClass implements Insertable<DownloadItem> {
  final int id;
  final String videoId;
  final String profileName;
  final String title;
  final String channelName;
  final String? thumbnailUrl;
  final int? duration;
  final String? videoQuality;
  final String? audioQuality;
  final int downloadType;
  final int status;
  final String? videoUrl;
  final String? audioUrl;
  final String? videoFilePath;
  final String? audioFilePath;
  final String? outputFilePath;
  final int? totalBytes;
  final int? videoTotalBytes;
  final int? audioTotalBytes;
  final int downloadedBytes;
  final int videoDownloadedBytes;
  final int audioDownloadedBytes;
  final int downloadSpeed;
  final int? etaSeconds;
  final String? currentPhase;
  final String? errorMessage;
  final int retryCount;
  final DateTime createdAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final double videoProgress;
  final double audioProgress;
  const DownloadItem(
      {required this.id,
      required this.videoId,
      required this.profileName,
      required this.title,
      required this.channelName,
      this.thumbnailUrl,
      this.duration,
      this.videoQuality,
      this.audioQuality,
      required this.downloadType,
      required this.status,
      this.videoUrl,
      this.audioUrl,
      this.videoFilePath,
      this.audioFilePath,
      this.outputFilePath,
      this.totalBytes,
      this.videoTotalBytes,
      this.audioTotalBytes,
      required this.downloadedBytes,
      required this.videoDownloadedBytes,
      required this.audioDownloadedBytes,
      required this.downloadSpeed,
      this.etaSeconds,
      this.currentPhase,
      this.errorMessage,
      required this.retryCount,
      required this.createdAt,
      this.startedAt,
      this.completedAt,
      required this.videoProgress,
      required this.audioProgress});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['video_id'] = Variable<String>(videoId);
    map['profile_name'] = Variable<String>(profileName);
    map['title'] = Variable<String>(title);
    map['channel_name'] = Variable<String>(channelName);
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || videoQuality != null) {
      map['video_quality'] = Variable<String>(videoQuality);
    }
    if (!nullToAbsent || audioQuality != null) {
      map['audio_quality'] = Variable<String>(audioQuality);
    }
    map['download_type'] = Variable<int>(downloadType);
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || videoUrl != null) {
      map['video_url'] = Variable<String>(videoUrl);
    }
    if (!nullToAbsent || audioUrl != null) {
      map['audio_url'] = Variable<String>(audioUrl);
    }
    if (!nullToAbsent || videoFilePath != null) {
      map['video_file_path'] = Variable<String>(videoFilePath);
    }
    if (!nullToAbsent || audioFilePath != null) {
      map['audio_file_path'] = Variable<String>(audioFilePath);
    }
    if (!nullToAbsent || outputFilePath != null) {
      map['output_file_path'] = Variable<String>(outputFilePath);
    }
    if (!nullToAbsent || totalBytes != null) {
      map['total_bytes'] = Variable<int>(totalBytes);
    }
    if (!nullToAbsent || videoTotalBytes != null) {
      map['video_total_bytes'] = Variable<int>(videoTotalBytes);
    }
    if (!nullToAbsent || audioTotalBytes != null) {
      map['audio_total_bytes'] = Variable<int>(audioTotalBytes);
    }
    map['downloaded_bytes'] = Variable<int>(downloadedBytes);
    map['video_downloaded_bytes'] = Variable<int>(videoDownloadedBytes);
    map['audio_downloaded_bytes'] = Variable<int>(audioDownloadedBytes);
    map['download_speed'] = Variable<int>(downloadSpeed);
    if (!nullToAbsent || etaSeconds != null) {
      map['eta_seconds'] = Variable<int>(etaSeconds);
    }
    if (!nullToAbsent || currentPhase != null) {
      map['current_phase'] = Variable<String>(currentPhase);
    }
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['retry_count'] = Variable<int>(retryCount);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<DateTime>(startedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<DateTime>(completedAt);
    }
    map['video_progress'] = Variable<double>(videoProgress);
    map['audio_progress'] = Variable<double>(audioProgress);
    return map;
  }

  DownloadItemsCompanion toCompanion(bool nullToAbsent) {
    return DownloadItemsCompanion(
      id: Value(id),
      videoId: Value(videoId),
      profileName: Value(profileName),
      title: Value(title),
      channelName: Value(channelName),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      videoQuality: videoQuality == null && nullToAbsent
          ? const Value.absent()
          : Value(videoQuality),
      audioQuality: audioQuality == null && nullToAbsent
          ? const Value.absent()
          : Value(audioQuality),
      downloadType: Value(downloadType),
      status: Value(status),
      videoUrl: videoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(videoUrl),
      audioUrl: audioUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(audioUrl),
      videoFilePath: videoFilePath == null && nullToAbsent
          ? const Value.absent()
          : Value(videoFilePath),
      audioFilePath: audioFilePath == null && nullToAbsent
          ? const Value.absent()
          : Value(audioFilePath),
      outputFilePath: outputFilePath == null && nullToAbsent
          ? const Value.absent()
          : Value(outputFilePath),
      totalBytes: totalBytes == null && nullToAbsent
          ? const Value.absent()
          : Value(totalBytes),
      videoTotalBytes: videoTotalBytes == null && nullToAbsent
          ? const Value.absent()
          : Value(videoTotalBytes),
      audioTotalBytes: audioTotalBytes == null && nullToAbsent
          ? const Value.absent()
          : Value(audioTotalBytes),
      downloadedBytes: Value(downloadedBytes),
      videoDownloadedBytes: Value(videoDownloadedBytes),
      audioDownloadedBytes: Value(audioDownloadedBytes),
      downloadSpeed: Value(downloadSpeed),
      etaSeconds: etaSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(etaSeconds),
      currentPhase: currentPhase == null && nullToAbsent
          ? const Value.absent()
          : Value(currentPhase),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      retryCount: Value(retryCount),
      createdAt: Value(createdAt),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      videoProgress: Value(videoProgress),
      audioProgress: Value(audioProgress),
    );
  }

  factory DownloadItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DownloadItem(
      id: serializer.fromJson<int>(json['id']),
      videoId: serializer.fromJson<String>(json['videoId']),
      profileName: serializer.fromJson<String>(json['profileName']),
      title: serializer.fromJson<String>(json['title']),
      channelName: serializer.fromJson<String>(json['channelName']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      duration: serializer.fromJson<int?>(json['duration']),
      videoQuality: serializer.fromJson<String?>(json['videoQuality']),
      audioQuality: serializer.fromJson<String?>(json['audioQuality']),
      downloadType: serializer.fromJson<int>(json['downloadType']),
      status: serializer.fromJson<int>(json['status']),
      videoUrl: serializer.fromJson<String?>(json['videoUrl']),
      audioUrl: serializer.fromJson<String?>(json['audioUrl']),
      videoFilePath: serializer.fromJson<String?>(json['videoFilePath']),
      audioFilePath: serializer.fromJson<String?>(json['audioFilePath']),
      outputFilePath: serializer.fromJson<String?>(json['outputFilePath']),
      totalBytes: serializer.fromJson<int?>(json['totalBytes']),
      videoTotalBytes: serializer.fromJson<int?>(json['videoTotalBytes']),
      audioTotalBytes: serializer.fromJson<int?>(json['audioTotalBytes']),
      downloadedBytes: serializer.fromJson<int>(json['downloadedBytes']),
      videoDownloadedBytes:
          serializer.fromJson<int>(json['videoDownloadedBytes']),
      audioDownloadedBytes:
          serializer.fromJson<int>(json['audioDownloadedBytes']),
      downloadSpeed: serializer.fromJson<int>(json['downloadSpeed']),
      etaSeconds: serializer.fromJson<int?>(json['etaSeconds']),
      currentPhase: serializer.fromJson<String?>(json['currentPhase']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      startedAt: serializer.fromJson<DateTime?>(json['startedAt']),
      completedAt: serializer.fromJson<DateTime?>(json['completedAt']),
      videoProgress: serializer.fromJson<double>(json['videoProgress']),
      audioProgress: serializer.fromJson<double>(json['audioProgress']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'videoId': serializer.toJson<String>(videoId),
      'profileName': serializer.toJson<String>(profileName),
      'title': serializer.toJson<String>(title),
      'channelName': serializer.toJson<String>(channelName),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'duration': serializer.toJson<int?>(duration),
      'videoQuality': serializer.toJson<String?>(videoQuality),
      'audioQuality': serializer.toJson<String?>(audioQuality),
      'downloadType': serializer.toJson<int>(downloadType),
      'status': serializer.toJson<int>(status),
      'videoUrl': serializer.toJson<String?>(videoUrl),
      'audioUrl': serializer.toJson<String?>(audioUrl),
      'videoFilePath': serializer.toJson<String?>(videoFilePath),
      'audioFilePath': serializer.toJson<String?>(audioFilePath),
      'outputFilePath': serializer.toJson<String?>(outputFilePath),
      'totalBytes': serializer.toJson<int?>(totalBytes),
      'videoTotalBytes': serializer.toJson<int?>(videoTotalBytes),
      'audioTotalBytes': serializer.toJson<int?>(audioTotalBytes),
      'downloadedBytes': serializer.toJson<int>(downloadedBytes),
      'videoDownloadedBytes': serializer.toJson<int>(videoDownloadedBytes),
      'audioDownloadedBytes': serializer.toJson<int>(audioDownloadedBytes),
      'downloadSpeed': serializer.toJson<int>(downloadSpeed),
      'etaSeconds': serializer.toJson<int?>(etaSeconds),
      'currentPhase': serializer.toJson<String?>(currentPhase),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'retryCount': serializer.toJson<int>(retryCount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'startedAt': serializer.toJson<DateTime?>(startedAt),
      'completedAt': serializer.toJson<DateTime?>(completedAt),
      'videoProgress': serializer.toJson<double>(videoProgress),
      'audioProgress': serializer.toJson<double>(audioProgress),
    };
  }

  DownloadItem copyWith(
          {int? id,
          String? videoId,
          String? profileName,
          String? title,
          String? channelName,
          Value<String?> thumbnailUrl = const Value.absent(),
          Value<int?> duration = const Value.absent(),
          Value<String?> videoQuality = const Value.absent(),
          Value<String?> audioQuality = const Value.absent(),
          int? downloadType,
          int? status,
          Value<String?> videoUrl = const Value.absent(),
          Value<String?> audioUrl = const Value.absent(),
          Value<String?> videoFilePath = const Value.absent(),
          Value<String?> audioFilePath = const Value.absent(),
          Value<String?> outputFilePath = const Value.absent(),
          Value<int?> totalBytes = const Value.absent(),
          Value<int?> videoTotalBytes = const Value.absent(),
          Value<int?> audioTotalBytes = const Value.absent(),
          int? downloadedBytes,
          int? videoDownloadedBytes,
          int? audioDownloadedBytes,
          int? downloadSpeed,
          Value<int?> etaSeconds = const Value.absent(),
          Value<String?> currentPhase = const Value.absent(),
          Value<String?> errorMessage = const Value.absent(),
          int? retryCount,
          DateTime? createdAt,
          Value<DateTime?> startedAt = const Value.absent(),
          Value<DateTime?> completedAt = const Value.absent(),
          double? videoProgress,
          double? audioProgress}) =>
      DownloadItem(
        id: id ?? this.id,
        videoId: videoId ?? this.videoId,
        profileName: profileName ?? this.profileName,
        title: title ?? this.title,
        channelName: channelName ?? this.channelName,
        thumbnailUrl:
            thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
        duration: duration.present ? duration.value : this.duration,
        videoQuality:
            videoQuality.present ? videoQuality.value : this.videoQuality,
        audioQuality:
            audioQuality.present ? audioQuality.value : this.audioQuality,
        downloadType: downloadType ?? this.downloadType,
        status: status ?? this.status,
        videoUrl: videoUrl.present ? videoUrl.value : this.videoUrl,
        audioUrl: audioUrl.present ? audioUrl.value : this.audioUrl,
        videoFilePath:
            videoFilePath.present ? videoFilePath.value : this.videoFilePath,
        audioFilePath:
            audioFilePath.present ? audioFilePath.value : this.audioFilePath,
        outputFilePath:
            outputFilePath.present ? outputFilePath.value : this.outputFilePath,
        totalBytes: totalBytes.present ? totalBytes.value : this.totalBytes,
        videoTotalBytes: videoTotalBytes.present
            ? videoTotalBytes.value
            : this.videoTotalBytes,
        audioTotalBytes: audioTotalBytes.present
            ? audioTotalBytes.value
            : this.audioTotalBytes,
        downloadedBytes: downloadedBytes ?? this.downloadedBytes,
        videoDownloadedBytes: videoDownloadedBytes ?? this.videoDownloadedBytes,
        audioDownloadedBytes: audioDownloadedBytes ?? this.audioDownloadedBytes,
        downloadSpeed: downloadSpeed ?? this.downloadSpeed,
        etaSeconds: etaSeconds.present ? etaSeconds.value : this.etaSeconds,
        currentPhase:
            currentPhase.present ? currentPhase.value : this.currentPhase,
        errorMessage:
            errorMessage.present ? errorMessage.value : this.errorMessage,
        retryCount: retryCount ?? this.retryCount,
        createdAt: createdAt ?? this.createdAt,
        startedAt: startedAt.present ? startedAt.value : this.startedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        videoProgress: videoProgress ?? this.videoProgress,
        audioProgress: audioProgress ?? this.audioProgress,
      );
  DownloadItem copyWithCompanion(DownloadItemsCompanion data) {
    return DownloadItem(
      id: data.id.present ? data.id.value : this.id,
      videoId: data.videoId.present ? data.videoId.value : this.videoId,
      profileName:
          data.profileName.present ? data.profileName.value : this.profileName,
      title: data.title.present ? data.title.value : this.title,
      channelName:
          data.channelName.present ? data.channelName.value : this.channelName,
      thumbnailUrl: data.thumbnailUrl.present
          ? data.thumbnailUrl.value
          : this.thumbnailUrl,
      duration: data.duration.present ? data.duration.value : this.duration,
      videoQuality: data.videoQuality.present
          ? data.videoQuality.value
          : this.videoQuality,
      audioQuality: data.audioQuality.present
          ? data.audioQuality.value
          : this.audioQuality,
      downloadType: data.downloadType.present
          ? data.downloadType.value
          : this.downloadType,
      status: data.status.present ? data.status.value : this.status,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
      audioUrl: data.audioUrl.present ? data.audioUrl.value : this.audioUrl,
      videoFilePath: data.videoFilePath.present
          ? data.videoFilePath.value
          : this.videoFilePath,
      audioFilePath: data.audioFilePath.present
          ? data.audioFilePath.value
          : this.audioFilePath,
      outputFilePath: data.outputFilePath.present
          ? data.outputFilePath.value
          : this.outputFilePath,
      totalBytes:
          data.totalBytes.present ? data.totalBytes.value : this.totalBytes,
      videoTotalBytes: data.videoTotalBytes.present
          ? data.videoTotalBytes.value
          : this.videoTotalBytes,
      audioTotalBytes: data.audioTotalBytes.present
          ? data.audioTotalBytes.value
          : this.audioTotalBytes,
      downloadedBytes: data.downloadedBytes.present
          ? data.downloadedBytes.value
          : this.downloadedBytes,
      videoDownloadedBytes: data.videoDownloadedBytes.present
          ? data.videoDownloadedBytes.value
          : this.videoDownloadedBytes,
      audioDownloadedBytes: data.audioDownloadedBytes.present
          ? data.audioDownloadedBytes.value
          : this.audioDownloadedBytes,
      downloadSpeed: data.downloadSpeed.present
          ? data.downloadSpeed.value
          : this.downloadSpeed,
      etaSeconds:
          data.etaSeconds.present ? data.etaSeconds.value : this.etaSeconds,
      currentPhase: data.currentPhase.present
          ? data.currentPhase.value
          : this.currentPhase,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      videoProgress: data.videoProgress.present
          ? data.videoProgress.value
          : this.videoProgress,
      audioProgress: data.audioProgress.present
          ? data.audioProgress.value
          : this.audioProgress,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DownloadItem(')
          ..write('id: $id, ')
          ..write('videoId: $videoId, ')
          ..write('profileName: $profileName, ')
          ..write('title: $title, ')
          ..write('channelName: $channelName, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('duration: $duration, ')
          ..write('videoQuality: $videoQuality, ')
          ..write('audioQuality: $audioQuality, ')
          ..write('downloadType: $downloadType, ')
          ..write('status: $status, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('videoFilePath: $videoFilePath, ')
          ..write('audioFilePath: $audioFilePath, ')
          ..write('outputFilePath: $outputFilePath, ')
          ..write('totalBytes: $totalBytes, ')
          ..write('videoTotalBytes: $videoTotalBytes, ')
          ..write('audioTotalBytes: $audioTotalBytes, ')
          ..write('downloadedBytes: $downloadedBytes, ')
          ..write('videoDownloadedBytes: $videoDownloadedBytes, ')
          ..write('audioDownloadedBytes: $audioDownloadedBytes, ')
          ..write('downloadSpeed: $downloadSpeed, ')
          ..write('etaSeconds: $etaSeconds, ')
          ..write('currentPhase: $currentPhase, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('videoProgress: $videoProgress, ')
          ..write('audioProgress: $audioProgress')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        videoId,
        profileName,
        title,
        channelName,
        thumbnailUrl,
        duration,
        videoQuality,
        audioQuality,
        downloadType,
        status,
        videoUrl,
        audioUrl,
        videoFilePath,
        audioFilePath,
        outputFilePath,
        totalBytes,
        videoTotalBytes,
        audioTotalBytes,
        downloadedBytes,
        videoDownloadedBytes,
        audioDownloadedBytes,
        downloadSpeed,
        etaSeconds,
        currentPhase,
        errorMessage,
        retryCount,
        createdAt,
        startedAt,
        completedAt,
        videoProgress,
        audioProgress
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DownloadItem &&
          other.id == this.id &&
          other.videoId == this.videoId &&
          other.profileName == this.profileName &&
          other.title == this.title &&
          other.channelName == this.channelName &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.duration == this.duration &&
          other.videoQuality == this.videoQuality &&
          other.audioQuality == this.audioQuality &&
          other.downloadType == this.downloadType &&
          other.status == this.status &&
          other.videoUrl == this.videoUrl &&
          other.audioUrl == this.audioUrl &&
          other.videoFilePath == this.videoFilePath &&
          other.audioFilePath == this.audioFilePath &&
          other.outputFilePath == this.outputFilePath &&
          other.totalBytes == this.totalBytes &&
          other.videoTotalBytes == this.videoTotalBytes &&
          other.audioTotalBytes == this.audioTotalBytes &&
          other.downloadedBytes == this.downloadedBytes &&
          other.videoDownloadedBytes == this.videoDownloadedBytes &&
          other.audioDownloadedBytes == this.audioDownloadedBytes &&
          other.downloadSpeed == this.downloadSpeed &&
          other.etaSeconds == this.etaSeconds &&
          other.currentPhase == this.currentPhase &&
          other.errorMessage == this.errorMessage &&
          other.retryCount == this.retryCount &&
          other.createdAt == this.createdAt &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.videoProgress == this.videoProgress &&
          other.audioProgress == this.audioProgress);
}

class DownloadItemsCompanion extends UpdateCompanion<DownloadItem> {
  final Value<int> id;
  final Value<String> videoId;
  final Value<String> profileName;
  final Value<String> title;
  final Value<String> channelName;
  final Value<String?> thumbnailUrl;
  final Value<int?> duration;
  final Value<String?> videoQuality;
  final Value<String?> audioQuality;
  final Value<int> downloadType;
  final Value<int> status;
  final Value<String?> videoUrl;
  final Value<String?> audioUrl;
  final Value<String?> videoFilePath;
  final Value<String?> audioFilePath;
  final Value<String?> outputFilePath;
  final Value<int?> totalBytes;
  final Value<int?> videoTotalBytes;
  final Value<int?> audioTotalBytes;
  final Value<int> downloadedBytes;
  final Value<int> videoDownloadedBytes;
  final Value<int> audioDownloadedBytes;
  final Value<int> downloadSpeed;
  final Value<int?> etaSeconds;
  final Value<String?> currentPhase;
  final Value<String?> errorMessage;
  final Value<int> retryCount;
  final Value<DateTime> createdAt;
  final Value<DateTime?> startedAt;
  final Value<DateTime?> completedAt;
  final Value<double> videoProgress;
  final Value<double> audioProgress;
  const DownloadItemsCompanion({
    this.id = const Value.absent(),
    this.videoId = const Value.absent(),
    this.profileName = const Value.absent(),
    this.title = const Value.absent(),
    this.channelName = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.duration = const Value.absent(),
    this.videoQuality = const Value.absent(),
    this.audioQuality = const Value.absent(),
    this.downloadType = const Value.absent(),
    this.status = const Value.absent(),
    this.videoUrl = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.videoFilePath = const Value.absent(),
    this.audioFilePath = const Value.absent(),
    this.outputFilePath = const Value.absent(),
    this.totalBytes = const Value.absent(),
    this.videoTotalBytes = const Value.absent(),
    this.audioTotalBytes = const Value.absent(),
    this.downloadedBytes = const Value.absent(),
    this.videoDownloadedBytes = const Value.absent(),
    this.audioDownloadedBytes = const Value.absent(),
    this.downloadSpeed = const Value.absent(),
    this.etaSeconds = const Value.absent(),
    this.currentPhase = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.videoProgress = const Value.absent(),
    this.audioProgress = const Value.absent(),
  });
  DownloadItemsCompanion.insert({
    this.id = const Value.absent(),
    required String videoId,
    required String profileName,
    required String title,
    required String channelName,
    this.thumbnailUrl = const Value.absent(),
    this.duration = const Value.absent(),
    this.videoQuality = const Value.absent(),
    this.audioQuality = const Value.absent(),
    required int downloadType,
    required int status,
    this.videoUrl = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.videoFilePath = const Value.absent(),
    this.audioFilePath = const Value.absent(),
    this.outputFilePath = const Value.absent(),
    this.totalBytes = const Value.absent(),
    this.videoTotalBytes = const Value.absent(),
    this.audioTotalBytes = const Value.absent(),
    this.downloadedBytes = const Value.absent(),
    this.videoDownloadedBytes = const Value.absent(),
    this.audioDownloadedBytes = const Value.absent(),
    this.downloadSpeed = const Value.absent(),
    this.etaSeconds = const Value.absent(),
    this.currentPhase = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.retryCount = const Value.absent(),
    required DateTime createdAt,
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.videoProgress = const Value.absent(),
    this.audioProgress = const Value.absent(),
  })  : videoId = Value(videoId),
        profileName = Value(profileName),
        title = Value(title),
        channelName = Value(channelName),
        downloadType = Value(downloadType),
        status = Value(status),
        createdAt = Value(createdAt);
  static Insertable<DownloadItem> custom({
    Expression<int>? id,
    Expression<String>? videoId,
    Expression<String>? profileName,
    Expression<String>? title,
    Expression<String>? channelName,
    Expression<String>? thumbnailUrl,
    Expression<int>? duration,
    Expression<String>? videoQuality,
    Expression<String>? audioQuality,
    Expression<int>? downloadType,
    Expression<int>? status,
    Expression<String>? videoUrl,
    Expression<String>? audioUrl,
    Expression<String>? videoFilePath,
    Expression<String>? audioFilePath,
    Expression<String>? outputFilePath,
    Expression<int>? totalBytes,
    Expression<int>? videoTotalBytes,
    Expression<int>? audioTotalBytes,
    Expression<int>? downloadedBytes,
    Expression<int>? videoDownloadedBytes,
    Expression<int>? audioDownloadedBytes,
    Expression<int>? downloadSpeed,
    Expression<int>? etaSeconds,
    Expression<String>? currentPhase,
    Expression<String>? errorMessage,
    Expression<int>? retryCount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? completedAt,
    Expression<double>? videoProgress,
    Expression<double>? audioProgress,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (videoId != null) 'video_id': videoId,
      if (profileName != null) 'profile_name': profileName,
      if (title != null) 'title': title,
      if (channelName != null) 'channel_name': channelName,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (duration != null) 'duration': duration,
      if (videoQuality != null) 'video_quality': videoQuality,
      if (audioQuality != null) 'audio_quality': audioQuality,
      if (downloadType != null) 'download_type': downloadType,
      if (status != null) 'status': status,
      if (videoUrl != null) 'video_url': videoUrl,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (videoFilePath != null) 'video_file_path': videoFilePath,
      if (audioFilePath != null) 'audio_file_path': audioFilePath,
      if (outputFilePath != null) 'output_file_path': outputFilePath,
      if (totalBytes != null) 'total_bytes': totalBytes,
      if (videoTotalBytes != null) 'video_total_bytes': videoTotalBytes,
      if (audioTotalBytes != null) 'audio_total_bytes': audioTotalBytes,
      if (downloadedBytes != null) 'downloaded_bytes': downloadedBytes,
      if (videoDownloadedBytes != null)
        'video_downloaded_bytes': videoDownloadedBytes,
      if (audioDownloadedBytes != null)
        'audio_downloaded_bytes': audioDownloadedBytes,
      if (downloadSpeed != null) 'download_speed': downloadSpeed,
      if (etaSeconds != null) 'eta_seconds': etaSeconds,
      if (currentPhase != null) 'current_phase': currentPhase,
      if (errorMessage != null) 'error_message': errorMessage,
      if (retryCount != null) 'retry_count': retryCount,
      if (createdAt != null) 'created_at': createdAt,
      if (startedAt != null) 'started_at': startedAt,
      if (completedAt != null) 'completed_at': completedAt,
      if (videoProgress != null) 'video_progress': videoProgress,
      if (audioProgress != null) 'audio_progress': audioProgress,
    });
  }

  DownloadItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? videoId,
      Value<String>? profileName,
      Value<String>? title,
      Value<String>? channelName,
      Value<String?>? thumbnailUrl,
      Value<int?>? duration,
      Value<String?>? videoQuality,
      Value<String?>? audioQuality,
      Value<int>? downloadType,
      Value<int>? status,
      Value<String?>? videoUrl,
      Value<String?>? audioUrl,
      Value<String?>? videoFilePath,
      Value<String?>? audioFilePath,
      Value<String?>? outputFilePath,
      Value<int?>? totalBytes,
      Value<int?>? videoTotalBytes,
      Value<int?>? audioTotalBytes,
      Value<int>? downloadedBytes,
      Value<int>? videoDownloadedBytes,
      Value<int>? audioDownloadedBytes,
      Value<int>? downloadSpeed,
      Value<int?>? etaSeconds,
      Value<String?>? currentPhase,
      Value<String?>? errorMessage,
      Value<int>? retryCount,
      Value<DateTime>? createdAt,
      Value<DateTime?>? startedAt,
      Value<DateTime?>? completedAt,
      Value<double>? videoProgress,
      Value<double>? audioProgress}) {
    return DownloadItemsCompanion(
      id: id ?? this.id,
      videoId: videoId ?? this.videoId,
      profileName: profileName ?? this.profileName,
      title: title ?? this.title,
      channelName: channelName ?? this.channelName,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      duration: duration ?? this.duration,
      videoQuality: videoQuality ?? this.videoQuality,
      audioQuality: audioQuality ?? this.audioQuality,
      downloadType: downloadType ?? this.downloadType,
      status: status ?? this.status,
      videoUrl: videoUrl ?? this.videoUrl,
      audioUrl: audioUrl ?? this.audioUrl,
      videoFilePath: videoFilePath ?? this.videoFilePath,
      audioFilePath: audioFilePath ?? this.audioFilePath,
      outputFilePath: outputFilePath ?? this.outputFilePath,
      totalBytes: totalBytes ?? this.totalBytes,
      videoTotalBytes: videoTotalBytes ?? this.videoTotalBytes,
      audioTotalBytes: audioTotalBytes ?? this.audioTotalBytes,
      downloadedBytes: downloadedBytes ?? this.downloadedBytes,
      videoDownloadedBytes: videoDownloadedBytes ?? this.videoDownloadedBytes,
      audioDownloadedBytes: audioDownloadedBytes ?? this.audioDownloadedBytes,
      downloadSpeed: downloadSpeed ?? this.downloadSpeed,
      etaSeconds: etaSeconds ?? this.etaSeconds,
      currentPhase: currentPhase ?? this.currentPhase,
      errorMessage: errorMessage ?? this.errorMessage,
      retryCount: retryCount ?? this.retryCount,
      createdAt: createdAt ?? this.createdAt,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      videoProgress: videoProgress ?? this.videoProgress,
      audioProgress: audioProgress ?? this.audioProgress,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (videoId.present) {
      map['video_id'] = Variable<String>(videoId.value);
    }
    if (profileName.present) {
      map['profile_name'] = Variable<String>(profileName.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (channelName.present) {
      map['channel_name'] = Variable<String>(channelName.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (videoQuality.present) {
      map['video_quality'] = Variable<String>(videoQuality.value);
    }
    if (audioQuality.present) {
      map['audio_quality'] = Variable<String>(audioQuality.value);
    }
    if (downloadType.present) {
      map['download_type'] = Variable<int>(downloadType.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (videoFilePath.present) {
      map['video_file_path'] = Variable<String>(videoFilePath.value);
    }
    if (audioFilePath.present) {
      map['audio_file_path'] = Variable<String>(audioFilePath.value);
    }
    if (outputFilePath.present) {
      map['output_file_path'] = Variable<String>(outputFilePath.value);
    }
    if (totalBytes.present) {
      map['total_bytes'] = Variable<int>(totalBytes.value);
    }
    if (videoTotalBytes.present) {
      map['video_total_bytes'] = Variable<int>(videoTotalBytes.value);
    }
    if (audioTotalBytes.present) {
      map['audio_total_bytes'] = Variable<int>(audioTotalBytes.value);
    }
    if (downloadedBytes.present) {
      map['downloaded_bytes'] = Variable<int>(downloadedBytes.value);
    }
    if (videoDownloadedBytes.present) {
      map['video_downloaded_bytes'] = Variable<int>(videoDownloadedBytes.value);
    }
    if (audioDownloadedBytes.present) {
      map['audio_downloaded_bytes'] = Variable<int>(audioDownloadedBytes.value);
    }
    if (downloadSpeed.present) {
      map['download_speed'] = Variable<int>(downloadSpeed.value);
    }
    if (etaSeconds.present) {
      map['eta_seconds'] = Variable<int>(etaSeconds.value);
    }
    if (currentPhase.present) {
      map['current_phase'] = Variable<String>(currentPhase.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    if (videoProgress.present) {
      map['video_progress'] = Variable<double>(videoProgress.value);
    }
    if (audioProgress.present) {
      map['audio_progress'] = Variable<double>(audioProgress.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadItemsCompanion(')
          ..write('id: $id, ')
          ..write('videoId: $videoId, ')
          ..write('profileName: $profileName, ')
          ..write('title: $title, ')
          ..write('channelName: $channelName, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('duration: $duration, ')
          ..write('videoQuality: $videoQuality, ')
          ..write('audioQuality: $audioQuality, ')
          ..write('downloadType: $downloadType, ')
          ..write('status: $status, ')
          ..write('videoUrl: $videoUrl, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('videoFilePath: $videoFilePath, ')
          ..write('audioFilePath: $audioFilePath, ')
          ..write('outputFilePath: $outputFilePath, ')
          ..write('totalBytes: $totalBytes, ')
          ..write('videoTotalBytes: $videoTotalBytes, ')
          ..write('audioTotalBytes: $audioTotalBytes, ')
          ..write('downloadedBytes: $downloadedBytes, ')
          ..write('videoDownloadedBytes: $videoDownloadedBytes, ')
          ..write('audioDownloadedBytes: $audioDownloadedBytes, ')
          ..write('downloadSpeed: $downloadSpeed, ')
          ..write('etaSeconds: $etaSeconds, ')
          ..write('currentPhase: $currentPhase, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('retryCount: $retryCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('videoProgress: $videoProgress, ')
          ..write('audioProgress: $audioProgress')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SettingsEntriesTable settingsEntries =
      $SettingsEntriesTable(this);
  late final $LocalStoreVideosTable localStoreVideos =
      $LocalStoreVideosTable(this);
  late final $SubscriptionsTable subscriptions = $SubscriptionsTable(this);
  late final $SearchHistoryEntriesTable searchHistoryEntries =
      $SearchHistoryEntriesTable(this);
  late final $UserInteractionsTable userInteractions =
      $UserInteractionsTable(this);
  late final $UserTopicPreferencesTable userTopicPreferences =
      $UserTopicPreferencesTable(this);
  late final $DownloadItemsTable downloadItems = $DownloadItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        settingsEntries,
        localStoreVideos,
        subscriptions,
        searchHistoryEntries,
        userInteractions,
        userTopicPreferences,
        downloadItems
      ];
}

typedef $$SettingsEntriesTableCreateCompanionBuilder = SettingsEntriesCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> value,
});
typedef $$SettingsEntriesTableUpdateCompanionBuilder = SettingsEntriesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> value,
});

class $$SettingsEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsEntriesTable> {
  $$SettingsEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$SettingsEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsEntriesTable> {
  $$SettingsEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$SettingsEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsEntriesTable> {
  $$SettingsEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$SettingsEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SettingsEntriesTable,
    SettingsEntry,
    $$SettingsEntriesTableFilterComposer,
    $$SettingsEntriesTableOrderingComposer,
    $$SettingsEntriesTableAnnotationComposer,
    $$SettingsEntriesTableCreateCompanionBuilder,
    $$SettingsEntriesTableUpdateCompanionBuilder,
    (
      SettingsEntry,
      BaseReferences<_$AppDatabase, $SettingsEntriesTable, SettingsEntry>
    ),
    SettingsEntry,
    PrefetchHooks Function()> {
  $$SettingsEntriesTableTableManager(
      _$AppDatabase db, $SettingsEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> value = const Value.absent(),
          }) =>
              SettingsEntriesCompanion(
            id: id,
            name: name,
            value: value,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> value = const Value.absent(),
          }) =>
              SettingsEntriesCompanion.insert(
            id: id,
            name: name,
            value: value,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SettingsEntriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SettingsEntriesTable,
    SettingsEntry,
    $$SettingsEntriesTableFilterComposer,
    $$SettingsEntriesTableOrderingComposer,
    $$SettingsEntriesTableAnnotationComposer,
    $$SettingsEntriesTableCreateCompanionBuilder,
    $$SettingsEntriesTableUpdateCompanionBuilder,
    (
      SettingsEntry,
      BaseReferences<_$AppDatabase, $SettingsEntriesTable, SettingsEntry>
    ),
    SettingsEntry,
    PrefetchHooks Function()>;
typedef $$LocalStoreVideosTableCreateCompanionBuilder
    = LocalStoreVideosCompanion Function({
  Value<int> id,
  required String videoId,
  required String profileName,
  Value<String?> title,
  Value<int?> views,
  Value<String?> thumbnail,
  Value<String?> uploadedDate,
  Value<String?> uploaderName,
  Value<String?> uploaderId,
  Value<String?> uploaderAvatar,
  Value<String?> uploaderSubscriberCount,
  Value<int?> duration,
  Value<bool> uploaderVerified,
  Value<bool> isSaved,
  Value<bool> isHistory,
  Value<bool> isLive,
  Value<int?> playbackPosition,
  Value<DateTime?> time,
});
typedef $$LocalStoreVideosTableUpdateCompanionBuilder
    = LocalStoreVideosCompanion Function({
  Value<int> id,
  Value<String> videoId,
  Value<String> profileName,
  Value<String?> title,
  Value<int?> views,
  Value<String?> thumbnail,
  Value<String?> uploadedDate,
  Value<String?> uploaderName,
  Value<String?> uploaderId,
  Value<String?> uploaderAvatar,
  Value<String?> uploaderSubscriberCount,
  Value<int?> duration,
  Value<bool> uploaderVerified,
  Value<bool> isSaved,
  Value<bool> isHistory,
  Value<bool> isLive,
  Value<int?> playbackPosition,
  Value<DateTime?> time,
});

class $$LocalStoreVideosTableFilterComposer
    extends Composer<_$AppDatabase, $LocalStoreVideosTable> {
  $$LocalStoreVideosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoId => $composableBuilder(
      column: $table.videoId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnail => $composableBuilder(
      column: $table.thumbnail, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uploadedDate => $composableBuilder(
      column: $table.uploadedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uploaderName => $composableBuilder(
      column: $table.uploaderName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uploaderId => $composableBuilder(
      column: $table.uploaderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uploaderAvatar => $composableBuilder(
      column: $table.uploaderAvatar,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uploaderSubscriberCount => $composableBuilder(
      column: $table.uploaderSubscriberCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get uploaderVerified => $composableBuilder(
      column: $table.uploaderVerified,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSaved => $composableBuilder(
      column: $table.isSaved, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isHistory => $composableBuilder(
      column: $table.isHistory, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isLive => $composableBuilder(
      column: $table.isLive, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get playbackPosition => $composableBuilder(
      column: $table.playbackPosition,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get time => $composableBuilder(
      column: $table.time, builder: (column) => ColumnFilters(column));
}

class $$LocalStoreVideosTableOrderingComposer
    extends Composer<_$AppDatabase, $LocalStoreVideosTable> {
  $$LocalStoreVideosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoId => $composableBuilder(
      column: $table.videoId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get views => $composableBuilder(
      column: $table.views, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnail => $composableBuilder(
      column: $table.thumbnail, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uploadedDate => $composableBuilder(
      column: $table.uploadedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uploaderName => $composableBuilder(
      column: $table.uploaderName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uploaderId => $composableBuilder(
      column: $table.uploaderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uploaderAvatar => $composableBuilder(
      column: $table.uploaderAvatar,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uploaderSubscriberCount => $composableBuilder(
      column: $table.uploaderSubscriberCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get uploaderVerified => $composableBuilder(
      column: $table.uploaderVerified,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSaved => $composableBuilder(
      column: $table.isSaved, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isHistory => $composableBuilder(
      column: $table.isHistory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isLive => $composableBuilder(
      column: $table.isLive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get playbackPosition => $composableBuilder(
      column: $table.playbackPosition,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get time => $composableBuilder(
      column: $table.time, builder: (column) => ColumnOrderings(column));
}

class $$LocalStoreVideosTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocalStoreVideosTable> {
  $$LocalStoreVideosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get videoId =>
      $composableBuilder(column: $table.videoId, builder: (column) => column);

  GeneratedColumn<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get views =>
      $composableBuilder(column: $table.views, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);

  GeneratedColumn<String> get uploadedDate => $composableBuilder(
      column: $table.uploadedDate, builder: (column) => column);

  GeneratedColumn<String> get uploaderName => $composableBuilder(
      column: $table.uploaderName, builder: (column) => column);

  GeneratedColumn<String> get uploaderId => $composableBuilder(
      column: $table.uploaderId, builder: (column) => column);

  GeneratedColumn<String> get uploaderAvatar => $composableBuilder(
      column: $table.uploaderAvatar, builder: (column) => column);

  GeneratedColumn<String> get uploaderSubscriberCount => $composableBuilder(
      column: $table.uploaderSubscriberCount, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<bool> get uploaderVerified => $composableBuilder(
      column: $table.uploaderVerified, builder: (column) => column);

  GeneratedColumn<bool> get isSaved =>
      $composableBuilder(column: $table.isSaved, builder: (column) => column);

  GeneratedColumn<bool> get isHistory =>
      $composableBuilder(column: $table.isHistory, builder: (column) => column);

  GeneratedColumn<bool> get isLive =>
      $composableBuilder(column: $table.isLive, builder: (column) => column);

  GeneratedColumn<int> get playbackPosition => $composableBuilder(
      column: $table.playbackPosition, builder: (column) => column);

  GeneratedColumn<DateTime> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);
}

class $$LocalStoreVideosTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocalStoreVideosTable,
    LocalStoreVideo,
    $$LocalStoreVideosTableFilterComposer,
    $$LocalStoreVideosTableOrderingComposer,
    $$LocalStoreVideosTableAnnotationComposer,
    $$LocalStoreVideosTableCreateCompanionBuilder,
    $$LocalStoreVideosTableUpdateCompanionBuilder,
    (
      LocalStoreVideo,
      BaseReferences<_$AppDatabase, $LocalStoreVideosTable, LocalStoreVideo>
    ),
    LocalStoreVideo,
    PrefetchHooks Function()> {
  $$LocalStoreVideosTableTableManager(
      _$AppDatabase db, $LocalStoreVideosTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocalStoreVideosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocalStoreVideosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocalStoreVideosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> videoId = const Value.absent(),
            Value<String> profileName = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> thumbnail = const Value.absent(),
            Value<String?> uploadedDate = const Value.absent(),
            Value<String?> uploaderName = const Value.absent(),
            Value<String?> uploaderId = const Value.absent(),
            Value<String?> uploaderAvatar = const Value.absent(),
            Value<String?> uploaderSubscriberCount = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<bool> uploaderVerified = const Value.absent(),
            Value<bool> isSaved = const Value.absent(),
            Value<bool> isHistory = const Value.absent(),
            Value<bool> isLive = const Value.absent(),
            Value<int?> playbackPosition = const Value.absent(),
            Value<DateTime?> time = const Value.absent(),
          }) =>
              LocalStoreVideosCompanion(
            id: id,
            videoId: videoId,
            profileName: profileName,
            title: title,
            views: views,
            thumbnail: thumbnail,
            uploadedDate: uploadedDate,
            uploaderName: uploaderName,
            uploaderId: uploaderId,
            uploaderAvatar: uploaderAvatar,
            uploaderSubscriberCount: uploaderSubscriberCount,
            duration: duration,
            uploaderVerified: uploaderVerified,
            isSaved: isSaved,
            isHistory: isHistory,
            isLive: isLive,
            playbackPosition: playbackPosition,
            time: time,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String videoId,
            required String profileName,
            Value<String?> title = const Value.absent(),
            Value<int?> views = const Value.absent(),
            Value<String?> thumbnail = const Value.absent(),
            Value<String?> uploadedDate = const Value.absent(),
            Value<String?> uploaderName = const Value.absent(),
            Value<String?> uploaderId = const Value.absent(),
            Value<String?> uploaderAvatar = const Value.absent(),
            Value<String?> uploaderSubscriberCount = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<bool> uploaderVerified = const Value.absent(),
            Value<bool> isSaved = const Value.absent(),
            Value<bool> isHistory = const Value.absent(),
            Value<bool> isLive = const Value.absent(),
            Value<int?> playbackPosition = const Value.absent(),
            Value<DateTime?> time = const Value.absent(),
          }) =>
              LocalStoreVideosCompanion.insert(
            id: id,
            videoId: videoId,
            profileName: profileName,
            title: title,
            views: views,
            thumbnail: thumbnail,
            uploadedDate: uploadedDate,
            uploaderName: uploaderName,
            uploaderId: uploaderId,
            uploaderAvatar: uploaderAvatar,
            uploaderSubscriberCount: uploaderSubscriberCount,
            duration: duration,
            uploaderVerified: uploaderVerified,
            isSaved: isSaved,
            isHistory: isHistory,
            isLive: isLive,
            playbackPosition: playbackPosition,
            time: time,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LocalStoreVideosTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocalStoreVideosTable,
    LocalStoreVideo,
    $$LocalStoreVideosTableFilterComposer,
    $$LocalStoreVideosTableOrderingComposer,
    $$LocalStoreVideosTableAnnotationComposer,
    $$LocalStoreVideosTableCreateCompanionBuilder,
    $$LocalStoreVideosTableUpdateCompanionBuilder,
    (
      LocalStoreVideo,
      BaseReferences<_$AppDatabase, $LocalStoreVideosTable, LocalStoreVideo>
    ),
    LocalStoreVideo,
    PrefetchHooks Function()>;
typedef $$SubscriptionsTableCreateCompanionBuilder = SubscriptionsCompanion
    Function({
  Value<int> id,
  required String channelId,
  required String profileName,
  required String channelName,
  Value<bool> isVerified,
  Value<String?> avatarUrl,
});
typedef $$SubscriptionsTableUpdateCompanionBuilder = SubscriptionsCompanion
    Function({
  Value<int> id,
  Value<String> channelId,
  Value<String> profileName,
  Value<String> channelName,
  Value<bool> isVerified,
  Value<String?> avatarUrl,
});

class $$SubscriptionsTableFilterComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get channelId => $composableBuilder(
      column: $table.channelId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatarUrl => $composableBuilder(
      column: $table.avatarUrl, builder: (column) => ColumnFilters(column));
}

class $$SubscriptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get channelId => $composableBuilder(
      column: $table.channelId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatarUrl => $composableBuilder(
      column: $table.avatarUrl, builder: (column) => ColumnOrderings(column));
}

class $$SubscriptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubscriptionsTable> {
  $$SubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get channelId =>
      $composableBuilder(column: $table.channelId, builder: (column) => column);

  GeneratedColumn<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => column);

  GeneratedColumn<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => column);

  GeneratedColumn<bool> get isVerified => $composableBuilder(
      column: $table.isVerified, builder: (column) => column);

  GeneratedColumn<String> get avatarUrl =>
      $composableBuilder(column: $table.avatarUrl, builder: (column) => column);
}

class $$SubscriptionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubscriptionsTable,
    Subscription,
    $$SubscriptionsTableFilterComposer,
    $$SubscriptionsTableOrderingComposer,
    $$SubscriptionsTableAnnotationComposer,
    $$SubscriptionsTableCreateCompanionBuilder,
    $$SubscriptionsTableUpdateCompanionBuilder,
    (
      Subscription,
      BaseReferences<_$AppDatabase, $SubscriptionsTable, Subscription>
    ),
    Subscription,
    PrefetchHooks Function()> {
  $$SubscriptionsTableTableManager(_$AppDatabase db, $SubscriptionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubscriptionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubscriptionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubscriptionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> channelId = const Value.absent(),
            Value<String> profileName = const Value.absent(),
            Value<String> channelName = const Value.absent(),
            Value<bool> isVerified = const Value.absent(),
            Value<String?> avatarUrl = const Value.absent(),
          }) =>
              SubscriptionsCompanion(
            id: id,
            channelId: channelId,
            profileName: profileName,
            channelName: channelName,
            isVerified: isVerified,
            avatarUrl: avatarUrl,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String channelId,
            required String profileName,
            required String channelName,
            Value<bool> isVerified = const Value.absent(),
            Value<String?> avatarUrl = const Value.absent(),
          }) =>
              SubscriptionsCompanion.insert(
            id: id,
            channelId: channelId,
            profileName: profileName,
            channelName: channelName,
            isVerified: isVerified,
            avatarUrl: avatarUrl,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubscriptionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubscriptionsTable,
    Subscription,
    $$SubscriptionsTableFilterComposer,
    $$SubscriptionsTableOrderingComposer,
    $$SubscriptionsTableAnnotationComposer,
    $$SubscriptionsTableCreateCompanionBuilder,
    $$SubscriptionsTableUpdateCompanionBuilder,
    (
      Subscription,
      BaseReferences<_$AppDatabase, $SubscriptionsTable, Subscription>
    ),
    Subscription,
    PrefetchHooks Function()>;
typedef $$SearchHistoryEntriesTableCreateCompanionBuilder
    = SearchHistoryEntriesCompanion Function({
  Value<int> id,
  required String query,
  required String profileName,
  required DateTime searchedAt,
  Value<int> searchCount,
});
typedef $$SearchHistoryEntriesTableUpdateCompanionBuilder
    = SearchHistoryEntriesCompanion Function({
  Value<int> id,
  Value<String> query,
  Value<String> profileName,
  Value<DateTime> searchedAt,
  Value<int> searchCount,
});

class $$SearchHistoryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SearchHistoryEntriesTable> {
  $$SearchHistoryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get searchCount => $composableBuilder(
      column: $table.searchCount, builder: (column) => ColumnFilters(column));
}

class $$SearchHistoryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchHistoryEntriesTable> {
  $$SearchHistoryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get query => $composableBuilder(
      column: $table.query, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get searchCount => $composableBuilder(
      column: $table.searchCount, builder: (column) => ColumnOrderings(column));
}

class $$SearchHistoryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchHistoryEntriesTable> {
  $$SearchHistoryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get query =>
      $composableBuilder(column: $table.query, builder: (column) => column);

  GeneratedColumn<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => column);

  GeneratedColumn<DateTime> get searchedAt => $composableBuilder(
      column: $table.searchedAt, builder: (column) => column);

  GeneratedColumn<int> get searchCount => $composableBuilder(
      column: $table.searchCount, builder: (column) => column);
}

class $$SearchHistoryEntriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SearchHistoryEntriesTable,
    SearchHistoryEntry,
    $$SearchHistoryEntriesTableFilterComposer,
    $$SearchHistoryEntriesTableOrderingComposer,
    $$SearchHistoryEntriesTableAnnotationComposer,
    $$SearchHistoryEntriesTableCreateCompanionBuilder,
    $$SearchHistoryEntriesTableUpdateCompanionBuilder,
    (
      SearchHistoryEntry,
      BaseReferences<_$AppDatabase, $SearchHistoryEntriesTable,
          SearchHistoryEntry>
    ),
    SearchHistoryEntry,
    PrefetchHooks Function()> {
  $$SearchHistoryEntriesTableTableManager(
      _$AppDatabase db, $SearchHistoryEntriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchHistoryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchHistoryEntriesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchHistoryEntriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> query = const Value.absent(),
            Value<String> profileName = const Value.absent(),
            Value<DateTime> searchedAt = const Value.absent(),
            Value<int> searchCount = const Value.absent(),
          }) =>
              SearchHistoryEntriesCompanion(
            id: id,
            query: query,
            profileName: profileName,
            searchedAt: searchedAt,
            searchCount: searchCount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String query,
            required String profileName,
            required DateTime searchedAt,
            Value<int> searchCount = const Value.absent(),
          }) =>
              SearchHistoryEntriesCompanion.insert(
            id: id,
            query: query,
            profileName: profileName,
            searchedAt: searchedAt,
            searchCount: searchCount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SearchHistoryEntriesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $SearchHistoryEntriesTable,
        SearchHistoryEntry,
        $$SearchHistoryEntriesTableFilterComposer,
        $$SearchHistoryEntriesTableOrderingComposer,
        $$SearchHistoryEntriesTableAnnotationComposer,
        $$SearchHistoryEntriesTableCreateCompanionBuilder,
        $$SearchHistoryEntriesTableUpdateCompanionBuilder,
        (
          SearchHistoryEntry,
          BaseReferences<_$AppDatabase, $SearchHistoryEntriesTable,
              SearchHistoryEntry>
        ),
        SearchHistoryEntry,
        PrefetchHooks Function()>;
typedef $$UserInteractionsTableCreateCompanionBuilder
    = UserInteractionsCompanion Function({
  Value<int> id,
  required String entityId,
  required int interactionType,
  required String profileName,
  required DateTime timestamp,
  Value<double> weight,
  Value<String?> title,
  Value<String?> channelName,
  Value<String?> category,
  Value<String?> tags,
});
typedef $$UserInteractionsTableUpdateCompanionBuilder
    = UserInteractionsCompanion Function({
  Value<int> id,
  Value<String> entityId,
  Value<int> interactionType,
  Value<String> profileName,
  Value<DateTime> timestamp,
  Value<double> weight,
  Value<String?> title,
  Value<String?> channelName,
  Value<String?> category,
  Value<String?> tags,
});

class $$UserInteractionsTableFilterComposer
    extends Composer<_$AppDatabase, $UserInteractionsTable> {
  $$UserInteractionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get interactionType => $composableBuilder(
      column: $table.interactionType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));
}

class $$UserInteractionsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserInteractionsTable> {
  $$UserInteractionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get interactionType => $composableBuilder(
      column: $table.interactionType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get weight => $composableBuilder(
      column: $table.weight, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));
}

class $$UserInteractionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserInteractionsTable> {
  $$UserInteractionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<int> get interactionType => $composableBuilder(
      column: $table.interactionType, builder: (column) => column);

  GeneratedColumn<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);
}

class $$UserInteractionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserInteractionsTable,
    UserInteraction,
    $$UserInteractionsTableFilterComposer,
    $$UserInteractionsTableOrderingComposer,
    $$UserInteractionsTableAnnotationComposer,
    $$UserInteractionsTableCreateCompanionBuilder,
    $$UserInteractionsTableUpdateCompanionBuilder,
    (
      UserInteraction,
      BaseReferences<_$AppDatabase, $UserInteractionsTable, UserInteraction>
    ),
    UserInteraction,
    PrefetchHooks Function()> {
  $$UserInteractionsTableTableManager(
      _$AppDatabase db, $UserInteractionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserInteractionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserInteractionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserInteractionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityId = const Value.absent(),
            Value<int> interactionType = const Value.absent(),
            Value<String> profileName = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
            Value<double> weight = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> channelName = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> tags = const Value.absent(),
          }) =>
              UserInteractionsCompanion(
            id: id,
            entityId: entityId,
            interactionType: interactionType,
            profileName: profileName,
            timestamp: timestamp,
            weight: weight,
            title: title,
            channelName: channelName,
            category: category,
            tags: tags,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityId,
            required int interactionType,
            required String profileName,
            required DateTime timestamp,
            Value<double> weight = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<String?> channelName = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<String?> tags = const Value.absent(),
          }) =>
              UserInteractionsCompanion.insert(
            id: id,
            entityId: entityId,
            interactionType: interactionType,
            profileName: profileName,
            timestamp: timestamp,
            weight: weight,
            title: title,
            channelName: channelName,
            category: category,
            tags: tags,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserInteractionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserInteractionsTable,
    UserInteraction,
    $$UserInteractionsTableFilterComposer,
    $$UserInteractionsTableOrderingComposer,
    $$UserInteractionsTableAnnotationComposer,
    $$UserInteractionsTableCreateCompanionBuilder,
    $$UserInteractionsTableUpdateCompanionBuilder,
    (
      UserInteraction,
      BaseReferences<_$AppDatabase, $UserInteractionsTable, UserInteraction>
    ),
    UserInteraction,
    PrefetchHooks Function()>;
typedef $$UserTopicPreferencesTableCreateCompanionBuilder
    = UserTopicPreferencesCompanion Function({
  Value<int> id,
  required String topic,
  required String profileName,
  Value<double> relevanceScore,
  required DateTime lastUpdated,
});
typedef $$UserTopicPreferencesTableUpdateCompanionBuilder
    = UserTopicPreferencesCompanion Function({
  Value<int> id,
  Value<String> topic,
  Value<String> profileName,
  Value<double> relevanceScore,
  Value<DateTime> lastUpdated,
});

class $$UserTopicPreferencesTableFilterComposer
    extends Composer<_$AppDatabase, $UserTopicPreferencesTable> {
  $$UserTopicPreferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get relevanceScore => $composableBuilder(
      column: $table.relevanceScore,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$UserTopicPreferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserTopicPreferencesTable> {
  $$UserTopicPreferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get topic => $composableBuilder(
      column: $table.topic, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get relevanceScore => $composableBuilder(
      column: $table.relevanceScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$UserTopicPreferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTopicPreferencesTable> {
  $$UserTopicPreferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get topic =>
      $composableBuilder(column: $table.topic, builder: (column) => column);

  GeneratedColumn<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => column);

  GeneratedColumn<double> get relevanceScore => $composableBuilder(
      column: $table.relevanceScore, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$UserTopicPreferencesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserTopicPreferencesTable,
    UserTopicPreference,
    $$UserTopicPreferencesTableFilterComposer,
    $$UserTopicPreferencesTableOrderingComposer,
    $$UserTopicPreferencesTableAnnotationComposer,
    $$UserTopicPreferencesTableCreateCompanionBuilder,
    $$UserTopicPreferencesTableUpdateCompanionBuilder,
    (
      UserTopicPreference,
      BaseReferences<_$AppDatabase, $UserTopicPreferencesTable,
          UserTopicPreference>
    ),
    UserTopicPreference,
    PrefetchHooks Function()> {
  $$UserTopicPreferencesTableTableManager(
      _$AppDatabase db, $UserTopicPreferencesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTopicPreferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTopicPreferencesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTopicPreferencesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> topic = const Value.absent(),
            Value<String> profileName = const Value.absent(),
            Value<double> relevanceScore = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
          }) =>
              UserTopicPreferencesCompanion(
            id: id,
            topic: topic,
            profileName: profileName,
            relevanceScore: relevanceScore,
            lastUpdated: lastUpdated,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String topic,
            required String profileName,
            Value<double> relevanceScore = const Value.absent(),
            required DateTime lastUpdated,
          }) =>
              UserTopicPreferencesCompanion.insert(
            id: id,
            topic: topic,
            profileName: profileName,
            relevanceScore: relevanceScore,
            lastUpdated: lastUpdated,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserTopicPreferencesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $UserTopicPreferencesTable,
        UserTopicPreference,
        $$UserTopicPreferencesTableFilterComposer,
        $$UserTopicPreferencesTableOrderingComposer,
        $$UserTopicPreferencesTableAnnotationComposer,
        $$UserTopicPreferencesTableCreateCompanionBuilder,
        $$UserTopicPreferencesTableUpdateCompanionBuilder,
        (
          UserTopicPreference,
          BaseReferences<_$AppDatabase, $UserTopicPreferencesTable,
              UserTopicPreference>
        ),
        UserTopicPreference,
        PrefetchHooks Function()>;
typedef $$DownloadItemsTableCreateCompanionBuilder = DownloadItemsCompanion
    Function({
  Value<int> id,
  required String videoId,
  required String profileName,
  required String title,
  required String channelName,
  Value<String?> thumbnailUrl,
  Value<int?> duration,
  Value<String?> videoQuality,
  Value<String?> audioQuality,
  required int downloadType,
  required int status,
  Value<String?> videoUrl,
  Value<String?> audioUrl,
  Value<String?> videoFilePath,
  Value<String?> audioFilePath,
  Value<String?> outputFilePath,
  Value<int?> totalBytes,
  Value<int?> videoTotalBytes,
  Value<int?> audioTotalBytes,
  Value<int> downloadedBytes,
  Value<int> videoDownloadedBytes,
  Value<int> audioDownloadedBytes,
  Value<int> downloadSpeed,
  Value<int?> etaSeconds,
  Value<String?> currentPhase,
  Value<String?> errorMessage,
  Value<int> retryCount,
  required DateTime createdAt,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<double> videoProgress,
  Value<double> audioProgress,
});
typedef $$DownloadItemsTableUpdateCompanionBuilder = DownloadItemsCompanion
    Function({
  Value<int> id,
  Value<String> videoId,
  Value<String> profileName,
  Value<String> title,
  Value<String> channelName,
  Value<String?> thumbnailUrl,
  Value<int?> duration,
  Value<String?> videoQuality,
  Value<String?> audioQuality,
  Value<int> downloadType,
  Value<int> status,
  Value<String?> videoUrl,
  Value<String?> audioUrl,
  Value<String?> videoFilePath,
  Value<String?> audioFilePath,
  Value<String?> outputFilePath,
  Value<int?> totalBytes,
  Value<int?> videoTotalBytes,
  Value<int?> audioTotalBytes,
  Value<int> downloadedBytes,
  Value<int> videoDownloadedBytes,
  Value<int> audioDownloadedBytes,
  Value<int> downloadSpeed,
  Value<int?> etaSeconds,
  Value<String?> currentPhase,
  Value<String?> errorMessage,
  Value<int> retryCount,
  Value<DateTime> createdAt,
  Value<DateTime?> startedAt,
  Value<DateTime?> completedAt,
  Value<double> videoProgress,
  Value<double> audioProgress,
});

class $$DownloadItemsTableFilterComposer
    extends Composer<_$AppDatabase, $DownloadItemsTable> {
  $$DownloadItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoId => $composableBuilder(
      column: $table.videoId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnailUrl => $composableBuilder(
      column: $table.thumbnailUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoQuality => $composableBuilder(
      column: $table.videoQuality, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get audioQuality => $composableBuilder(
      column: $table.audioQuality, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get downloadType => $composableBuilder(
      column: $table.downloadType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get audioUrl => $composableBuilder(
      column: $table.audioUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get videoFilePath => $composableBuilder(
      column: $table.videoFilePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get audioFilePath => $composableBuilder(
      column: $table.audioFilePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get outputFilePath => $composableBuilder(
      column: $table.outputFilePath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalBytes => $composableBuilder(
      column: $table.totalBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get videoTotalBytes => $composableBuilder(
      column: $table.videoTotalBytes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get audioTotalBytes => $composableBuilder(
      column: $table.audioTotalBytes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get downloadedBytes => $composableBuilder(
      column: $table.downloadedBytes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get videoDownloadedBytes => $composableBuilder(
      column: $table.videoDownloadedBytes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get audioDownloadedBytes => $composableBuilder(
      column: $table.audioDownloadedBytes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get downloadSpeed => $composableBuilder(
      column: $table.downloadSpeed, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get etaSeconds => $composableBuilder(
      column: $table.etaSeconds, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentPhase => $composableBuilder(
      column: $table.currentPhase, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get videoProgress => $composableBuilder(
      column: $table.videoProgress, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get audioProgress => $composableBuilder(
      column: $table.audioProgress, builder: (column) => ColumnFilters(column));
}

class $$DownloadItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $DownloadItemsTable> {
  $$DownloadItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoId => $composableBuilder(
      column: $table.videoId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnailUrl => $composableBuilder(
      column: $table.thumbnailUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get duration => $composableBuilder(
      column: $table.duration, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoQuality => $composableBuilder(
      column: $table.videoQuality,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get audioQuality => $composableBuilder(
      column: $table.audioQuality,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get downloadType => $composableBuilder(
      column: $table.downloadType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoUrl => $composableBuilder(
      column: $table.videoUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get audioUrl => $composableBuilder(
      column: $table.audioUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get videoFilePath => $composableBuilder(
      column: $table.videoFilePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get audioFilePath => $composableBuilder(
      column: $table.audioFilePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get outputFilePath => $composableBuilder(
      column: $table.outputFilePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalBytes => $composableBuilder(
      column: $table.totalBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get videoTotalBytes => $composableBuilder(
      column: $table.videoTotalBytes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get audioTotalBytes => $composableBuilder(
      column: $table.audioTotalBytes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get downloadedBytes => $composableBuilder(
      column: $table.downloadedBytes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get videoDownloadedBytes => $composableBuilder(
      column: $table.videoDownloadedBytes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get audioDownloadedBytes => $composableBuilder(
      column: $table.audioDownloadedBytes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get downloadSpeed => $composableBuilder(
      column: $table.downloadSpeed,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get etaSeconds => $composableBuilder(
      column: $table.etaSeconds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentPhase => $composableBuilder(
      column: $table.currentPhase,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get videoProgress => $composableBuilder(
      column: $table.videoProgress,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get audioProgress => $composableBuilder(
      column: $table.audioProgress,
      builder: (column) => ColumnOrderings(column));
}

class $$DownloadItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DownloadItemsTable> {
  $$DownloadItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get videoId =>
      $composableBuilder(column: $table.videoId, builder: (column) => column);

  GeneratedColumn<String> get profileName => $composableBuilder(
      column: $table.profileName, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get channelName => $composableBuilder(
      column: $table.channelName, builder: (column) => column);

  GeneratedColumn<String> get thumbnailUrl => $composableBuilder(
      column: $table.thumbnailUrl, builder: (column) => column);

  GeneratedColumn<int> get duration =>
      $composableBuilder(column: $table.duration, builder: (column) => column);

  GeneratedColumn<String> get videoQuality => $composableBuilder(
      column: $table.videoQuality, builder: (column) => column);

  GeneratedColumn<String> get audioQuality => $composableBuilder(
      column: $table.audioQuality, builder: (column) => column);

  GeneratedColumn<int> get downloadType => $composableBuilder(
      column: $table.downloadType, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  GeneratedColumn<String> get audioUrl =>
      $composableBuilder(column: $table.audioUrl, builder: (column) => column);

  GeneratedColumn<String> get videoFilePath => $composableBuilder(
      column: $table.videoFilePath, builder: (column) => column);

  GeneratedColumn<String> get audioFilePath => $composableBuilder(
      column: $table.audioFilePath, builder: (column) => column);

  GeneratedColumn<String> get outputFilePath => $composableBuilder(
      column: $table.outputFilePath, builder: (column) => column);

  GeneratedColumn<int> get totalBytes => $composableBuilder(
      column: $table.totalBytes, builder: (column) => column);

  GeneratedColumn<int> get videoTotalBytes => $composableBuilder(
      column: $table.videoTotalBytes, builder: (column) => column);

  GeneratedColumn<int> get audioTotalBytes => $composableBuilder(
      column: $table.audioTotalBytes, builder: (column) => column);

  GeneratedColumn<int> get downloadedBytes => $composableBuilder(
      column: $table.downloadedBytes, builder: (column) => column);

  GeneratedColumn<int> get videoDownloadedBytes => $composableBuilder(
      column: $table.videoDownloadedBytes, builder: (column) => column);

  GeneratedColumn<int> get audioDownloadedBytes => $composableBuilder(
      column: $table.audioDownloadedBytes, builder: (column) => column);

  GeneratedColumn<int> get downloadSpeed => $composableBuilder(
      column: $table.downloadSpeed, builder: (column) => column);

  GeneratedColumn<int> get etaSeconds => $composableBuilder(
      column: $table.etaSeconds, builder: (column) => column);

  GeneratedColumn<String> get currentPhase => $composableBuilder(
      column: $table.currentPhase, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<double> get videoProgress => $composableBuilder(
      column: $table.videoProgress, builder: (column) => column);

  GeneratedColumn<double> get audioProgress => $composableBuilder(
      column: $table.audioProgress, builder: (column) => column);
}

class $$DownloadItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DownloadItemsTable,
    DownloadItem,
    $$DownloadItemsTableFilterComposer,
    $$DownloadItemsTableOrderingComposer,
    $$DownloadItemsTableAnnotationComposer,
    $$DownloadItemsTableCreateCompanionBuilder,
    $$DownloadItemsTableUpdateCompanionBuilder,
    (
      DownloadItem,
      BaseReferences<_$AppDatabase, $DownloadItemsTable, DownloadItem>
    ),
    DownloadItem,
    PrefetchHooks Function()> {
  $$DownloadItemsTableTableManager(_$AppDatabase db, $DownloadItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DownloadItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DownloadItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DownloadItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> videoId = const Value.absent(),
            Value<String> profileName = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> channelName = const Value.absent(),
            Value<String?> thumbnailUrl = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> videoQuality = const Value.absent(),
            Value<String?> audioQuality = const Value.absent(),
            Value<int> downloadType = const Value.absent(),
            Value<int> status = const Value.absent(),
            Value<String?> videoUrl = const Value.absent(),
            Value<String?> audioUrl = const Value.absent(),
            Value<String?> videoFilePath = const Value.absent(),
            Value<String?> audioFilePath = const Value.absent(),
            Value<String?> outputFilePath = const Value.absent(),
            Value<int?> totalBytes = const Value.absent(),
            Value<int?> videoTotalBytes = const Value.absent(),
            Value<int?> audioTotalBytes = const Value.absent(),
            Value<int> downloadedBytes = const Value.absent(),
            Value<int> videoDownloadedBytes = const Value.absent(),
            Value<int> audioDownloadedBytes = const Value.absent(),
            Value<int> downloadSpeed = const Value.absent(),
            Value<int?> etaSeconds = const Value.absent(),
            Value<String?> currentPhase = const Value.absent(),
            Value<String?> errorMessage = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<double> videoProgress = const Value.absent(),
            Value<double> audioProgress = const Value.absent(),
          }) =>
              DownloadItemsCompanion(
            id: id,
            videoId: videoId,
            profileName: profileName,
            title: title,
            channelName: channelName,
            thumbnailUrl: thumbnailUrl,
            duration: duration,
            videoQuality: videoQuality,
            audioQuality: audioQuality,
            downloadType: downloadType,
            status: status,
            videoUrl: videoUrl,
            audioUrl: audioUrl,
            videoFilePath: videoFilePath,
            audioFilePath: audioFilePath,
            outputFilePath: outputFilePath,
            totalBytes: totalBytes,
            videoTotalBytes: videoTotalBytes,
            audioTotalBytes: audioTotalBytes,
            downloadedBytes: downloadedBytes,
            videoDownloadedBytes: videoDownloadedBytes,
            audioDownloadedBytes: audioDownloadedBytes,
            downloadSpeed: downloadSpeed,
            etaSeconds: etaSeconds,
            currentPhase: currentPhase,
            errorMessage: errorMessage,
            retryCount: retryCount,
            createdAt: createdAt,
            startedAt: startedAt,
            completedAt: completedAt,
            videoProgress: videoProgress,
            audioProgress: audioProgress,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String videoId,
            required String profileName,
            required String title,
            required String channelName,
            Value<String?> thumbnailUrl = const Value.absent(),
            Value<int?> duration = const Value.absent(),
            Value<String?> videoQuality = const Value.absent(),
            Value<String?> audioQuality = const Value.absent(),
            required int downloadType,
            required int status,
            Value<String?> videoUrl = const Value.absent(),
            Value<String?> audioUrl = const Value.absent(),
            Value<String?> videoFilePath = const Value.absent(),
            Value<String?> audioFilePath = const Value.absent(),
            Value<String?> outputFilePath = const Value.absent(),
            Value<int?> totalBytes = const Value.absent(),
            Value<int?> videoTotalBytes = const Value.absent(),
            Value<int?> audioTotalBytes = const Value.absent(),
            Value<int> downloadedBytes = const Value.absent(),
            Value<int> videoDownloadedBytes = const Value.absent(),
            Value<int> audioDownloadedBytes = const Value.absent(),
            Value<int> downloadSpeed = const Value.absent(),
            Value<int?> etaSeconds = const Value.absent(),
            Value<String?> currentPhase = const Value.absent(),
            Value<String?> errorMessage = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            required DateTime createdAt,
            Value<DateTime?> startedAt = const Value.absent(),
            Value<DateTime?> completedAt = const Value.absent(),
            Value<double> videoProgress = const Value.absent(),
            Value<double> audioProgress = const Value.absent(),
          }) =>
              DownloadItemsCompanion.insert(
            id: id,
            videoId: videoId,
            profileName: profileName,
            title: title,
            channelName: channelName,
            thumbnailUrl: thumbnailUrl,
            duration: duration,
            videoQuality: videoQuality,
            audioQuality: audioQuality,
            downloadType: downloadType,
            status: status,
            videoUrl: videoUrl,
            audioUrl: audioUrl,
            videoFilePath: videoFilePath,
            audioFilePath: audioFilePath,
            outputFilePath: outputFilePath,
            totalBytes: totalBytes,
            videoTotalBytes: videoTotalBytes,
            audioTotalBytes: audioTotalBytes,
            downloadedBytes: downloadedBytes,
            videoDownloadedBytes: videoDownloadedBytes,
            audioDownloadedBytes: audioDownloadedBytes,
            downloadSpeed: downloadSpeed,
            etaSeconds: etaSeconds,
            currentPhase: currentPhase,
            errorMessage: errorMessage,
            retryCount: retryCount,
            createdAt: createdAt,
            startedAt: startedAt,
            completedAt: completedAt,
            videoProgress: videoProgress,
            audioProgress: audioProgress,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DownloadItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DownloadItemsTable,
    DownloadItem,
    $$DownloadItemsTableFilterComposer,
    $$DownloadItemsTableOrderingComposer,
    $$DownloadItemsTableAnnotationComposer,
    $$DownloadItemsTableCreateCompanionBuilder,
    $$DownloadItemsTableUpdateCompanionBuilder,
    (
      DownloadItem,
      BaseReferences<_$AppDatabase, $DownloadItemsTable, DownloadItem>
    ),
    DownloadItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SettingsEntriesTableTableManager get settingsEntries =>
      $$SettingsEntriesTableTableManager(_db, _db.settingsEntries);
  $$LocalStoreVideosTableTableManager get localStoreVideos =>
      $$LocalStoreVideosTableTableManager(_db, _db.localStoreVideos);
  $$SubscriptionsTableTableManager get subscriptions =>
      $$SubscriptionsTableTableManager(_db, _db.subscriptions);
  $$SearchHistoryEntriesTableTableManager get searchHistoryEntries =>
      $$SearchHistoryEntriesTableTableManager(_db, _db.searchHistoryEntries);
  $$UserInteractionsTableTableManager get userInteractions =>
      $$UserInteractionsTableTableManager(_db, _db.userInteractions);
  $$UserTopicPreferencesTableTableManager get userTopicPreferences =>
      $$UserTopicPreferencesTableTableManager(_db, _db.userTopicPreferences);
  $$DownloadItemsTableTableManager get downloadItems =>
      $$DownloadItemsTableTableManager(_db, _db.downloadItems);
}
