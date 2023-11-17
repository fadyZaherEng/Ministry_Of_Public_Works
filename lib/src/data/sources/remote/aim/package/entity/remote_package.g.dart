// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePackage _$RemotePackageFromJson(Map<String, dynamic> json) =>
    RemotePackage(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      json['finalHandOverCertificationstr'] as String?,
      json['finalPaymentIssuedstr'] as String?,
      json['initialHandOverCertificationstr'] as String?,
      json['finalInsuranceReleasedstr'] as String?,
      json['releasedReservedWarrantystr'] as String?,
      json['pbkpi'] as int?,
    );

Map<String, dynamic> _$RemotePackageToJson(RemotePackage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'contractNumber': instance.agreementNumber,
      'finalHandOverCertificationstr': instance.finalHandOverCertificationstr,
      'finalPaymentIssuedstr': instance.finalPaymentIssuedstr,
      'initialHandOverCertificationstr':
          instance.initialHandOverCertificationstr,
      'finalInsuranceReleasedstr': instance.finalInsuranceReleasedstr,
      'releasedReservedWarrantystr': instance.releasedReservedWarrantystr,
      'pbkpi': instance.pbkpi,
    };
