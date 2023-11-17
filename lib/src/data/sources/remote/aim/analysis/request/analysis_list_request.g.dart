// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisListRequest _$AnalysisListRequestFromJson(Map<String, dynamic> json) =>
    AnalysisListRequest(
      keyword: json['keyword'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      phase: json['phase'] as String?,
      sector: json['sector'] as String?,
      projectId: json['projectId'] as String?,
      year: json['year'] as int?,
    );

Map<String, dynamic> _$AnalysisListRequestToJson(
        AnalysisListRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'sector': instance.sector,
      'phase': instance.phase,
      'projectId': instance.projectId,
      'isEnglishLanguage': instance.isEnglishLanguage,
      'year': instance.year,
    };
