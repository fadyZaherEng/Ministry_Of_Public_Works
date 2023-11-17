part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class HomeInitial extends HomeState {}

class ShowLoadingState extends HomeState {}

class HideLoadingState extends HomeState {}

class GetHomeCountsSuccessState extends HomeState {
  final Home home;

  const GetHomeCountsSuccessState({
    required this.home,
  });
}

class GetHomeCountsFailState extends HomeState {
  final String errorMessage;

  const GetHomeCountsFailState({
    required this.errorMessage,
  });
}

class GetHomeUserSuccessState extends HomeState {
  final User user;

  const GetHomeUserSuccessState({
    required this.user,
  });
}

class GetHomeUserFailState extends HomeState {
  final String errorMessage;

  const GetHomeUserFailState({
    required this.errorMessage,
  });
}

class GetUserPermissionSuccessState extends HomeState {
  final UserPermission userPermission;

  const GetUserPermissionSuccessState({
    required this.userPermission,
  });
}

class GetUserPermissionFailState extends HomeState {
  final String errorMessage;

  const GetUserPermissionFailState({
    required this.errorMessage,
  });
}
