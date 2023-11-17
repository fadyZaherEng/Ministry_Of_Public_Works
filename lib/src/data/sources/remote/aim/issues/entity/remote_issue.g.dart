// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIssue _$RemoteIssueFromJson(Map<String, dynamic> json) => RemoteIssue(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      json['projectSector'] as String?,
      json['statusstr'] as String?,
      json['title'] as String?,
      json['phasestr'] as String?,
      json['dueDatestr'] as String?,
      json['assignedTo'] as String?,
      (json['priority'] as num?)?.toDouble(),
      (json['getAttachments'] as List<dynamic>?)
          ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['description'] as String?,
    );

Map<String, dynamic> _$RemoteIssueToJson(RemoteIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'title': instance.title,
      'phasestr': instance.projectPhase,
      'priority': instance.priority,
      'assignedTo': instance.assignedTo,
      'statusstr': instance.status,
      'dueDatestr': instance.dueDate,
      'contractNumber': instance.agreementNumber,
      'projectSector': instance.projectSector,
      'description': instance.description,
      'getAttachments': instance.attachments,
    };
