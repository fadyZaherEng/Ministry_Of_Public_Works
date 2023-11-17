// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectsRequest _$ProjectsRequestFromJson(Map<String, dynamic> json) =>
    ProjectsRequest(
      keyword: json['keyword'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      sectorId: json['sector'] as String?,
      projectPhaseId: json['projectPhaseId'] as String?,
      sortColumn: json['sortColumn'] as String?,
      colDir: json['colDir'] as String?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      isEnglishLanguage: json['isEnglishLanguage'] as bool?,
      endUser: json['endUser'] as String?,
    );

Map<String, dynamic> _$ProjectsRequestToJson(ProjectsRequest instance) =>
    <String, dynamic>{
      'keyword': instance.keyword,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'sector': instance.sectorId,
      'projectPhaseId': instance.projectPhaseId,
      'sortColumn': instance.sortColumn,
      'colDir': instance.colDir,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'isEnglishLanguage': instance.isEnglishLanguage,
      'endUser': instance.endUser,
    };
