import 'package:json_annotation/json_annotation.dart';

part 'agreements_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class AgreementsRequest {
  @JsonKey(name: "keyword")
  String? keyword;
  @JsonKey(name: "sortColumn")
  String? sortColumn;
  @JsonKey(name: "colDir")
  String? colDir;
  @JsonKey(name: "pageNo")
  int? pageNo;
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "year")
  int? year;
  @JsonKey(name: "month")
  int? month;
  @JsonKey(name: "isEnglishLanguage")
  bool? isEnglishLanguage;
  @JsonKey(name: "projectPhaseId")
  String? projectPhaseId;
  @JsonKey(name: "projectId")
  String? projectId;
  @JsonKey(name: "sector")
  String? sector;

  AgreementsRequest(
      {this.keyword,
      this.sortColumn,
      this.colDir,
      this.pageNo,
      this.pageSize,
      this.isEnglishLanguage,
      this.projectPhaseId,
      this.projectId,
      this.year,
      this.sector,
      this.month});

  AgreementsRequest copyWith({
    String? keyword,
    int? year,
    int? month,
    String? projectTypeId,
    String? projectPhaseId,
    String? sortColumn,
    String? sector,
    String? colDir,
    int? pageNo,
    int? pageSize,
    bool? isEnglishLanguage,
    String? projectId,
    int? status,
  }) =>
      AgreementsRequest(
          keyword: keyword ?? this.keyword,
          year: year ?? this.year,
          month: month ?? this.month,
          projectPhaseId: projectPhaseId ?? this.projectPhaseId,
          sortColumn: "id",
          colDir: colDir ?? this.colDir,
          pageNo: pageNo ?? this.pageNo,
          sector: sector ?? this.sector,
          pageSize: pageSize ?? this.pageSize,
          isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
          projectId: projectId ?? this.projectId);


  factory AgreementsRequest.fromJson(Map<String, dynamic> json) =>
      _$AgreementsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AgreementsRequestToJson(this);
}
