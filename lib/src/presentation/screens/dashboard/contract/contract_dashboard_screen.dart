import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/contract/request/contract_list_request.dart';
import 'package:aim/src/domain/entities/contract/approved_analysis.dart';
import 'package:aim/src/domain/entities/contract/contract.dart';
import 'package:aim/src/domain/entities/contract/delay_analysis.dart';
import 'package:aim/src/domain/entities/contract/operation_analysis.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/presentation/bloc/dashboards/contract/contract_dashboard_bloc.dart';
import 'package:aim/src/presentation/screens/dashboard/contract/widget/contract_list_card_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/contract/widget/contracts_dashboard_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/open_dashboard_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContractDashboardScreen extends BaseStatefulWidget {
  const ContractDashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<ContractDashboardScreen> baseCreateState() =>
      _ContractDashboardScreenState();
}

class _ContractDashboardScreenState extends BaseState<ContractDashboardScreen> {
  ContractDashboardBloc get _contractDashboardBloc =>
      BlocProvider.of<ContractDashboardBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isFilterSelected = true;
  ContractListRequest _contractRequest = ContractListRequest();
  Sort _selectedSort = sorts.first;
  List<Contract> _contracts = [];
  Phase _selectedPhase = const Phase();
  ProjectType _selectedSector = const ProjectType();
  bool isPaginationLoad = false;
  bool _isDashboard = true;
  ApprovedAnalysis? _approvedAnalysis;
  DelayAnalysis? _delayAnalysis;
  OperationAnalysis? _operationAnalysis;

