import 'package:json_annotation/json_annotation.dart';

part 'reports_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ReportsRequest {
  @JsonKey(name: "keyword")
  String? keyword;
  @JsonKey(name: "sortColumn")
  String? sortColumn;
  @JsonKey(name: "colDir")
  String? colDir;
  @JsonKey(name: "pageNo")
  int? pageNo;
  @JsonKey(name: "year")
  int? year;
  @JsonKey(name: "month")
  int? month;
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "isEnglishLanguage")
  bool? isEnglishLanguage;
  @JsonKey(name: "projectPhaseId")
  String? projectPhaseId;
  @JsonKey(name: "projectId")
  String? projectId;
  @JsonKey(name: "sector")
  String? sector;

  ReportsRequest({
    this.keyword,
    this.month,
    this.year,
    this.projectId,
    this.projectPhaseId,
    this.sortColumn,
    this.colDir,
    this.pageNo,
    this.pageSize,
    this.isEnglishLanguage,
    this.sector,
  });

  ReportsRequest copyWith({
    String? keyword,
    int? month,
    int? year,
    String? projectId,
    String? projectPhaseId,
    String? sortColumn,
    String? colDir,
    String? sector,
    int? pageNo,
    int? pageSize,
    bool? isEnglishLanguage,
  }) =>
      ReportsRequest(
        keyword: keyword ?? this.keyword,
        month: month ?? this.month,
        year: year ?? this.year,
        projectId: projectId ?? this.projectId,
        projectPhaseId: projectPhaseId ?? this.projectPhaseId,
        sortColumn: sortColumn ?? this.sortColumn,
        sector: sector ?? this.sector,
        colDir: colDir ?? this.colDir,
        pageNo: pageNo ?? this.pageNo,
        pageSize: pageSize ?? this.pageSize,
        isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
      );

  factory ReportsRequest.fromJson(Map<String, dynamic> json) =>
      _$ReportsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReportsRequestToJson(this);
}
