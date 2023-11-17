// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_design_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDesignData _$RemoteDesignDataFromJson(Map<String, dynamic> json) =>
    RemoteDesignData(
      designs: (json['checklistsList'] as List<dynamic>?)
              ?.map((e) => RemoteDesign.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recordsTotal: json['recordsTotal'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteDesignDataToJson(RemoteDesignData instance) =>
    <String, dynamic>{
      'checklistsList': instance.designs,
      'recordsTotal': instance.recordsTotal,
    };
