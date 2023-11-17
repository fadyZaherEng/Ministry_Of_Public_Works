// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_operation_analysis_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOperationAnalysisItem _$RemoteOperationAnalysisItemFromJson(
        Map<String, dynamic> json) =>
    RemoteOperationAnalysisItem(
      ALessThan: json['a_LessThan'] as int? ?? 0,
      BBetween: json['b_Between'] as int? ?? 0,
      CMoreThan: json['c_MoreThan'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteOperationAnalysisItemToJson(
        RemoteOperationAnalysisItem instance) =>
    <String, dynamic>{
      'a_LessThan': instance.ALessThan,
      'b_Between': instance.BBetween,
      'c_MoreThan': instance.CMoreThan,
    };
