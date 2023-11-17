// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteProject _$RemoteProjectFromJson(Map<String, dynamic> json) =>
    RemoteProject(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      json['phaseName'] as String?,
      json['projectStatusstr'] as String?,
      json['beneficiaryName'] as String?,
      json['projectSector'] as String?,
      json['creationDatestr'] as String?,
      json['projectEngineerName'] as String?,
      json['contractAmountstr'] as String?,
      json['totalPenaltiesstr'] as String?,
      (json['contractAmount'] as num?)?.toDouble(),
      (json['totalPenalties'] as num?)?.toDouble(),
      (json['penaltiesKPI'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RemoteProjectToJson(RemoteProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'contractNumber': instance.agreementNumber,
      'phaseName': instance.phaseName,
      'projectStatusstr': instance.statusName,
      'beneficiaryName': instance.beneficiaryName,
      'projectSector': instance.projectSector,
      'creationDatestr': instance.creationDate,
      'projectEngineerName': instance.projectEngineerName,
      'contractAmountstr': instance.contractAmountstr,
      'totalPenaltiesstr': instance.totalPenaltiesstr,
      'contractAmount': instance.contractAmount,
      'totalPenalties': instance.totalPenalties,
      'penaltiesKPI': instance.penaltiesKPI,
    };
