import 'dart:async';

import 'package:aim/src/domain/usecases/get_permission_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'more_event.dart';

part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  final GetLocalPermissionUserCase _getLocalPermissionUserCase;

  MoreBloc(
    this._getLocalPermissionUserCase,
  ) : super(MoreInitial()) {
    on<GetUserPermissionEvent>(_onGetUserPermissionEvent);
  }

  FutureOr<void> _onGetUserPermissionEvent(
      GetUserPermissionEvent event, Emitter<MoreState> emit) async {
    String permission = await _getLocalPermissionUserCase();
    emit(GetUserPermissionState(permission: permission));
  }
}
