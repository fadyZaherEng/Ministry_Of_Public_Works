import 'dart:async';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/home/home.dart';
import 'package:aim/src/domain/entities/home/permission.dart';
import 'package:aim/src/domain/entities/home/user.dart';
import 'package:aim/src/domain/usecases/get_home_counts_use_case.dart';
import 'package:aim/src/domain/usecases/get_home_user_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_user_permission_use_case.dart';
import 'package:aim/src/domain/usecases/set_permission_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeCountsUseCase _getHomeCountsUseCase;
  final GetHomeUserUseCase _getHomeUserUseCase;
  final GetUserPermissionUseCase _getUserPermissionUseCase;
  final SetPermissionUseCase _setPermissionUseCase;

  HomeBloc(
    this._getHomeCountsUseCase,
    this._getHomeUserUseCase,
    this._getUserPermissionUseCase,
    this._setPermissionUseCase,
  ) : super(HomeInitial()) {
    on<GetHomeCountsEvent>(_onGetHomeCountsEvent);
    on<GetHomeUserEvent>(_onGetHomeUserEvent);
    on<GetUserPermissionEvent>(_onGetUserPermissionUseCase);
  }

  FutureOr<void> _onGetHomeCountsEvent(
      GetHomeCountsEvent event, Emitter<HomeState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getHomeCountsUseCase();
    if (dataState is DataSuccess) {
      emit(GetHomeCountsSuccessState(home: dataState.data ?? Home()));
    } else {
      emit(
          GetHomeCountsFailState(errorMessage: dataState.error?.message ?? ""));
    }

    emit(HideLoadingState());
  }

  FutureOr<void> _onGetHomeUserEvent(
      GetHomeUserEvent event, Emitter<HomeState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getHomeUserUseCase();
    if (dataState is DataSuccess) {
      emit(GetHomeUserSuccessState(user: dataState.data ?? User()));
    } else {
      emit(GetHomeUserFailState(errorMessage: dataState.error?.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetUserPermissionUseCase(
      GetUserPermissionEvent event, Emitter<HomeState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getUserPermissionUseCase(true);
    if (dataState is DataSuccess) {
      _setPermissionUseCase(dataState.data?.name ?? "");
      emit(GetUserPermissionSuccessState(
          userPermission: dataState.data ?? UserPermission()));
    } else {
      emit(GetUserPermissionFailState(
          errorMessage: dataState.error?.message ?? ""));
    }
    emit(HideLoadingState());
  }
}
