part of 'reports_bloc.dart';

abstract class ReportsState extends Equatable {
  const ReportsState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ReportsInitial extends ReportsState {}

class ShowSkeletonState extends ReportsState {}

class ShowLoadingState extends ReportsState {}

class HideLoadingState extends ReportsState {}

class GetReportsSuccessState extends ReportsState {
  final List<Report> reports;

  const GetReportsSuccessState({
    required this.reports,
  });
}

class GetReportsFailState extends ReportsState {
  final String errorMessage;

  const GetReportsFailState({
    required this.errorMessage,
  });
}

class GetProjectTypesSuccessState extends ReportsState {
  final List<ProjectType> projectTypes;

  const GetProjectTypesSuccessState({
    required this.projectTypes,
  });
}

class GetProjectTypesFailState extends ReportsState {
  final String errorMessage;

  const GetProjectTypesFailState({
    required this.errorMessage,
  });
}

class SearchReportsState extends ReportsState {
  final String keyword;

  const SearchReportsState({
    required this.keyword,
  });
}

class SelectSortState extends ReportsState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class GetPhasesSuccessState extends ReportsState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends ReportsState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetMonthsSuccessState extends ReportsState {
  final List<Month> months;

  const GetMonthsSuccessState({
    required this.months,
  });
}

class GetMonthsFailState extends ReportsState {
  final String errorMessage;

  const GetMonthsFailState({
    required this.errorMessage,
  });
}

class GetYearsSuccessState extends ReportsState {
  final List<Year> years;

  const GetYearsSuccessState({
    required this.years,
  });
}

class GetYearsFailState extends ReportsState {
  final String errorMessage;

  const GetYearsFailState({
    required this.errorMessage,
  });
}

class SelectPhaseState extends ReportsState {
  final Phase phase;

  const SelectPhaseState({required this.phase});
}

class SelectProjectTypeState extends ReportsState {
  final ProjectType projectType;

  const SelectProjectTypeState({required this.projectType});
}

class SelectMonthState extends ReportsState {
  final Month month;

  const SelectMonthState({required this.month});
}

class SelectYearState extends ReportsState {
  final Year year;

  const SelectYearState({required this.year});
}

class GetReportPDSuccessState extends ReportsState {
  final String pdfUrl;

  const GetReportPDSuccessState({required this.pdfUrl});
}

class GetReportPDFailState extends ReportsState {
  final String errorMessage;

  const GetReportPDFailState({required this.errorMessage});
}

class NavigateBackState extends ReportsState {
  const NavigateBackState();
}

class GetPrintUrlSuccessState extends ReportsState {
  final String url;

  const GetPrintUrlSuccessState({
    required this.url,
  });
}

class GetPrintUrlFailState extends ReportsState {
  final String errorMessage;

  const GetPrintUrlFailState({
    required this.errorMessage,
  });
}

class OpenPdfWebViewState extends ReportsState {
  final String pdfUrl;
  final String reportId;

  const OpenPdfWebViewState({
    required this.pdfUrl,
    required this.reportId,
  });
}
