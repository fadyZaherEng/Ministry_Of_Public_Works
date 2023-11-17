// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_warranty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteWarranty _$RemoteWarrantyFromJson(Map<String, dynamic> json) =>
    RemoteWarranty(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      json['projectSector'] as String?,
      json['warrantiesTypesstr'] as String?,
      (json['warrantyAmount'] as num?)?.toDouble(),
      json['warrantyStartdatestr'] as String?,
      json['warrantyExpiryDatestr'] as String?,
      json['warrantyDescription'] as String?,
      (json['getAttachments'] as List<dynamic>?)
          ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['phasestr'] as String?,
    );

Map<String, dynamic> _$RemoteWarrantyToJson(RemoteWarranty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'contractNumber': instance.agreementNumber,
      'projectSector': instance.projectSector,
      'phasestr': instance.phase,
      'warrantyDescription': instance.warrantyDescription,
      'warrantiesTypesstr': instance.warrantiesType,
      'warrantyAmount': instance.warrantyAmount,
      'warrantyStartdatestr': instance.warrantyStartDate,
      'warrantyExpiryDatestr': instance.warrantyExpiryDate,
      'getAttachments': instance.attachments,
    };
