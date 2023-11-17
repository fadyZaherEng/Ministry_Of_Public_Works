import 'package:json_annotation/json_annotation.dart';

part 'projects_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ProjectsRequest {
  @JsonKey(name: "keyword")
  String? keyword;
  @JsonKey(name: "fromDate")
  String? fromDate;
  @JsonKey(name: "toDate")
  String? toDate;
  @JsonKey(name: "sector")
  String? sectorId;
  @JsonKey(name: "projectPhaseId")
  String? projectPhaseId;
  @JsonKey(name: "sortColumn")
  String? sortColumn;
  @JsonKey(name: "colDir")
  String? colDir;
  @JsonKey(name: "pageNo")
  int? pageNo;
  @JsonKey(name: "pageSize")
  int? pageSize;
  @JsonKey(name: "isEnglishLanguage")
  bool? isEnglishLanguage;
  @JsonKey(name: "endUser")
  String? endUser;

  ProjectsRequest({
    this.keyword,
    this.fromDate,
    this.toDate,
    this.sectorId,
    this.projectPhaseId,
    this.sortColumn,
    this.colDir,
    this.pageNo,
    this.pageSize,
    this.isEnglishLanguage,
    this.endUser,
  });

  ProjectsRequest copyWith({
    String? keyword,
    String? fromDate,
    String? toDate,
    String? projectTypeId,
    String? projectPhaseId,
    String? sortColumn,
    String? colDir,
    String? endUser,
    int? pageNo,
    int? pageSize,
    bool? isEnglishLanguage,
  }) =>
      ProjectsRequest(
        keyword: keyword ?? this.keyword,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        sectorId: projectTypeId ?? this.sectorId,
        projectPhaseId: projectPhaseId ?? this.projectPhaseId,
        sortColumn: sortColumn ?? this.sortColumn,
        colDir: colDir ?? this.colDir,
        pageNo: pageNo ?? this.pageNo,
        pageSize: pageSize ?? this.pageSize,
        isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
        endUser: endUser ?? this.endUser,
      );

  factory ProjectsRequest.fromJson(Map<String, dynamic> json) =>
      _$ProjectsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsRequestToJson(this);
}
