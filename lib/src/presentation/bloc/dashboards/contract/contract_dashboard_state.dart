part of 'contract_dashboard_bloc.dart';

abstract class ContractDashboardState extends Equatable {
  const ContractDashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ContractDashboardInitial extends ContractDashboardState {}

class ShowLoadingState extends ContractDashboardState {}

class HideLoadingState extends ContractDashboardState {}

class GetContractSuccessState extends ContractDashboardState {
  final List<Contract> contracts;

  const GetContractSuccessState({
    required this.contracts,
  });
}

class GetContractFailState extends ContractDashboardState {
  final String errorMessage;

  const GetContractFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends ContractDashboardState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends ContractDashboardState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetSectorsSuccessState extends ContractDashboardState {
  final List<ProjectType> sectors;

  const GetSectorsSuccessState({
    required this.sectors,
  });
}

class GetSectorsFailState extends ContractDashboardState {
  final String errorMessage;

  const GetSectorsFailState({
    required this.errorMessage,
  });
}

class SearchContractState extends ContractDashboardState {
  final String keyword;

  const SearchContractState({
    required this.keyword,
  });
}

class SelectSortState extends ContractDashboardState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends ContractDashboardState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectSectorState extends ContractDashboardState {
  final ProjectType sector;

  const SelectSectorState({
    required this.sector,
  });
}

class GetApprovedAnalysisSuccessState extends ContractDashboardState {
  final ApprovedAnalysis approvedAnalysis;

  const GetApprovedAnalysisSuccessState({
    required this.approvedAnalysis,
  });
}

class GetApprovedAnalysisFailState extends ContractDashboardState {
  final String errorMessage;

  const GetApprovedAnalysisFailState({
    required this.errorMessage,
  });
}

class GetDelayAnalysisSuccessState extends ContractDashboardState {
  final DelayAnalysis delayAnalysis;

  const GetDelayAnalysisSuccessState({
    required this.delayAnalysis,
  });
}

class GetDelayAnalysisFailState extends ContractDashboardState {
  final String errorMessage;

  const GetDelayAnalysisFailState({
    required this.errorMessage,
  });
}


class GetOperationAnalysisSuccessState extends ContractDashboardState {
  final OperationAnalysis operationAnalysis;

  const GetOperationAnalysisSuccessState({
    required this.operationAnalysis,
  });
}

class GetOperationAnalysisFailState extends ContractDashboardState {
  final String errorMessage;

  const GetOperationAnalysisFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends ContractDashboardState {
  const NavigateBackState();
}
