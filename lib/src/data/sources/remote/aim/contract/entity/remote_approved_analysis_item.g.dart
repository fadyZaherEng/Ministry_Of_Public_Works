// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_approved_analysis_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteApprovedAnalysisItem _$RemoteApprovedAnalysisItemFromJson(
        Map<String, dynamic> json) =>
    RemoteApprovedAnalysisItem(
      json['approved'] as int?,
      json['notApproved'] as int?,
    );

Map<String, dynamic> _$RemoteApprovedAnalysisItemToJson(
        RemoteApprovedAnalysisItem instance) =>
    <String, dynamic>{
      'approved': instance.approved,
      'notApproved': instance.notApproved,
    };
