// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'penalties_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PenaltiesRequest _$PenaltiesRequestFromJson(Map<String, dynamic> json) =>
    PenaltiesRequest(
      keyword: json['keyword'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      penaltyType: json['penaltyType'] as String?,
      phase: json['phase'] as String?,
      sector: json['sector'] as String?,
    );

Map<String, dynamic> _$PenaltiesRequestToJson(PenaltiesRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'pageSize': instance.pageSize,
      'isEnglishLanguage': instance.isEnglishLanguage,
      'penaltyType': instance.penaltyType,
      'phase': instance.phase,
      'sector': instance.sector,
    };
