part of 'milestones_bloc.dart';

abstract class MilestonesEvent extends Equatable {
  const MilestonesEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetMilestonesEvent extends MilestonesEvent {
  final MilestonesRequest request;

  const GetMilestonesEvent({
    required this.request,
  });
}

class GetPhasesEvent extends MilestonesEvent {
  const GetPhasesEvent();
}

class GetStatusEvent extends MilestonesEvent {
  const GetStatusEvent();
}

class GetProjectTypesEvent extends MilestonesEvent {
  const GetProjectTypesEvent();
}

class SearchMilestonesEvent extends MilestonesEvent {
  final String keyword;

  const SearchMilestonesEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends MilestonesEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends MilestonesEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectProjectTypeEvent extends MilestonesEvent {
  final ProjectType projectType;

  const SelectProjectTypeEvent({
    required this.projectType,
  });
}

class SelectStatusEvent extends MilestonesEvent {
  final Status status;

  const SelectStatusEvent({
    required this.status,
  });
}

class SelectFromDateEvent extends MilestonesEvent {
  final DateTime? fromDateTime;

  const SelectFromDateEvent({required this.fromDateTime});
}

class SelectToDateEvent extends MilestonesEvent {
  final DateTime? toDateTime;

  const SelectToDateEvent({required this.toDateTime});
}

class GetMilestoneByIdEvent extends MilestonesEvent {
  final String milestoneId;

  const GetMilestoneByIdEvent({
    required this.milestoneId,
  });
}


class NavigateBackEvent extends MilestonesEvent {
  const NavigateBackEvent();
}
