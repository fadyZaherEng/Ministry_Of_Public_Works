// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'risks_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RisksRequest _$RisksRequestFromJson(Map<String, dynamic> json) => RisksRequest(
      keyword: json['keyword'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      projectId: json['projectId'] as String?,
      status: json['status'] as int?,
      projectPhaseId: json['projectPhaseId'] as String?,
      sector: json['sector'] as String?,
    );

Map<String, dynamic> _$RisksRequestToJson(RisksRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'status': instance.status,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'pageSize': instance.pageSize,
      'isEnglishLanguage': instance.isEnglishLanguage,
      'projectPhaseId': instance.projectPhaseId,
      'projectId': instance.projectId,
      'sector': instance.sector,
    };
