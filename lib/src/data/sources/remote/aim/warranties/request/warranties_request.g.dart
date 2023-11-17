// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warranties_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarrantiesRequest _$WarrantiesRequestFromJson(Map<String, dynamic> json) =>
    WarrantiesRequest(
      keyword: json['keyword'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      warrantyType: json['warrantyType'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      phase: json['phase'] as String?,
    );

Map<String, dynamic> _$WarrantiesRequestToJson(WarrantiesRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'pageSize': instance.pageSize,
      'isEnglishLanguage': instance.isEnglishLanguage,
      'warrantyType': instance.warrantyType,
      'phase': instance.phase,
    };
