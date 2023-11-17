// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issues_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssuesListRequest _$IssuesListRequestFromJson(Map<String, dynamic> json) =>
    IssuesListRequest(
      keyword: json['keyword'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      phase: json['phase'] as String?,
      sector: json['sector'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
    );

Map<String, dynamic> _$IssuesListRequestToJson(IssuesListRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'sector': instance.sector,
      'phase': instance.phase,
      'toDate': instance.toDate,
      'fromDate': instance.fromDate,
      'isEnglishLanguage': instance.isEnglishLanguage,
    };
