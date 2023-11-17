part of 'warranties_bloc.dart';

abstract class WarrantiesEvent extends Equatable {
  const WarrantiesEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetWarrantiesEvent extends WarrantiesEvent {
  final WarrantiesRequest request;

  const GetWarrantiesEvent({
    required this.request,
  });
}

class GetWarrantyTypeEvent extends WarrantiesEvent {
  const GetWarrantyTypeEvent();
}

class SearchWarrantiesEvent extends WarrantiesEvent {
  final String keyword;

  const SearchWarrantiesEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends WarrantiesEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectWarrantyTypeEvent extends WarrantiesEvent {
  final WarrantyType warrantyType;

  const SelectWarrantyTypeEvent({
    required this.warrantyType,
  });
}

class SelectFromDateEvent extends WarrantiesEvent {
  final DateTime? fromDateTime;

  const SelectFromDateEvent({required this.fromDateTime});
}

class SelectToDateEvent extends WarrantiesEvent {
  final DateTime? toDateTime;

  const SelectToDateEvent({required this.toDateTime});
}

class GetWarrantyByIdEvent extends WarrantiesEvent {
  final String warrantyId;

  const GetWarrantyByIdEvent({
    required this.warrantyId,
  });
}

class GetPhasesEvent extends WarrantiesEvent {
  const GetPhasesEvent();
}

class SelectPhaseEvent extends WarrantiesEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class NavigateBackEvent extends WarrantiesEvent {
  const NavigateBackEvent();
}
