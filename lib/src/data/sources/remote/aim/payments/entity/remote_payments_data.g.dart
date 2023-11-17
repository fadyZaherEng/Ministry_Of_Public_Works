// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_payments_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePaymentsData _$RemotePaymentsDataFromJson(Map<String, dynamic> json) =>
    RemotePaymentsData(
      (json['projectPaymentsList'] as List<dynamic>?)
          ?.map((e) => RemotePayment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemotePaymentsDataToJson(RemotePaymentsData instance) =>
    <String, dynamic>{
      'projectPaymentsList': instance.payments,
      'recordsTotal': instance.recordsTotal,
    };
