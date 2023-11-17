import 'package:equatable/equatable.dart';

class Home extends Equatable {
  final int? numberofExecutionPhaseProjectsCount;
  final int? numberofConsultancyServicePhaseProjectsCount;
  final int? numberofTenderingPhaseProjectsCount;
  final int? numberofprojectMonthlyReportsCount;
  final int? numberofprojectMonthlyReportsSubmittedCount;
  final int? numberofprojectMonthlyReportsUnsubmittedCount;

  const Home({
    this.numberofExecutionPhaseProjectsCount = 0,
    this.numberofConsultancyServicePhaseProjectsCount = 0,
    this.numberofTenderingPhaseProjectsCount = 0,
    this.numberofprojectMonthlyReportsCount = 0,
    this.numberofprojectMonthlyReportsSubmittedCount = 0,
    this.numberofprojectMonthlyReportsUnsubmittedCount = 0,
  });

  @override
  List<Object?> get props => [
        numberofExecutionPhaseProjectsCount,
        numberofConsultancyServicePhaseProjectsCount,
        numberofTenderingPhaseProjectsCount,
        numberofprojectMonthlyReportsCount,
        numberofprojectMonthlyReportsSubmittedCount,
        numberofprojectMonthlyReportsUnsubmittedCount,
      ];
}
