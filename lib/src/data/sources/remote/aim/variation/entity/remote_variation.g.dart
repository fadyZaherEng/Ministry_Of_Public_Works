// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_variation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteVariation _$RemoteVariationFromJson(Map<String, dynamic> json) =>
    RemoteVariation(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      json['phasestr'] as String?,
      json['projectManager'] as String?,
      json['contractAmountstr'] as String?,
      json['projectSector'] as String?,
      (json['variationOrdersKPI'] as num?)?.toDouble(),
      json['variationOrderValuestr'] as String?,
      json['variationOrderTotalstr'] as String?,
      json['datestr'] as String?,
      json['impactOnCoststr'] as String?,
      (json['getAttachments'] as List<dynamic>?)
          ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['userWhoAskedForVariationOrderstr'] as String?,
      json['justification'] as String?,
    );

Map<String, dynamic> _$RemoteVariationToJson(RemoteVariation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'contractNumber': instance.agreementNumber,
      'userWhoAskedForVariationOrderstr':
          instance.userWhoAskedForVariationOrderstr,
      'justification': instance.justification,
      'projectManager': instance.projectEngineer,
      'projectSector': instance.sector,
      'variationOrderTotalstr': instance.variation,
      'variationOrderValuestr': instance.variationValueStr,
      'contractAmountstr': instance.contractAmount,
      'variationOrdersKPI': instance.variationKPI,
      'datestr': instance.date,
      'phasestr': instance.projectPhase,
      'impactOnCoststr': instance.impactOnCost,
      'getAttachments': instance.attachments,
    };
