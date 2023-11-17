part of 'warranties_bloc.dart';

abstract class WarrantiesState extends Equatable {
  const WarrantiesState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class WarrantiesInitial extends WarrantiesState {}

class ShowSkeletonState extends WarrantiesState {}

class ShowLoadingState extends WarrantiesState {}

class HideLoadingState extends WarrantiesState {}

class GetWarrantiesSuccessState extends WarrantiesState {
  final List<Warranty> warranties;

  const GetWarrantiesSuccessState({
    required this.warranties,
  });
}

class GetWarrantiesFailState extends WarrantiesState {
  final String errorMessage;

  const GetWarrantiesFailState({
    required this.errorMessage,
  });
}

class GetWarrantyTypesSuccessState extends WarrantiesState {
  final List<WarrantyType> warrantyTypes;

  const GetWarrantyTypesSuccessState({
    required this.warrantyTypes,
  });
}

class GetWarrantyTypesFailState extends WarrantiesState {
  final String errorMessage;

  const GetWarrantyTypesFailState({
    required this.errorMessage,
  });
}

class SearchWarrantiesState extends WarrantiesState {
  final String keyword;

  const SearchWarrantiesState({
    required this.keyword,
  });
}

class SelectSortState extends WarrantiesState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectWarrantyTypeState extends WarrantiesState {
  final WarrantyType warrantyType;

  const SelectWarrantyTypeState({
    required this.warrantyType,
  });
}

class SelectFromDateState extends WarrantiesState {
  final DateTime? fromDate;

  const SelectFromDateState({
    required this.fromDate,
  });
}

class SelectToDateState extends WarrantiesState {
  final DateTime? toDate;

  const SelectToDateState({
    required this.toDate,
  });
}

class GetWarrantyByIdSuccessState extends WarrantiesState {
  final Warranty warranty;

  const GetWarrantyByIdSuccessState({
    required this.warranty,
  });
}

class GetWarrantyByIdFailState extends WarrantiesState {
  final String errorMessage;

  const GetWarrantyByIdFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends WarrantiesState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends WarrantiesState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class SelectPhaseState extends WarrantiesState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class NavigateBackState extends WarrantiesState {
  const NavigateBackState();
}