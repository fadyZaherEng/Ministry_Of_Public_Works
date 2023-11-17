// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_risk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteRisk _$RemoteRiskFromJson(Map<String, dynamic> json) => RemoteRisk(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      json['description'] as String?,
      json['statusstr'] as String?,
      json['title'] as String?,
      json['phasestr'] as String?,
      json['dueDatestr'] as String?,
      json['assignedTo'] as String?,
      (json['impact'] as num?)?.toDouble(),
      json['exposurestr'] as String?,
      json['projectSector'] as String?,
      (json['riskProbability'] as num?)?.toDouble(),
      (json['getAttachments'] as List<dynamic>?)
          ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteRiskToJson(RemoteRisk instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'contractNumber': instance.agreementNumber,
      'title': instance.title,
      'phasestr': instance.projectPhase,
      'assignedTo': instance.assignedTo,
      'riskProbability': instance.probability,
      'impact': instance.impact,
      'exposurestr': instance.severity,
      'statusstr': instance.status,
      'dueDatestr': instance.dueDate,
      'projectSector': instance.projectSector,
      'description': instance.description,
      'getAttachments': instance.attachments,
    };
