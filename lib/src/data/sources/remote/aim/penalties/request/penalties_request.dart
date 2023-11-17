import 'package:json_annotation/json_annotation.dart';

part 'penalties_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PenaltiesRequest {
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
  @JsonKey(name: "penaltyType")
  String? penaltyType;
  @JsonKey(name: "phase")
  String? phase;
  @JsonKey(name: "sector")
  String? sector;

  PenaltiesRequest({
    this.keyword,
    this.sortColumn,
    this.colDir,
    this.pageNo,
    this.pageSize,
    this.isEnglishLanguage,
    this.fromDate,
    this.toDate,
    this.penaltyType,
    this.phase,
    this.sector,
  });

  PenaltiesRequest copyWith({
    String? keyword,
    String? fromDate,
    String? toDate,
    String? sector,
    String? sortColumn,
    String? colDir,
    int? pageNo,
    int? pageSize,
    bool? isEnglishLanguage,
    String? penaltyType,
    String? phase,
  }) =>
      PenaltiesRequest(
        keyword: keyword ?? this.keyword,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        sortColumn: sortColumn ?? this.sortColumn,
        colDir: colDir ?? this.colDir,
        pageNo: pageNo ?? this.pageNo,
        pageSize: pageSize ?? this.pageSize,
        isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
        penaltyType: penaltyType ?? this.penaltyType,
        phase: phase ?? this.phase,
        sector: sector ?? this.sector,
      );

  factory PenaltiesRequest.fromJson(Map<String, dynamic> json) =>
      _$PenaltiesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PenaltiesRequestToJson(this);
}
