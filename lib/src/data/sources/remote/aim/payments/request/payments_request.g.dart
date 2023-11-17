// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentsRequest _$PaymentsRequestFromJson(Map<String, dynamic> json) =>
    PaymentsRequest(
      keyword: json['keyword'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      sector: json['sector'] as String?,
      projectPhaseId: json['projectPhaseId'] as String?,
      status: json['status'] as String?,
      projectId: json['projectId'] as String?,
    );

Map<String, dynamic> _$PaymentsRequestToJson(PaymentsRequest instance) =>
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
      'sector': instance.sector,
      'projectId': instance.projectId,
      'status': instance.status,
    };
