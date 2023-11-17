// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOverview _$RemoteOverviewFromJson(Map<String, dynamic> json) =>
    RemoteOverview(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      json['phase'] as String?,
      json['projectSector'] as String?,
      json['creationDatestr'] as String?,
      json['projectEngineer'] as String?,
      json['contractAmountstr'] as String?,
    );

Map<String, dynamic> _$RemoteOverviewToJson(RemoteOverview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'contractNumber': instance.agreementNumber,
      'phase': instance.phaseName,
      'projectSector': instance.projectSector,
      'creationDatestr': instance.creationDate,
      'projectEngineer': instance.projectEngineer,
      'contractAmountstr': instance.contractAmount,
    };
