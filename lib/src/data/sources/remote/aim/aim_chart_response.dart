import 'package:json_annotation/json_annotation.dart';

part 'aim_chart_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class AIMChartResponse<T> {
  @JsonKey(name: "data")
  T? data;

  AIMChartResponse({
    this.data,
  });

  factory AIMChartResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$AIMChartResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson() => _$AIMChartResponseToJson(this, (T) {
    return T as Map<String, dynamic>;
  });
}