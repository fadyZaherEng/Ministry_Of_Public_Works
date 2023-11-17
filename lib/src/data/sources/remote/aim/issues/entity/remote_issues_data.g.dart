// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_issues_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIssuesData _$RemoteIssuesDataFromJson(Map<String, dynamic> json) =>
    RemoteIssuesData(
      (json['projectIssuesList'] as List<dynamic>?)
          ?.map((e) => RemoteIssue.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemoteIssuesDataToJson(RemoteIssuesData instance) =>
    <String, dynamic>{
      'projectIssuesList': instance.issues,
      'recordsTotal': instance.recordsTotal,
    };
