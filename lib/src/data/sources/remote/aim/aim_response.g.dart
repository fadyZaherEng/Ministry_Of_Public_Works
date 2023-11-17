// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aim_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AIMResponse<T> _$AIMResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    AIMResponse<T>(
      errorCode: json['errorCode'] as int?,
      errorMessage: json['errorMessage'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$AIMResponseToJson<T>(
  AIMResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMessage': instance.errorMessage,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
