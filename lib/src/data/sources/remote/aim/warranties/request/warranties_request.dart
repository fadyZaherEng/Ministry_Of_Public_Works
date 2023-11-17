import 'package:json_annotation/json_annotation.dart';

part 'warranties_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class WarrantiesRequest {
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
  @JsonKey(name: "warrantyType")
  String? warrantyType;
  @JsonKey(name: "phase")
  String? phase;

  WarrantiesRequest({
    this.keyword,
    this.sortColumn,
    this.colDir,
    this.pageNo,
    this.pageSize,
    this.isEnglishLanguage,
    this.warrantyType,
    this.fromDate,
    this.toDate,
    this.phase,
  });

  WarrantiesRequest copyWith({
    String? keyword,
    String? fromDate,
    String? toDate,
    String? sortColumn,
    String? colDir,
    int? pageNo,
    int? pageSize,
    bool? isEnglishLanguage,
    String? warrantyType,
    String? phase,
  }) =>
      WarrantiesRequest(
        keyword: keyword ?? this.keyword,
        fromDate: fromDate ?? this.fromDate,
        toDate: toDate ?? this.toDate,
        sortColumn: sortColumn ?? this.sortColumn,
        colDir: colDir ?? this.colDir,
        warrantyType: warrantyType ?? this.warrantyType,
        pageNo: pageNo ?? this.pageNo,
        pageSize: pageSize ?? this.pageSize,
        isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
        phase: phase ?? this.phase,
      );

  factory WarrantiesRequest.fromJson(Map<String, dynamic> json) =>
      _$WarrantiesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WarrantiesRequestToJson(this);
}
