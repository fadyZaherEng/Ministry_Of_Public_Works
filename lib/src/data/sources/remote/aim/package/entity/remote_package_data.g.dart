// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_package_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePackageData _$RemotePackageDataFromJson(Map<String, dynamic> json) =>
    RemotePackageData(
      (json['checklistsList'] as List<dynamic>?)
          ?.map((e) => RemotePackage.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemotePackageDataToJson(RemotePackageData instance) =>
    <String, dynamic>{
      'checklistsList': instance.packages,
      'recordsTotal': instance.recordsTotal,
    };
