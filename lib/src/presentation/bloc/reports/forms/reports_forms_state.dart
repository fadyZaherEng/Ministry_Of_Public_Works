part of 'reports_forms_bloc.dart';

abstract class ReportsFormsState extends Equatable {
  const ReportsFormsState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ReportsFormsInitial extends ReportsFormsState {
  @override
  List<Object> get props => [];
}

class ShowLoadingState extends ReportsFormsState {}

class HideLoadingState extends ReportsFormsState {}

class GetReportByIdSuccessState extends ReportsFormsState {
  final Report report;

  const GetReportByIdSuccessState({
    required this.report,
  });
}

class GetReportByIdFailState extends ReportsFormsState {
  final String errorMessage;

  const GetReportByIdFailState({
    required this.errorMessage,
  });
}
