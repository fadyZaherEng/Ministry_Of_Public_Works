// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAttachment _$RemoteAttachmentFromJson(Map<String, dynamic> json) =>
    RemoteAttachment(
      json['id'] as String?,
      json['caption'] as String?,
      json['mediaUrl'] as String?,
      json['mediaExtension'] as String?,
    );

Map<String, dynamic> _$RemoteAttachmentToJson(RemoteAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'caption': instance.name,
      'mediaUrl': instance.url,
      'mediaExtension': instance.mediaExtension,
    };
