// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_analysis_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAnalysisData _$RemoteAnalysisDataFromJson(Map<String, dynamic> json) =>
    RemoteAnalysisData(
      (json['projectMonthlyReportsList'] as List<dynamic>?)
          ?.map((e) => RemoteAnalysis.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemoteAnalysisDataToJson(RemoteAnalysisData instance) =>
    <String, dynamic>{
      'projectMonthlyReportsList': instance.analysis,
      'recordsTotal': instance.recordsTotal,
    };
