import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/design/request/design_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/design/design.dart';
import 'package:aim/src/domain/entities/design/design_chart.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/presentation/bloc/dashboards/design/design_dashboard_bloc.dart';
import 'package:aim/src/presentation/screens/dashboard/design/widget/design_dashboard_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/design/widget/design_list_card_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/open_dashboard_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesignDashboardScreen extends BaseStatefulWidget {
  const DesignDashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<DesignDashboardScreen> baseCreateState() =>
      _DesignDashboardScreenState();
}

class _DesignDashboardScreenState extends BaseState<DesignDashboardScreen> {
  DesignDashboardBloc get _designDashboardBloc =>
      BlocProvider.of<DesignDashboardBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isFilterSelected = true;
  DesignListRequest _designRequest = DesignListRequest();
  Sort _selectedSort = sorts.first;
  List<Design> _designs = [];
  Phase _selectedPhase = const Phase();
  ProjectType _selectedSector = const ProjectType();
  bool isPaginationLoad = false;
  bool _isDashboard = true;
  DesignChart? _designChart;
  CircleChart? circleChart;

  @override
  void initState() {
    super.initState();
    _selectedSort = _designDashboardBloc.selectedSort;
    _selectedPhase = _designDashboardBloc.selectedPhase;
    _selectedSector = _designDashboardBloc.selectedSector;
    _designRequest = DesignListRequest(
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
        _designRequest =
            _designRequest.copyWith(pageNo: _designRequest.pageNo! + 1);
        _getDesigns(request: _designRequest);
      }
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<DesignDashboardBloc, DesignDashboardState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetDesignsSuccessState) {
          isPaginationLoad = false;
          _designs = state.designs;
        } else if (state is GetDesignsFailState) {
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
        } else if (state is SearchDesignState) {
          _searchIssues(state.keyword);
        } else if (state is GetDesignChartSuccessState) {
          _designChart = state.designChart;
        } else if (state is GetDesignChartFailState) {
        } else if (state is GetDesignMinistrySuccessState) {
          circleChart = state.circleChart;
        } else if (state is GetDesignChartFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getIssuesWithFilterOptions();
        }
      },
      builder: (context, state) {
        return SharedDashboardScreen(
          title: S.of(context).designProcessDashboard,
          searchLabel: "Search Design",
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
    return _designChart != null && circleChart != null
        ? DesignDashboardWidget(
            designChart: _designChart!,
            circleChart: circleChart!,
          )
        : Container();
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _designs.isEmpty ? _buildEmptyScreen() : _buildIssues();
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyDataWidget(),
    );
  }

  Expanded _buildIssues() {
    return Expanded(
      child: ListView.builder(
        itemCount: _designs.length,
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: DesignListCardWidget(
              design: _designs[index],
            ),
          );
        },
      ),
    );
  }

  //Helper Functions//
  void init() {
    _getDesigns(request: _designRequest);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initDashboard() {
    _designDashboardBloc.add(GetDesignChartEvent(
      sectorId:
          (_selectedSector.id ?? "").isEmpty ? "a" : _selectedSector.id ?? "",
    ));
    _designDashboardBloc.add(GetDesignMinistryEvent(
      sectorId: _selectedSector.id ?? "",
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _getDesigns({
    required DesignListRequest request,
  }) {
    _designDashboardBloc.add(GetDesignsEvent(request: request));
  }

  void _getPhases() {
    _designDashboardBloc.add(const GetPhasesEvent());
  }

  void _getSectors() {
    _designDashboardBloc.add(const GetSectorsEvent());
  }

  void _searchEvent(String keyword) {
    _designDashboardBloc.add(SearchDesignEvent(keyword: keyword));
  }

  void _searchIssues(String keyword) {
    _designRequest = _designRequest.copyWith(keyword: keyword, pageNo: 1);
    _getDesigns(request: _designRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchIssues("");
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
    _designDashboardBloc.add(SelectSortEvent(sort: sort));
  }

  void _openFilterBottomSheet() {
    openDashboardFilterBottomSheet(
      context: context,
      height: 300,
      phases: _designDashboardBloc.phases,
      selectedPhase: _selectedPhase,
      sectors: _designDashboardBloc.sectors,
      selectedSector: _selectedSector,
      isHavePhase: false,
      onTap: (phase, sector, _) {
        _designDashboardBloc.add(SelectPhaseEvent(phase: phase));
        _designDashboardBloc.add(SelectSectorEvent(sector: sector));
        _designDashboardBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getIssuesWithFilterOptions() {
    _designRequest = _designRequest.copyWith(
      sector: _selectedSector.id,
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      pageNo: 1,
    );
    if (_isDashboard) {
      _initDashboard();
    } else {
      _getDesigns(
        request: _designRequest,
      );
    }
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _designRequest = _designRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getDesigns(request: _designRequest);
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
