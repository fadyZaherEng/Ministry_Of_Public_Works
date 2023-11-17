part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}


class GetUserPermissionEvent extends DashboardEvent {
  const GetUserPermissionEvent();
}