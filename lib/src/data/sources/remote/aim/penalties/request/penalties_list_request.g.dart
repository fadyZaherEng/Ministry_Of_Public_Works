// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalties_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PenaltiesListRequest _$PenaltiesListRequestFromJson(
        Map<String, dynamic> json) =>
    PenaltiesListRequest(
      keyword: json['keyword'] as String?,
      sortColumn: json['sortColumn'] as String?,
      color: json['color'] as int?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      phase: json['phase'] as String?,
      sector: json['sector'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
    );

Map<String, dynamic> _$PenaltiesListRequestToJson(
        PenaltiesListRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'color': instance.color,
      'sector': instance.sector,
      'phase': instance.phase,
      'toDate': instance.toDate,
      'fromDate': instance.fromDate,
      'isEnglishLanguage': instance.isEnglishLanguage,
    };
