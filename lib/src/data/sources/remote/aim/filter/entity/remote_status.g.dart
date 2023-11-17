// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteStatus _$RemoteStatusFromJson(Map<String, dynamic> json) => RemoteStatus(
      json['id'] as int?,
      json['name'] as String?,
      json['isAllowed'] as String?,
    );

Map<String, dynamic> _$RemoteStatusToJson(RemoteStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isAllowed': instance.isAllowed,
    };
