// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_penalty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePenalty _$RemotePenaltyFromJson(Map<String, dynamic> json) =>
    RemotePenalty(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      json['projectManager'] as String?,
      json['contractor'] as String?,
      json['penaltiesTypesstr'] as String?,
      (json['penaltyAmount'] as num?)?.toDouble(),
      json['penaltyDatestr'] as String?,
      (json['getAttachments'] as List<dynamic>?)
          ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['phaseName'] as String?,
      json['penaltiesDescription'] as String?,
      json['projectSector'] as String?,
    );

Map<String, dynamic> _$RemotePenaltyToJson(RemotePenalty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'contractNumber': instance.agreementNumber,
      'phaseName': instance.phaseName,
      'projectSector': instance.projectSector,
      'projectManager': instance.projectEngineer,
      'contractor': instance.contractor,
      'penaltiesTypesstr': instance.type,
      'penaltyAmount': instance.amount,
      'penaltyDatestr': instance.date,
      'penaltiesDescription': instance.penaltiesDescription,
      'getAttachments': instance.attachments,
    };
