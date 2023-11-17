// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_end_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteEndUser _$RemoteEndUserFromJson(Map<String, dynamic> json) =>
    RemoteEndUser(
      json['id'] as String?,
      json['name'] as String?,
      json['isAllowed'] as String?,
    );

Map<String, dynamic> _$RemoteEndUserToJson(RemoteEndUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isAllowed': instance.isAllowed,
    };
