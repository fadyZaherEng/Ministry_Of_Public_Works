// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_milestones_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteMilestonesData _$RemoteMilestonesDataFromJson(
        Map<String, dynamic> json) =>
    RemoteMilestonesData(
      (json['projectMilestonesList'] as List<dynamic>?)
          ?.map((e) => RemoteMilestone.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemoteMilestonesDataToJson(
        RemoteMilestonesData instance) =>
    <String, dynamic>{
      'projectMilestonesList': instance.milestones,
      'recordsTotal': instance.recordsTotal,
    };
