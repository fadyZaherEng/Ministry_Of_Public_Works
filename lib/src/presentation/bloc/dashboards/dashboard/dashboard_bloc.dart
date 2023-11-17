import 'dart:async';

import 'package:aim/src/domain/usecases/get_permission_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetLocalPermissionUserCase _getLocalPermissionUserCase;

  DashboardBloc(
    this._getLocalPermissionUserCase,
  ) : super(DashboardInitial()) {
    on<GetUserPermissionEvent>(_onGetUserPermissionEvent);
  }

  FutureOr<void> _onGetUserPermissionEvent(
      GetUserPermissionEvent event, Emitter<DashboardState> emit) async {
    String permission = await _getLocalPermissionUserCase();
    emit(GetUserPermissionState(permission: permission));
  }
}
