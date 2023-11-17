// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_project_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteProjectData _$RemoteProjectDataFromJson(Map<String, dynamic> json) =>
    RemoteProjectData(
      (json['projectsList'] as List<dynamic>?)
          ?.map((e) => RemoteProject.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemoteProjectDataToJson(RemoteProjectData instance) =>
    <String, dynamic>{
      'projectsList': instance.projects,
      'recordsTotal': instance.recordsTotal,
    };
