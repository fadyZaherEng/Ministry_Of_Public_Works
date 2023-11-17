// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUser _$RemoteUserFromJson(Map<String, dynamic> json) => RemoteUser(
      json['id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['principleName'] as String?,
      json['userGroup'] as String?,
      json['isDeleted'] as bool?,
      (json['groups'] as List<dynamic>?)
          ?.map((e) => RemoteGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteUserToJson(RemoteUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'principleName': instance.principleName,
      'userGroup': instance.userGroup,
      'isDeleted': instance.isDeleted,
      'groups': instance.groups,
    };
