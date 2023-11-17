import 'package:json_annotation/json_annotation.dart';

part 'payments_request.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaymentsRequest {
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
  @JsonKey(name: "sector")
  String? sector;
  @JsonKey(name: "projectId")
  String? projectId;
  @JsonKey(name: "status")
  String? status;

  PaymentsRequest(
      {this.keyword,
      this.sortColumn,
      this.colDir,
      this.pageNo,
      this.pageSize,
      this.isEnglishLanguage,
      this.fromDate,
      this.toDate,
      this.sector,
      this.projectPhaseId,
      this.status,
      this.projectId});

  PaymentsRequest copyWith({
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
    String? status,
  }) =>
      PaymentsRequest(
          keyword: keyword ?? this.keyword,
          fromDate: fromDate ?? this.fromDate,
          toDate: toDate ?? this.toDate,
          projectPhaseId: projectPhaseId ?? this.projectPhaseId,
          sortColumn: sortColumn ?? this.sortColumn,
          sector: sector ?? this.sector,
          colDir: colDir ?? this.colDir,
          pageNo: pageNo ?? this.pageNo,
          pageSize: pageSize ?? this.pageSize,
          isEnglishLanguage: isEnglishLanguage ?? this.isEnglishLanguage,
          projectId: projectId ?? this.projectId,
          status: status ?? this.status);


  factory PaymentsRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentsRequestToJson(this);
}
