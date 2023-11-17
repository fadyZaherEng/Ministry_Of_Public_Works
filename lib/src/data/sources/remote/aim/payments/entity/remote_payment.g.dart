// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePayment _$RemotePaymentFromJson(Map<String, dynamic> json) =>
    RemotePayment(
      json['id'] as String?,
      json['projectName'] as String?,
      json['contractNumber'] as String?,
      json['projectSector'] as String?,
      json['title'] as String?,
      json['phasestr'] as String?,
      (json['paymentAmount'] as num?)?.toDouble(),
      json['paymentDatestr'] as String?,
      json['plannedPaymentDatestr'] as String?,
      json['actualPaymentDatestr'] as String?,
      json['paymentStatusstr'] as String?,
      (json['getAttachments'] as List<dynamic>?)
          ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['paymentVariance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RemotePaymentToJson(RemotePayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'title': instance.title,
      'phasestr': instance.projectPhase,
      'paymentAmount': instance.paymentAmount,
      'paymentVariance': instance.paymentVariance,
      'paymentDatestr': instance.paymentDatestr,
      'plannedPaymentDatestr': instance.plannedPaymentDate,
      'actualPaymentDatestr': instance.actualPaymentDate,
      'paymentStatusstr': instance.status,
      'contractNumber': instance.agreementNumber,
      'projectSector': instance.projectSector,
      'getAttachments': instance.attachments,
    };
