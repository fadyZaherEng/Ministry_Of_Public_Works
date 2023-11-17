import 'package:json_annotation/json_annotation.dart';

part 'analysis_list_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class AnalysisListRequest {
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
  @JsonKey(name: "sector")
  String? sector;
  @JsonKey(name: "phase")
  String? phase;
  @JsonKey(name: "projectId")
  String? projectId;
  @JsonKey(name: "isEnglishLanguage")
  bool? isEnglishLanguage;
  @JsonKey(name: "year")
  int? year;

  AnalysisListRequest({
    this.keyword,
    this.sortColumn,
    this.colDir,
    this.pageNo,
    this.pageSize,
    this.isEnglishLanguage,
    this.phase,
    this.sector,
    this.projectId,
    this.year,
  });

  AnalysisListRequest copyWith({
    String? keyword,
    int? year,
    String? projectId,
    String? sortColumn,
    String? colDir,
    String? phase,
    String? sector,
    int? pageNo,
    int? pageSize,
    bool? isEnglishLanguage,
  }) =>
      AnalysisListRequest(
        keyword: keyword ?? this.keyword,
        year: year ?? this.year,
        projectId: projectId ?? this.projectId,
        sortColumn: sortColumn ?? this.sortColumn,
        colDir: colDir ?? this.colDir,
        phase: phase ?? this.phase,
        sector: sector ?? this.sector,
        pageNo: pageNo ?? this.pageNo,
        pageSize: pageSize ?? this.pageSize,
        isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
      );

  factory AnalysisListRequest.fromJson(Map<String, dynamic> json) =>
      _$AnalysisListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AnalysisListRequestToJson(this);
}
