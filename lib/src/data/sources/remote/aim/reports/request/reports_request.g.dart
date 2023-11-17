// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportsRequest _$ReportsRequestFromJson(Map<String, dynamic> json) =>
    ReportsRequest(
      keyword: json['keyword'] as String?,
      month: json['month'] as int?,
      year: json['year'] as int?,
      projectId: json['projectId'] as String?,
      projectPhaseId: json['projectPhaseId'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      sector: json['sector'] as String?,
    );

Map<String, dynamic> _$ReportsRequestToJson(ReportsRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'year': instance.year,
      'month': instance.month,
      'pageSize': instance.pageSize,
      'isEnglishLanguage': instance.isEnglishLanguage,
      'projectPhaseId': instance.projectPhaseId,
      'projectId': instance.projectId,
      'sector': instance.sector,
    };
