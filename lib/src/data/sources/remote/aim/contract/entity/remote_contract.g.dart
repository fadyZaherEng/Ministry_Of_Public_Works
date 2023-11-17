// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteContract _$RemoteContractFromJson(Map<String, dynamic> json) =>
    RemoteContract(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      json['projectSector'] as String?,
      json['approved'] as String?,
      json['operationandMaintenanceContract'] as String?,
      json['delay'] as String?,
      json['variancePercentage'] as String?,
    );

Map<String, dynamic> _$RemoteContractToJson(RemoteContract instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'contractNumber': instance.agreementNumber,
      'projectSector': instance.sector,
      'approved': instance.approved,
      'operationandMaintenanceContract':
          instance.operationandMaintenanceContract,
      'delay': instance.delay,
      'variancePercentage': instance.variancePercentage,
    };
