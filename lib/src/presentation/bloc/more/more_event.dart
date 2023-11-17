part of 'more_bloc.dart';

abstract class MoreEvent extends Equatable {
  const MoreEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetUserPermissionEvent extends MoreEvent {
  const GetUserPermissionEvent();
}
