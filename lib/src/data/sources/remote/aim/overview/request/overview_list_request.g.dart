// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverviewListRequest _$OverviewListRequestFromJson(Map<String, dynamic> json) =>
    OverviewListRequest(
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

Map<String, dynamic> _$OverviewListRequestToJson(
        OverviewListRequest instance) =>
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
