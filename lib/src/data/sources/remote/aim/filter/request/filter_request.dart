import 'package:json_annotation/json_annotation.dart';

part 'filter_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class FilterRequest {
  @JsonKey(name: "isEnglishLanguage")
  bool? isEnglishLanguage;

  FilterRequest({
    this.isEnglishLanguage,
  });

  factory FilterRequest.fromJson(Map<String, dynamic> json) =>
      _$FilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FilterRequestToJson(this);
}
