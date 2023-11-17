// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestones_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MilestonesRequest _$MilestonesRequestFromJson(Map<String, dynamic> json) =>
    MilestonesRequest(
      keyword: json['keyword'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      status: json['status'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      sector: json['sector'] as String?,
      projectPhaseId: json['projectPhaseId'] as String?,
    );

Map<String, dynamic> _$MilestonesRequestToJson(MilestonesRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'pageSize': instance.pageSize,
      'status': instance.status,
      'isEnglishLanguage': instance.isEnglishLanguage,
      'projectPhaseId': instance.projectPhaseId,
      'sector': instance.sector,
    };
