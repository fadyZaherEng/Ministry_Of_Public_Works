import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/dashboards/variations_chart.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:aim/src/presentation/bloc/dashboards/variations/variations_dashboard_bloc.dart';
import 'package:aim/src/presentation/screens/dashboard/open_dashboard_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/dashboard/risks/widget/risk_list_card_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/risks/widget/risks_dashboard_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/variations/widget/variation_list_card_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/variations/widget/variations_dashboard_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VariationsDashboardScreen extends BaseStatefulWidget {
  const VariationsDashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<VariationsDashboardScreen> baseCreateState() =>
      _VariationsDashboardScreenState();
}

class _VariationsDashboardScreenState
    extends BaseState<VariationsDashboardScreen> {
  VariationsDashboardBloc get _risksDashboardBloc =>
      BlocProvider.of<VariationsDashboardBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isFilterSelected = true;
  VariationsListRequest _risksRequest = VariationsListRequest();
  Sort _selectedSort = sorts.first;
  List<Variation> _variations = [];
  Phase _selectedPhase = const Phase();
  ProjectType _selectedSector = const ProjectType();
  bool isPaginationLoad = false;
  bool _isDashboard = true;
  VariationsChart? _variationsChart;
  CircleChart? _circleChart;
  List<int> _riskCounts = [];

  @override
  void initState() {
    super.initState();
    _selectedSort = _risksDashboardBloc.selectedSort;
    _selectedPhase = _risksDashboardBloc.selectedPhase;
    _selectedSector = _risksDashboardBloc.selectedSector;
    _risksRequest = VariationsListRequest(
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
        _getVariations(request: _risksRequest);
      }
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<VariationsDashboardBloc, VariationsDashboardState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetVariationsSuccessState) {
          isPaginationLoad = false;
          _variations = state.variations;
        } else if (state is GetVariationsFailState) {
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
        } else if (state is SearchVariationsState) {
          _searchVariations(state.keyword);
        } else if (state is GetVariationsChartSuccessState) {
          _variationsChart = state.variationsChart;
        } else if (state is GetVariationsChartFailState) {
        } else if (state is GetVariationsCircleChartSuccessState) {
          _circleChart = state.circleChart;
        } else if (state is GetVariationsCircleChartFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getVariationsWithFilterOptions();
        }
      },
      builder: (context, state) {
        return SharedDashboardScreen(
          title: S.of(context).variationOrdersTitle,
          searchLabel: S.of(context).searchVariation,
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
    return _variationsChart != null && _circleChart != null
        ? VariationsDashboardWidget(
            variationsChart: _variationsChart!,
            circleChart: _circleChart!,
          )
        : Container();
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _variations.isEmpty ? _buildEmptyScreen() : _buildVariations();
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyDataWidget(),
    );
  }

  Expanded _buildVariations() {
    return Expanded(
      child: ListView.builder(
        itemCount: _variations.length,
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: VariationListCardWidget(
              variation: _variations[index],
            ),
          );
        },
      ),
    );
  }

  //Helper Functions//
  void init() {
    _getVariations(request: _risksRequest);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initDashboard() {
    _risksDashboardBloc.add(GetVariationsChartEvent(
      phaseId: _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
      sectorId: _selectedSector.id ?? "",
    ));
    _risksDashboardBloc.add(GetVariationsCircleChartEvent(
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

  void _getVariations({
    required VariationsListRequest request,
  }) {
    _risksDashboardBloc.add(GetVariationsEvent(request: request));
  }

  void _getPhases() {
    _risksDashboardBloc.add(const GetPhasesEvent());
  }

  void _getSectors() {
    _risksDashboardBloc.add(const GetSectorsEvent());
  }

  void _searchEvent(String keyword) {
    _risksDashboardBloc.add(SearchVariationsEvent(keyword: keyword));
  }

  void _searchVariations(String keyword) {
    _risksRequest = _risksRequest.copyWith(keyword: keyword, pageNo: 1);
    _getVariations(request: _risksRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchVariations("");
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

  void _getVariationsWithFilterOptions() {
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
      _getVariations(
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
    _getVariations(request: _risksRequest);
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
