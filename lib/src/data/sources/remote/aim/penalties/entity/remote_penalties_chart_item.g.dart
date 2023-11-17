// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_penalties_chart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePenaltiesChartItem _$RemotePenaltiesChartItemFromJson(
        Map<String, dynamic> json) =>
    RemotePenaltiesChartItem(
      json['noPenalty'] as int?,
      json['lessThanTen'] as int?,
      json['moreThanTen'] as int?,
    );

Map<String, dynamic> _$RemotePenaltiesChartItemToJson(
        RemotePenaltiesChartItem instance) =>
    <String, dynamic>{
      'noPenalty': instance.noPenalty,
      'lessThanTen': instance.lessThanTen,
      'moreThanTen': instance.moreThanTen,
    };
