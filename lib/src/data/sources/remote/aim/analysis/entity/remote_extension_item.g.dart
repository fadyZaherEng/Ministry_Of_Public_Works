// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_extension_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteExtensionItem _$RemoteExtensionItemFromJson(Map<String, dynamic> json) =>
    RemoteExtensionItem(
      (json['extensionPeriod'] as num?)?.toDouble(),
      json['month'] as int?,
    );

Map<String, dynamic> _$RemoteExtensionItemToJson(
        RemoteExtensionItem instance) =>
    <String, dynamic>{
      'extensionPeriod': instance.extensionPeriod,
      'month': instance.month,
    };
