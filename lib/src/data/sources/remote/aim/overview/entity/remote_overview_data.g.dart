// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_overview_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOverviewData _$RemoteOverviewDataFromJson(Map<String, dynamic> json) =>
    RemoteOverviewData(
      (json['overviewList'] as List<dynamic>?)
          ?.map((e) => RemoteOverview.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemoteOverviewDataToJson(RemoteOverviewData instance) =>
    <String, dynamic>{
      'overviewList': instance.overviews,
      'recordsTotal': instance.recordsTotal,
    };
