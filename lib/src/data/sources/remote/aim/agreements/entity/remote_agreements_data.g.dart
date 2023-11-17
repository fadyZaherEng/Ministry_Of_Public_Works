// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_agreements_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAgreementsData _$RemoteAgreementsDataFromJson(
        Map<String, dynamic> json) =>
    RemoteAgreementsData(
      (json['projectSupervisionServicelist'] as List<dynamic>?)
          ?.map((e) => RemoteAgreement.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemoteAgreementsDataToJson(
        RemoteAgreementsData instance) =>
    <String, dynamic>{
      'projectSupervisionServicelist': instance.agreements,
      'recordsTotal': instance.recordsTotal,
    };
