// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variations_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariationsRequest _$VariationsRequestFromJson(Map<String, dynamic> json) =>
    VariationsRequest(
      keyword: json['keyword'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      projectTypeId: json['projectTypeId'] as String?,
      projectPhaseId: json['projectPhaseId'] as String?,
      impactOnCost: json['impactOnCost'] as String?,
      phase: json['phase'] as String?,
      sector: json['sector'] as String?,
    );

Map<String, dynamic> _$VariationsRequestToJson(VariationsRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'pageSize': instance.pageSize,
      'isEnglishLanguage': instance.isEnglishLanguage,
      'projectPhaseId': instance.projectPhaseId,
      'projectTypeId': instance.projectTypeId,
      'impactOnCost': instance.impactOnCost,
      'phase': instance.phase,
      'sector': instance.sector,
    };