  @override
  void initState() {
    super.initState();
    _selectedSort = _contractDashboardBloc.selectedSort;
    _selectedPhase = _contractDashboardBloc.selectedPhase;
    _selectedSector = _contractDashboardBloc.selectedSector;
    _contractRequest = ContractListRequest(
      keyword: "",
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      sector: (_selectedSector.id ?? ""),
      phase: (_selectedPhase.id ?? 0) == 0 ? "" : _selectedPhase.id.toString(),
      pageSize: pageSize,
      isEnglishLanguage: false,
    );

    if (_isDashboard) {
      _initDashboard();
    } else {
      init();
    }

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          isPaginationLoad == false) {
        isPaginationLoad = true;
        _contractRequest =
            _contractRequest.copyWith(pageNo: _contractRequest.pageNo! + 1);
        _getContracts(request: _contractRequest);
      }
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ContractDashboardBloc, ContractDashboardState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetContractSuccessState) {
          isPaginationLoad = false;
          _contracts = state.contracts;
        } else if (state is GetContractFailState) {
        } else if (state is GetPhasesSuccessState) {
          _getSectors();
        } else if (state is GetPhasesFailState) {
        } else if (state is GetSectorsSuccessState) {
          _openFilterBottomSheet();
        } else if (state is GetSectorsFailState) {
        } else if (state is SelectPhaseState) {
          _selectedPhase = state.phase;
        } else if (state is SelectSortState) {
          _selectSort(state.sort);
        } else if (state is SelectSectorState) {
          _selectedSector = state.sector;
        } else if (state is SearchContractState) {
          _searchContracts(state.keyword);
        } else if (state is GetApprovedAnalysisSuccessState) {
          _approvedAnalysis = state.approvedAnalysis;
        } else if (state is GetApprovedAnalysisFailState) {
        } else if (state is GetDelayAnalysisSuccessState) {
          _delayAnalysis = state.delayAnalysis;
        } else if (state is GetDelayAnalysisFailState) {
        } else if (state is GetOperationAnalysisSuccessState) {
          _operationAnalysis = state.operationAnalysis;
        } else if (state is GetOperationAnalysisFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getContractWithFilterOptions();
        }
      },
      builder: (context, state) {
        return SharedDashboardScreen(
          title: S.of(context).completionInTheExecutionContracts,
          searchLabel: "Seacrch",
          searchTextEditingController: _searchTextEditingController,
          isFilterSelected: _isFilterSelected,
          onChange: _searchEvent,
          onSubmit: _searchEvent,
          clearActionButton: _clearSearch,
          onFilterTab: _onFilterTab,
          onSortTab: _onSortTab,
          isHaveBackButton: true,
          isDashboard: _isDashboard,
          isHaveSearch: false,
          onDashboardTap: () {
            setState(() {
              _isDashboard = true;
              _initDashboard();
            });
          },
          onListTab: () {
            setState(() {
              _isDashboard = false;
              init();
            });
          },
          dashboard: _buildDashboard(),
          content: _buildScreenContent(),
        );
      },
    );
  }

  Widget _buildDashboard() {
    return _approvedAnalysis != null && _delayAnalysis !=null && _operationAnalysis != null
        ? ContractsDashboardWidget(
            approvedAnalysis: _approvedAnalysis!,
      delayAnalysis: _delayAnalysis!,
      operationAnalysis: _operationAnalysis!,
          )
        : Container();
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _contracts.isEmpty ? _buildEmptyScreen() : _buildIssues();
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyDataWidget(),
    );
  }

  Expanded _buildIssues() {
    return Expanded(
      child: ListView.builder(
        itemCount: _contracts.length,
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ContractListCardWidget(
              contract: _contracts[index],
            ),
          );
        },
      ),
    );
  }

  //Helper Functions//
  void init() {
    _getContracts(request: _contractRequest);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initDashboard() {
    _contractDashboardBloc.add(GetApprovedAnalysisEvent(
      sectorId: _selectedSector.id ?? "",
    ));

    _contractDashboardBloc.add(GetDelayAnalysisEvent());

    _contractDashboardBloc.add(GetOperationAnalysisEvent());

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _getContracts({
    required ContractListRequest request,
  }) {
    _contractDashboardBloc.add(GetContractsEvent(request: request));
  }

  void _getPhases() {
    _contractDashboardBloc.add(const GetPhasesEvent());
  }

  void _getSectors() {
    _contractDashboardBloc.add(const GetSectorsEvent());
  }

  void _searchEvent(String keyword) {
    _contractDashboardBloc.add(SearchContractEvent(keyword: keyword));
  }

  void _searchContracts(String keyword) {
    _contractRequest = _contractRequest.copyWith(keyword: keyword, pageNo: 1);
    _getContracts(request: _contractRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchContracts("");
  }

  void _onFilterTab() {
    setState(() {
      _isFilterSelected = true;
    });
    _getPhases();
  }

  void _onSortTab() {
    setState(() {
      _isFilterSelected = false;
    });
    _openSortBottomSheet();
  }

  void _openSortBottomSheet() {
    openSortBottomSheet(
        height: 300,
        context: context,
        sorts: sorts,
        selectedSort: _selectedSort,
        selectSortEvent: _selectSortEvent);
  }

  void _selectSortEvent(Sort sort) {
    _contractDashboardBloc.add(SelectSortEvent(sort: sort));
  }

  void _openFilterBottomSheet() {
    openDashboardFilterBottomSheet(
      context: context,
      height: 300,
      phases: _contractDashboardBloc.phases,
      selectedPhase: _selectedPhase,
      sectors: _contractDashboardBloc.sectors,
      selectedSector: _selectedSector,
      isHavePhase: false,
      onTap: (phase, sector,_) {
        _contractDashboardBloc.add(SelectPhaseEvent(phase: phase));
        _contractDashboardBloc.add(SelectSectorEvent(sector: sector));
        _contractDashboardBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getContractWithFilterOptions() {
    _contractRequest = _contractRequest.copyWith(
      sector: _selectedSector.id,
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      pageNo: 1,
    );
    if (_isDashboard) {
      _initDashboard();
    } else {
      _getContracts(
        request: _contractRequest,
      );
    }
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _contractRequest = _contractRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getContracts(request: _contractRequest);
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);
  }
}
