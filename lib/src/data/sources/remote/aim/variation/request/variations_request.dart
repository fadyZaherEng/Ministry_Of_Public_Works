import 'package:json_annotation/json_annotation.dart';

part 'variations_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class VariationsRequest {
  @JsonKey(name: "keyword")
  String? keyword;
  @JsonKey(name: "sortColumn")
  String? sortColumn;
  @JsonKey(name: "colDir")
  String? colDir;
  @JsonKey(name: "pageNo")
  int? pageNo;
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
  @JsonKey(name: "projectTypeId")
  String? projectTypeId;
  @JsonKey(name: "impactOnCost")
  String? impactOnCost;
  @JsonKey(name: "phase")
  String? phase;
  @JsonKey(name: "sector")
  String? sector;


  VariationsRequest({
    this.keyword,
    this.sortColumn,
    this.colDir,
    this.pageNo,
    this.pageSize,
    this.isEnglishLanguage,
    this.fromDate,
    this.toDate,
    this.projectTypeId,
    this.projectPhaseId,
    this.impactOnCost,
    this.phase,
    this.sector,
  });

  VariationsRequest copyWith({
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
    String? impactOnCost,
    String? phase,
    String? sector,
  }) =>
      VariationsRequest(
        keyword: keyword ?? this.keyword,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        projectPhaseId: projectPhaseId ?? this.projectPhaseId,
        sortColumn: sortColumn ?? this.sortColumn,
        colDir: colDir ?? this.colDir,
        pageNo: pageNo ?? this.pageNo,
        sector: sector ?? this.sector,
        pageSize: pageSize ?? this.pageSize,
        isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
        impactOnCost: impactOnCost ?? this.impactOnCost,
        phase: phase ?? this.phase,
      );

  factory VariationsRequest.fromJson(Map<String, dynamic> json) =>
      _$VariationsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VariationsRequestToJson(this);
}
