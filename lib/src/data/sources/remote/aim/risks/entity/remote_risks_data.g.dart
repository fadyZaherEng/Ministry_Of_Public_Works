// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_risks_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteRisksData _$RemoteRisksDataFromJson(Map<String, dynamic> json) =>
    RemoteRisksData(
      (json['projectRisksList'] as List<dynamic>?)
          ?.map((e) => RemoteRisk.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemoteRisksDataToJson(RemoteRisksData instance) =>
    <String, dynamic>{
      'projectRisksList': instance.risks,
      'recordsTotal': instance.recordsTotal,
    };
