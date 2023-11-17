part of 'reports_bloc.dart';

abstract class ReportsEvent extends Equatable {
  const ReportsEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetReportsEvent extends ReportsEvent {
  final ReportsRequest request;

  const GetReportsEvent({
    required this.request,
  });
}

class SearchReportsEvent extends ReportsEvent {
  final String keyword;

  const SearchReportsEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends ReportsEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class GetPhasesEvent extends ReportsEvent {
  const GetPhasesEvent();
}

class GetProjectTypesEvent extends ReportsEvent {
  const GetProjectTypesEvent();
}

class GetMonthsEvent extends ReportsEvent {
  const GetMonthsEvent();
}

class GetYearsEvent extends ReportsEvent {
  const GetYearsEvent();
}

class SelectPhaseEvent extends ReportsEvent {
  final Phase phase;

  const SelectPhaseEvent({required this.phase});
}

class SelectProjectTypeEvent extends ReportsEvent {
  final ProjectType projectType;

  const SelectProjectTypeEvent({required this.projectType});
}

class SelectMonthEvent extends ReportsEvent {
  final Month month;

  const SelectMonthEvent({required this.month});
}

class SelectYearEvent extends ReportsEvent {
  final Year year;

  const SelectYearEvent({required this.year});
}

class GetReportPDFEvent extends ReportsEvent {
  final String reportId;

  const GetReportPDFEvent({
    required this.reportId,
  });
}

class NavigateBackEvent extends ReportsEvent {
  const NavigateBackEvent();
}

class GetPrintUrlEvent extends ReportsEvent {}

class OpenPdfWebViewEvent extends ReportsEvent {
  final String reportId;
  final String reportUrl;

  const OpenPdfWebViewEvent({
    required this.reportId,
    required this.reportUrl,
  });
}

class ChangeDeviceOrientationEvent extends ReportsEvent {
  final List<DeviceOrientation> deviceOrientationList;

  const ChangeDeviceOrientationEvent({required this.deviceOrientationList});
}
