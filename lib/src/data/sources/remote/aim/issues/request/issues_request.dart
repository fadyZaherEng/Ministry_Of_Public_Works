import 'package:json_annotation/json_annotation.dart';

part 'issues_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class IssuesRequest {
  @JsonKey(name: "keyword")
  String? keyword;
  @JsonKey(name: "sortColumn")
  String? sortColumn;
  @JsonKey(name: "colDir")
  String? colDir;
  @JsonKey(name: "pageNo")
  int? pageNo;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "fromDate")
  String? fromDate;
  @JsonKey(name: "toDate")
  String? toDate;
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


  IssuesRequest({
    this.keyword,
    this.sortColumn,
    this.colDir,
    this.pageNo,
    this.pageSize,
    this.isEnglishLanguage,
    this.fromDate,
    this.toDate,
    this.projectId,
    this.status,
    this.projectPhaseId,
    this.sector,
  });

  IssuesRequest copyWith({
    String? keyword,
    String? fromDate,
    String? toDate,
    String? projectTypeId,
    String? projectPhaseId,
    String? sortColumn,
    String? colDir,
    int? pageNo,
    int? pageSize,
    bool? isEnglishLanguage,
    String? projectId,
    String? sector,
    int? status,
  }) =>
      IssuesRequest(
          keyword: keyword ?? this.keyword,
          fromDate: fromDate ?? this.fromDate,
          toDate: toDate ?? this.toDate,
          projectPhaseId: projectPhaseId ?? this.projectPhaseId,
          sortColumn: sortColumn ?? this.sortColumn,
          colDir: colDir ?? this.colDir,
          pageNo: pageNo ?? this.pageNo,
          pageSize: pageSize ?? this.pageSize,
          isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
          projectId: projectId ?? this.projectId,
          sector: sector ?? this.sector,
          status: status ?? this.status);


  factory IssuesRequest.fromJson(Map<String, dynamic> json) =>
      _$IssuesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$IssuesRequestToJson(this);
}
