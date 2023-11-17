// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_reports_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteReportsData _$RemoteReportsDataFromJson(Map<String, dynamic> json) =>
    RemoteReportsData(
      (json['projectMonthlyReportsList'] as List<dynamic>?)
          ?.map((e) => RemoteReport.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemoteReportsDataToJson(RemoteReportsData instance) =>
    <String, dynamic>{
      'projectMonthlyReportsList': instance.reports,
      'recordsTotal': instance.recordsTotal,
    };
