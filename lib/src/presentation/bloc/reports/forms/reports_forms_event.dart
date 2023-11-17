part of 'reports_forms_bloc.dart';

abstract class ReportsFormsEvent extends Equatable {
  const ReportsFormsEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetReportByIdEvent extends ReportsFormsEvent {
  final String id;

  const GetReportByIdEvent({
    required this.id,
  });
}
