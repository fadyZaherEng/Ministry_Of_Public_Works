import 'package:aim/src/domain/entities/home/home.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_home.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteHome extends Home {
  @JsonKey(name: 'numberofExecutionPhaseProjectsCount')
  final int? numberofExecutionPhaseProjectsCount;
  @JsonKey(name: 'numberofConsultancyServicePhaseProjectsCount')
  final int? numberofConsultancyServicePhaseProjectsCount;
  @JsonKey(name: 'numberofTenderingPhaseProjectsCount')
  final int? numberofTenderingPhaseProjectsCount;
  @JsonKey(name: 'numberofprojectMonthlyReportsCount')
  final int? numberofprojectMonthlyReportsCount;
  @JsonKey(name: 'numberofprojectMonthlyReportsSubmittedCount')
  final int? numberofprojectMonthlyReportsSubmittedCount;
  @JsonKey(name: 'numberofprojectMonthlyReportsUnsubmittedCount')
  final int? numberofprojectMonthlyReportsUnsubmittedCount;

  const RemoteHome(
      this.numberofExecutionPhaseProjectsCount,
      this.numberofConsultancyServicePhaseProjectsCount,
      this.numberofTenderingPhaseProjectsCount,
      this.numberofprojectMonthlyReportsCount,
      this.numberofprojectMonthlyReportsSubmittedCount,
      this.numberofprojectMonthlyReportsUnsubmittedCount)
      : super(
          numberofExecutionPhaseProjectsCount:
              numberofExecutionPhaseProjectsCount ?? 0,
          numberofConsultancyServicePhaseProjectsCount:
              numberofConsultancyServicePhaseProjectsCount ?? 0,
    numberofTenderingPhaseProjectsCount: numberofTenderingPhaseProjectsCount ?? 0,
    numberofprojectMonthlyReportsCount: numberofprojectMonthlyReportsCount ?? 0,
    numberofprojectMonthlyReportsSubmittedCount: numberofprojectMonthlyReportsSubmittedCount ?? 0,
    numberofprojectMonthlyReportsUnsubmittedCount: numberofprojectMonthlyReportsUnsubmittedCount ?? 0,
        );

  factory RemoteHome.fromJson(Map<String, dynamic> json) =>
      _$RemoteHomeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteHomeToJson(this);
}
