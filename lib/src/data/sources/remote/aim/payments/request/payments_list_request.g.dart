// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentsListRequest _$PaymentsListRequestFromJson(Map<String, dynamic> json) =>
    PaymentsListRequest(
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
      color: json['color'] as int?,
    );

Map<String, dynamic> _$PaymentsListRequestToJson(
        PaymentsListRequest instance) =>
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
      'color': instance.color,
      'isEnglishLanguage': instance.isEnglishLanguage,
    };
