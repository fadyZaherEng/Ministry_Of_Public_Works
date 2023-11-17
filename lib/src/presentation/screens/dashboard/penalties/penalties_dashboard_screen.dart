import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/indicator.dart';
import 'package:aim/src/domain/entities/dashboards/payments_chart.dart';
import 'package:aim/src/domain/entities/dashboards/penalties_chart.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/project/project.dart';
import 'package:aim/src/presentation/bloc/dashboards/penalties/penalties_dashboard_bloc.dart';
import 'package:aim/src/presentation/screens/dashboard/open_dashboard_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/dashboard/payments/widget/payment_list_card_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/payments/widget/payments_dashboard_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/penalties/widget/penalties_dashboard_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/penalties/widget/penalties_list_card_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PenaltiesDashboardScreen extends BaseStatefulWidget {
  const PenaltiesDashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<PenaltiesDashboardScreen> baseCreateState() =>
      _PenaltiesDashboardScreenState();
}

class _PenaltiesDashboardScreenState
    extends BaseState<PenaltiesDashboardScreen> {
  PenaltiesDashboardBloc get _penaltiesDashboardBloc =>
      BlocProvider.of<PenaltiesDashboardBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isFilterSelected = true;
  PenaltiesListRequest _paymentsListRequest = PenaltiesListRequest();
  Sort _selectedSort = sorts.first;
  List<Project> _penalties = [];
  Phase _selectedPhase = const Phase();
  ProjectType _selectedSector = const ProjectType();
  Indicator _selectedIndicator = const Indicator();
  bool isPaginationLoad = false;
  bool _isDashboard = true;
  PenaltiesChart? _penaltiesChartDesign;
  PenaltiesChart? _penaltiesChartExecution;

  @override
  void initState() {
    super.initState();
    _selectedSort = _penaltiesDashboardBloc.selectedSort;
    _selectedPhase = _penaltiesDashboardBloc.selectedPhase;
    _selectedSector = _penaltiesDashboardBloc.selectedSector;
    _selectedIndicator = _penaltiesDashboardBloc.selectedIndicator;
    _paymentsListRequest = PenaltiesListRequest(
      keyword: "",
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      sector: _selectedSector.id ?? "",
      phase: (_selectedPhase.id ?? 0) == 0 ? "" : _selectedPhase.id.toString(),
      pageSize: pageSize,
      color: _selectedIndicator.id ?? 0,
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
        _paymentsListRequest = _paymentsListRequest.copyWith(
            pageNo: _paymentsListRequest.pageNo! + 1);
        _getPenalties(request: _paymentsListRequest);
      }
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<PenaltiesDashboardBloc, PenaltiesDashboardState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetPenaltiesSuccessState) {
          isPaginationLoad = false;
          _penalties = state.penalties;
        } else if (state is GetPenaltiesFailState) {
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
        } else if (state is SearchPenaltiesState) {
          _searchPenalties(state.keyword);
        } else if (state is GetPenaltyChartDesignSuccessState) {
          _penaltiesChartDesign = state.penaltiesChart;
        } else if (state is GetPenaltyChartDesignFailState) {
        } else if (state is GetPenaltyChartExecutionSuccessState) {
          _penaltiesChartExecution = state.penaltiesChart;
        } else if (state is GetPenaltyChartExecutionFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getPenaltiesWithFilterOptions();
        } else if(state is SelectIndicatorState){
          _selectedIndicator = state.indicator;
        }
      },
      builder: (context, state) {
        return SharedDashboardScreen(
          title: S.of(context).penaltiesDashboard,
          searchLabel: S.of(context).searchPenalties,
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
    return _penaltiesChartDesign != null && _penaltiesChartExecution != null
        ? PenaltiesDashboardWidget(
            penaltiesChartDesign: _penaltiesChartDesign!,
            penaltiesChartExecution: _penaltiesChartExecution!,
          )
        : Container();
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _penalties.isEmpty ? _buildEmptyScreen() : _buildPenalties();
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyDataWidget(),
    );
  }

  Expanded _buildPenalties() {
    return Expanded(
      child: ListView.builder(
        itemCount: _penalties.length,
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: PenaltiesListCardWidget(
              penalty: _penalties[index],
            ),
          );
        },
      ),
    );
  }

  //Helper Functions//
  void init() {
    _getPenalties(request: _paymentsListRequest);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initDashboard() {
    _penaltiesDashboardBloc.add(GetPenaltyChartDesignEvent(
      sectorId: _selectedSector.id ?? "",
      color: _selectedIndicator.id ?? 0,
    ));
    _penaltiesDashboardBloc.add(GetPenaltyChartExecutionEvent(
      sectorId: _selectedSector.id ?? "",
      color: _selectedIndicator.id ?? 0,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _getPenalties({
    required PenaltiesListRequest request,
  }) {
    _penaltiesDashboardBloc.add(GetPenaltiesEvent(request: request));
  }

  void _getPhases() {
    _penaltiesDashboardBloc.add(const GetPhasesEvent());
  }

  void _getSectors() {
    _penaltiesDashboardBloc.add(const GetSectorsEvent());
  }

  void _searchEvent(String keyword) {
    _penaltiesDashboardBloc.add(SearchPenaltiesEvent(keyword: keyword));
  }

  void _searchPenalties(String keyword) {
    _paymentsListRequest =
        _paymentsListRequest.copyWith(keyword: keyword, pageNo: 1);
    _getPenalties(request: _paymentsListRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchPenalties("");
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
    _penaltiesDashboardBloc.add(SelectSortEvent(sort: sort));
  }

  void _openFilterBottomSheet() {
    openDashboardFilterBottomSheet(
      context: context,
      height: 300,
      phases: _penaltiesDashboardBloc.phases,
      selectedPhase: _selectedPhase,
      sectors: _penaltiesDashboardBloc.sectors,
      isHavePhase: !_isDashboard,
      selectedSector: _selectedSector,
      selectedIndicator: _selectedIndicator,
      indicators: [
        Indicator(id: 1,name: "Green" ,color: ColorSchema.barGreen),
        Indicator(id: 2,name: "Yellow" ,color: Colors.yellow),
        Indicator(id: 3,name: "Red" ,color: Colors.red),
      ],
      isHaveIndicator: true,
      onTap: (phase, sector,indicator) {
        _penaltiesDashboardBloc.add(SelectPhaseEvent(phase: phase));
        _penaltiesDashboardBloc.add(SelectSectorEvent(sector: sector));
        _penaltiesDashboardBloc.add(SelectIndicatorEvent(indicator: indicator));
        _penaltiesDashboardBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getPenaltiesWithFilterOptions() {
    _paymentsListRequest = _paymentsListRequest.copyWith(
      sector: _selectedSector.id,
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      color: _selectedIndicator.id,
      pageNo: 1,
    );
    if (_isDashboard) {
      _initDashboard();
    } else {
      _getPenalties(
        request: _paymentsListRequest,
      );
    }
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _paymentsListRequest = _paymentsListRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getPenalties(request: _paymentsListRequest);
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
