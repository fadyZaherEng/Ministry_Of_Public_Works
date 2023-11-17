import 'package:json_annotation/json_annotation.dart';

part 'milestones_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MilestonesRequest {
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
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "isEnglishLanguage")
  bool? isEnglishLanguage;
  @JsonKey(name: "projectPhaseId")
  String? projectPhaseId;
  @JsonKey(name: "sector")
  String? sector;

  MilestonesRequest({
    this.keyword,
    this.sortColumn,
    this.colDir,
    this.pageNo,
    this.pageSize,
    this.status,
    this.isEnglishLanguage,
    this.fromDate,
    this.toDate,
    this.sector,
    this.projectPhaseId,
  });

  MilestonesRequest copyWith({
    String? keyword,
    String? fromDate,
    String? toDate,
    String? sector,
    String? projectPhaseId,
    String? sortColumn,
    String? colDir,
    int? pageNo,
    int? pageSize,
    int? status,
    bool? isEnglishLanguage,
  }) =>
      MilestonesRequest(
        keyword: keyword ?? this.keyword,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        projectPhaseId: projectPhaseId ?? this.projectPhaseId,
        sortColumn: sortColumn ?? this.sortColumn,
        colDir: colDir ?? this.colDir,
        pageNo: pageNo ?? this.pageNo,
        pageSize: pageSize ?? this.pageSize,
        status: status ?? this.status,
        sector: sector ?? this.sector,
        isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
      );

  factory MilestonesRequest.fromJson(Map<String, dynamic> json) =>
      _$MilestonesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MilestonesRequestToJson(this);
}
