part of 'more_bloc.dart';

abstract class MoreState extends Equatable {
  const MoreState();

  @override
  List<Object?> get props => [identityHashCode(this)];

}

class MoreInitial extends MoreState {}

class GetUserPermissionState extends MoreState {
  final String permission;

  const GetUserPermissionState({
    required this.permission,
  });
}