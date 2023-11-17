part of 'issues_bloc.dart';

abstract class IssuesEvent extends Equatable {
  const IssuesEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetIssuesEvent extends IssuesEvent {
  final IssuesRequest request;

  const GetIssuesEvent({
    required this.request,
  });
}

class GetPhasesEvent extends IssuesEvent {
  const GetPhasesEvent();
}

class GetProjectTypesEvent extends IssuesEvent {
  const GetProjectTypesEvent();
}

class GetStatusEvent extends IssuesEvent {
  const GetStatusEvent();
}

class SearchIssuesEvent extends IssuesEvent {
  final String keyword;

  const SearchIssuesEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends IssuesEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends IssuesEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectProjectTypeEvent extends IssuesEvent {
  final ProjectType projectType;

  const SelectProjectTypeEvent({
    required this.projectType,
  });
}

class SelectStatusEvent extends IssuesEvent {
  final Status status;

  const SelectStatusEvent({
    required this.status,
  });
}

class SelectFromDateEvent extends IssuesEvent {
  final DateTime? fromDateTime;

  const SelectFromDateEvent({required this.fromDateTime});
}

class SelectToDateEvent extends IssuesEvent {
  final DateTime? toDateTime;

  const SelectToDateEvent({required this.toDateTime});
}

class GetIssueByIdEvent extends IssuesEvent {
  final String issueId;

  const GetIssueByIdEvent({
    required this.issueId,
  });
}

class NavigateBackEvent extends IssuesEvent {
  const NavigateBackEvent();
}
