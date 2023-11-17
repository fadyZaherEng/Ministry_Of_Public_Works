part of 'issues_bloc.dart';

abstract class IssuesState extends Equatable {
  const IssuesState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class IssuesInitial extends IssuesState {}

class ShowSkeletonState extends IssuesState {}

class ShowLoadingState extends IssuesState {}

class HideLoadingState extends IssuesState {}

class GetIssuesSuccessState extends IssuesState {
  final List<Issue> issues;

  const GetIssuesSuccessState({
    required this.issues,
  });
}

class GetIssuesFailState extends IssuesState {
  final String errorMessage;

  const GetIssuesFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends IssuesState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends IssuesState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetStatusSuccessState extends IssuesState {
  final List<Status> status;

  const GetStatusSuccessState({
    required this.status,
  });
}

class GetStatusFailState extends IssuesState {
  final String errorMessage;

  const GetStatusFailState({
    required this.errorMessage,
  });
}

class GetProjectTypesSuccessState extends IssuesState {
  final List<ProjectType> projectTypes;

  const GetProjectTypesSuccessState({
    required this.projectTypes,
  });
}

class GetProjectTypesFailState extends IssuesState {
  final String errorMessage;

  const GetProjectTypesFailState({
    required this.errorMessage,
  });
}

class SearchIssuesState extends IssuesState {
  final String keyword;

  const SearchIssuesState({
    required this.keyword,
  });
}

class SelectSortState extends IssuesState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends IssuesState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectProjectTypeState extends IssuesState {
  final ProjectType projectType;

  const SelectProjectTypeState({
    required this.projectType,
  });
}

class SelectStatusState extends IssuesState {
  final Status status;

  const SelectStatusState({
    required this.status,
  });
}

class SelectFromDateState extends IssuesState {
  final DateTime? fromDate;

  const SelectFromDateState({
    required this.fromDate,
  });
}

class SelectToDateState extends IssuesState {
  final DateTime? toDate;

  const SelectToDateState({
    required this.toDate,
  });
}


class GetIssueByIdSuccessState extends IssuesState {
  final Issue issue;

  const GetIssueByIdSuccessState({
    required this.issue,
  });
}

class GetIssueByIdFailState extends IssuesState {
  final String errorMessage;

  const GetIssueByIdFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends IssuesState {
  const NavigateBackState();
}
