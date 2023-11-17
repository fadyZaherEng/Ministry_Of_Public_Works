import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:aim/src/presentation/bloc/dashboards/risks/risks_dashboard_bloc.dart';
import 'package:aim/src/presentation/screens/dashboard/open_dashboard_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/dashboard/risks/widget/risk_list_card_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/risks/widget/risks_dashboard_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RisksDashboardScreen extends BaseStatefulWidget {
  const RisksDashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<RisksDashboardScreen> baseCreateState() =>
      _RisksDashboardScreenState();
}

class _RisksDashboardScreenState extends BaseState<RisksDashboardScreen> {
  RisksDashboardBloc get _risksDashboardBloc =>
      BlocProvider.of<RisksDashboardBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isFilterSelected = true;
  RisksListRequest _risksRequest = RisksListRequest();
  Sort _selectedSort = sorts.first;
  List<Risk> _risks = [];
  Phase _selectedPhase = const Phase();
  ProjectType _selectedSector = const ProjectType();
  bool isPaginationLoad = false;
  bool _isDashboard = true;
  AnalysisChartByPhase? _analysisChartByPhase;
  AnalysisChartBySector? _analysisChartBySector;
  List<int> _riskCounts = [];

  @override
  void initState() {
    super.initState();
    _selectedSort = _risksDashboardBloc.selectedSort;
    _selectedPhase = _risksDashboardBloc.selectedPhase;
    _selectedSector = _risksDashboardBloc.selectedSector;
    _risksRequest = RisksListRequest(
      keyword: "",
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      sector: _selectedSector.id ?? "",
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
        _risksRequest =
            _risksRequest.copyWith(pageNo: _risksRequest.pageNo! + 1);
        _getRisks(request: _risksRequest);
      }
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<RisksDashboardBloc, RisksDashboardState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetRisksSuccessState) {
          isPaginationLoad = false;
          _risks = state.risks;
        } else if (state is GetRisksFailState) {
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
        } else if (state is SearchRisksState) {
          _searchRisks(state.keyword);
        } else if (state is GetRiskAnalysisChartByPhaseSuccessState) {
          _analysisChartByPhase = state.analysisChartByPhase;
        } else if (state is GetRiskAnalysisChartByPhaseFailState) {
        } else if (state is GetRiskAnalysisChartBySectorSuccessState) {
          _analysisChartBySector = state.analysisChartBySector;
        } else if (state is GetRiskAnalysisChartBySectorFailState) {
        } else if (state is GetRiskCountsSuccessState) {
          _riskCounts = state.counts;
        } else if (state is GetRiskCountsFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getRisksWithFilterOptions();
        }
      },
      builder: (context, state) {
        return SharedDashboardScreen(
          title: S.of(context).riskDashboard,
          searchLabel: S.of(context).searchRisk,
          searchTextEditingController: _searchTextEditingController,
          isFilterSelected: _isFilterSelected,
          isHaveSearch: false,
          onChange: _searchEvent,
          onSubmit: _searchEvent,
          clearActionButton: _clearSearch,
          onFilterTab: _onFilterTab,
          onSortTab: _onSortTab,
          isHaveBackButton: true,
          isDashboard: _isDashboard,
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
    return _analysisChartByPhase != null && _analysisChartBySector != null
        ? RisksDashboardWidget(
            analysisChartByPhase: _analysisChartByPhase!,
            analysisChartBySector: _analysisChartBySector!,
            riskCounts: _riskCounts,
          )
        : Container();
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _risks.isEmpty ? _buildEmptyScreen() : _buildRisks();
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyDataWidget(),
    );
  }

  Expanded _buildRisks() {
    return Expanded(
      child: ListView.builder(
        itemCount: _risks.length,
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: RiskListCardWidget(
              risk: _risks[index],
            ),
          );
        },
      ),
    );
  }

  //Helper Functions//
  void init() {
    _getRisks(request: _risksRequest);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initDashboard() {
    _risksDashboardBloc.add(GetRiskAnalysisChartBySectorEvent(
      phaseId: _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
      sectorId: _selectedSector.id ?? "",
    ));
    _risksDashboardBloc.add(GetRiskAnalysisChartByPhaseEvent(
      phaseId: _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
      sectorId: _selectedSector.id ?? "",
    ));
    _risksDashboardBloc.add(GetRiskCountsEvent(
      phaseId: _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
      sectorId: _selectedSector.id ?? "",
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _getRisks({
    required RisksListRequest request,
  }) {
    _risksDashboardBloc.add(GetRisksEvent(request: request));
  }

  void _getPhases() {
    _risksDashboardBloc.add(const GetPhasesEvent());
  }

  void _getSectors() {
    _risksDashboardBloc.add(const GetSectorsEvent());
  }

  void _searchEvent(String keyword) {
    _risksDashboardBloc.add(SearchRisksEvent(keyword: keyword));
  }

  void _searchRisks(String keyword) {
    _risksRequest = _risksRequest.copyWith(keyword: keyword, pageNo: 1);
    _getRisks(request: _risksRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchRisks("");
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
    _risksDashboardBloc.add(SelectSortEvent(sort: sort));
  }

  void _openFilterBottomSheet() {
    openDashboardFilterBottomSheet(
      context: context,
      height: 300,
      phases: _risksDashboardBloc.phases,
      selectedPhase: _selectedPhase,
      sectors: _risksDashboardBloc.sectors,
      selectedSector: _selectedSector,
      onTap: (phase, sector,_) {
        _risksDashboardBloc.add(SelectPhaseEvent(phase: phase));
        _risksDashboardBloc.add(SelectSectorEvent(sector: sector));
        _risksDashboardBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getRisksWithFilterOptions() {
    _risksRequest = _risksRequest.copyWith(
      sector: _selectedSector.id,
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      pageNo: 1,
    );
    if (_isDashboard) {
      _initDashboard();
    } else {
      _getRisks(
        request: _risksRequest,
      );
    }
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _risksRequest = _risksRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getRisks(request: _risksRequest);
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
