import 'package:json_annotation/json_annotation.dart';

part 'design_list_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DesignListRequest {
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
  @JsonKey(name: "toDate")
  String? toDate;
  @JsonKey(name: "fromDate")
  String? fromDate;
  @JsonKey(name: "isEnglishLanguage")
  bool? isEnglishLanguage;

  DesignListRequest({
    this.keyword,
    this.sortColumn,
    this.colDir,
    this.pageNo,
    this.pageSize,
    this.isEnglishLanguage,
    this.phase,
    this.sector,
    this.fromDate,
    this.toDate,
  });

  DesignListRequest copyWith({
    String? keyword,
    String? fromDate,
    String? toDate,
    String? sortColumn,
    String? colDir,
    String? phase,
    String? sector,
    int? pageNo,
    int? pageSize,
    bool? isEnglishLanguage,
  }) =>
      DesignListRequest(
        keyword: keyword ?? this.keyword,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        sortColumn: sortColumn ?? this.sortColumn,
        colDir: colDir ?? this.colDir,
        phase: phase ?? this.phase,
        sector: sector ?? this.sector,
        pageNo: pageNo ?? this.pageNo,
        pageSize: pageSize ?? this.pageSize,
        isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
      );

  factory DesignListRequest.fromJson(Map<String, dynamic> json) =>
      _$DesignListRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DesignListRequestToJson(this);
}
