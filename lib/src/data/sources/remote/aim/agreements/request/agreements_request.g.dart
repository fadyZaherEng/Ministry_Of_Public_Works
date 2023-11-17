// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreements_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgreementsRequest _$AgreementsRequestFromJson(Map<String, dynamic> json) =>
    AgreementsRequest(
      keyword: json['keyword'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      projectPhaseId: json['projectPhaseId'] as String?,
      projectId: json['projectId'] as String?,
      year: json['year'] as int?,
      sector: json['sector'] as String?,
      month: json['month'] as int?,
    );

Map<String, dynamic> _$AgreementsRequestToJson(AgreementsRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'year': instance.year,
      'month': instance.month,
      'isEnglishLanguage': instance.isEnglishLanguage,
      'projectPhaseId': instance.projectPhaseId,
      'projectId': instance.projectId,
      'sector': instance.sector,
    };
