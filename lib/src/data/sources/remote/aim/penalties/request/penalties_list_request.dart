import 'package:json_annotation/json_annotation.dart';

part 'penalties_list_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PenaltiesListRequest {
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
  @JsonKey(name: "color")
  int? color;

  @JsonKey(name: "sector")
  String? sector;
  @JsonKey(name: "phase")
  String? phase;
  @JsonKey(name: "toDate")
  String? toDate;
  @JsonKey(name: "fromDate")
  String? fromDate;
  @JsonKey(name: "isEnglishLanguage")
  bool? isEnglishLanguage;

  PenaltiesListRequest({
    this.keyword,
    this.sortColumn,
    this.color,
    this.colDir,
    this.pageNo,
    this.pageSize,
    this.isEnglishLanguage,
    this.phase,
    this.sector,
    this.fromDate,
    this.toDate,
  });

  PenaltiesListRequest copyWith({
    String? keyword,
    String? fromDate,
    String? toDate,
    String? sortColumn,
    String? colDir,
    String? phase,
    String? sector,
    int? pageNo,
    int? pageSize,
    int? color,
    bool? isEnglishLanguage,
  }) =>
      PenaltiesListRequest(
        keyword: keyword ?? this.keyword,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        sortColumn: sortColumn ?? this.sortColumn,
        colDir: colDir ?? this.colDir,
        phase: phase ?? this.phase,
        sector: sector ?? this.sector,
        pageNo: pageNo ?? this.pageNo,
        pageSize: pageSize ?? this.pageSize,
        color: color ?? this.color,
        isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
      );

  factory PenaltiesListRequest.fromJson(Map<String, dynamic> json) =>
      _$PenaltiesListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PenaltiesListRequestToJson(this);
}
