// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_milestone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteMilestone _$RemoteMilestoneFromJson(Map<String, dynamic> json) =>
    RemoteMilestone(
      json['id'] as String?,
      json['projectName'] as String?,
      json['statusstr'] as String?,
      json['title'] as String?,
      json['phasestr'] as String?,
      json['actualFinishDatestr'] as String?,
      json['plannedFinishDatestr'] as String?,
      (json['getAttachments'] as List<dynamic>?)
          ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['projectSector'] as String?,
    );

Map<String, dynamic> _$RemoteMilestoneToJson(RemoteMilestone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'title': instance.title,
      'phasestr': instance.projectPhase,
      'plannedFinishDatestr': instance.plannedFinishDate,
      'actualFinishDatestr': instance.actualFinishDate,
      'statusstr': instance.status,
      'projectSector': instance.projectSector,
      'getAttachments': instance.attachments,
    };
