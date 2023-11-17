// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_contract_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteContractData _$RemoteContractDataFromJson(Map<String, dynamic> json) =>
    RemoteContractData(
      contracts: (json['projectsList'] as List<dynamic>?)
              ?.map((e) => RemoteContract.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recordsTotal: json['recordsTotal'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteContractDataToJson(RemoteContractData instance) =>
    <String, dynamic>{
      'projectsList': instance.contracts,
      'recordsTotal': instance.recordsTotal,
    };
