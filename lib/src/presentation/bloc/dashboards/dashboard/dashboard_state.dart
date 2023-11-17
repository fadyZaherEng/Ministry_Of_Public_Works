part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];

}

class DashboardInitial extends DashboardState {}

class GetUserPermissionState extends DashboardState {
  final String permission;

  const GetUserPermissionState({
    required this.permission,
  });
}