// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_issues_levels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIssuesLevels _$RemoteIssuesLevelsFromJson(Map<String, dynamic> json) =>
    RemoteIssuesLevels(
      json['lowPriority'] as int?,
      json['meduimPriority'] as int?,
      json['highPriority'] as int?,
    );

Map<String, dynamic> _$RemoteIssuesLevelsToJson(RemoteIssuesLevels instance) =>
    <String, dynamic>{
      'lowPriority': instance.lowPriority,
      'meduimPriority': instance.meduimPriority,
      'highPriority': instance.highPriority,
    };
