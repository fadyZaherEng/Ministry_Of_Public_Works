part of 'contract_dashboard_bloc.dart';

abstract class ContractDashboardEvent extends Equatable {
  const ContractDashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetContractsEvent extends ContractDashboardEvent {
  final ContractListRequest request;

  const GetContractsEvent({
    required this.request,
  });
}

class GetPhasesEvent extends ContractDashboardEvent {
  const GetPhasesEvent();
}

class GetSectorsEvent extends ContractDashboardEvent {
  const GetSectorsEvent();
}

class SearchContractEvent extends ContractDashboardEvent {
  final String keyword;

  const SearchContractEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends ContractDashboardEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends ContractDashboardEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectSectorEvent extends ContractDashboardEvent {
  final ProjectType sector;

  const SelectSectorEvent({
    required this.sector,
  });
}

class GetApprovedAnalysisEvent extends ContractDashboardEvent {
  final String sectorId;

  const GetApprovedAnalysisEvent({
    required this.sectorId,
  });
}


class GetDelayAnalysisEvent extends ContractDashboardEvent {
  const GetDelayAnalysisEvent();
}

class GetOperationAnalysisEvent extends ContractDashboardEvent {
  const GetOperationAnalysisEvent();
}

class NavigateBackEvent extends ContractDashboardEvent {
  const NavigateBackEvent();
}
