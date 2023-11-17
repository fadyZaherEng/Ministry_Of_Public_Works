import 'package:json_annotation/json_annotation.dart';

part 'risks_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class RisksRequest {
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

  RisksRequest({
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

  RisksRequest copyWith({
    String? keyword,
    String? fromDate,
    String? toDate,
    String? sector,
    String? projectPhaseId,
    String? sortColumn,
    String? colDir,
    int? pageNo,
    int? pageSize,
    bool? isEnglishLanguage,
    String? projectId,
    int? status,
  }) =>
      RisksRequest(
          keyword: keyword ?? this.keyword,
          fromDate: fromDate ?? this.fromDate,
          toDate: toDate ?? this.toDate,
          sector: sector ?? this.sector,
          projectPhaseId: projectPhaseId ?? this.projectPhaseId,
          sortColumn: sortColumn ?? this.sortColumn,
          colDir: colDir ?? this.colDir,
          pageNo: pageNo ?? this.pageNo,
          pageSize: pageSize ?? this.pageSize,
          isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
          projectId: projectId ?? this.projectId,
          status: status ?? this.status);

  factory RisksRequest.fromJson(Map<String, dynamic> json) =>
      _$RisksRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RisksRequestToJson(this);
}
