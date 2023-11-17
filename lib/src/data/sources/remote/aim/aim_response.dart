import 'package:json_annotation/json_annotation.dart';

part 'aim_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class AIMResponse<T> {
  @JsonKey(name: "errorCode")
  int? errorCode;
  @JsonKey(name: "errorMessage")
  String? errorMessage;
  @JsonKey(name: "data")
  T? data;

  AIMResponse({
    this.errorCode,
    this.errorMessage,
    this.data,
  });

  factory AIMResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$AIMResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson() => _$AIMResponseToJson(this, (T) {
        return T as Map<String, dynamic>;
      });
}
