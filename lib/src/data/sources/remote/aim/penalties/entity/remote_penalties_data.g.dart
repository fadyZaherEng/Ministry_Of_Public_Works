// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_penalties_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePenaltiesData _$RemotePenaltiesDataFromJson(Map<String, dynamic> json) =>
    RemotePenaltiesData(
      (json['penaltiesList'] as List<dynamic>?)
          ?.map((e) => RemotePenalty.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemotePenaltiesDataToJson(
        RemotePenaltiesData instance) =>
    <String, dynamic>{
      'penaltiesList': instance.penalties,
      'recordsTotal': instance.recordsTotal,
    };
