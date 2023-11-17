import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/overview/overview.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:aim/src/presentation/bloc/dashboards/overview/overview_dashboard_bloc.dart';
import 'package:aim/src/presentation/screens/dashboard/open_dashboard_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/dashboard/overview/widget/overview_dashboard_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/overview/widget/overview_list_card_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewDashboardScreen extends BaseStatefulWidget {
  const OverviewDashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<OverviewDashboardScreen> baseCreateState() =>
      _OverviewDashboardScreenState();
}

class _OverviewDashboardScreenState extends BaseState<OverviewDashboardScreen> {
  OverviewDashboardBloc get _overviewDashboardBloc =>
      BlocProvider.of<OverviewDashboardBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isFilterSelected = true;
  OverviewListRequest _overviewRequest = OverviewListRequest();
  Sort _selectedSort = sorts.first;
  List<Overview> _overviews = [];
  Phase _selectedPhase = const Phase();
  ProjectType _selectedSector = const ProjectType();
  bool isPaginationLoad = false;
  bool _isDashboard = true;
  OverviewChartByPhase? _overviewChartByPhase;
  OverviewChartBySector? _overviewChartBySector;
  List<String> cards = [];
  int projects = 0;
  String _permission = "";
  @override
  void initState() {
    super.initState();
    _overviewDashboardBloc.add(GetUserPermissionEvent());
    _selectedSort = _overviewDashboardBloc.selectedSort;
    _selectedPhase = _overviewDashboardBloc.selectedPhase;
    _selectedSector = _overviewDashboardBloc.selectedSector;
    _overviewRequest = OverviewListRequest(
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
        _overviewRequest =
            _overviewRequest.copyWith(pageNo: _overviewRequest.pageNo! + 1);
        _getOverview(request: _overviewRequest);
      }
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<OverviewDashboardBloc, OverviewDashboardState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetOverviewSuccessState) {
          isPaginationLoad = false;
          _overviews = state.overviews;
        } else if (state is GetOverviewFailState) {
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
        } else if (state is SearchOverviewState) {
          _searchOverview(state.keyword);
        } else if (state is GetProjectsInProgressSuccessState) {
          projects = state.projects;
        } else if (state is GetProjectsInProgressFailState) {
        } else if (state is GetOverviewCardsSuccessState) {
          cards = state.cards;
        } else if (state is GetOverviewCardsFailState) {
        } else if (state is GetOverviewProjectsBySectorSuccessState) {
          _overviewChartBySector = state.overviewChartBySector;
        } else if (state is GetOverviewProjectsBySectorFailState) {
        } else if (state is GetOverviewProjectsByPhaseSuccessState) {
          _overviewChartByPhase = state.overviewChartByPhase;
        } else if (state is GetOverviewProjectsByPhaseFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getOverviewWithFilterOptions();
        } else if(state is GetUserPermissionState){
          _permission = state.permission;
        }
      },
      builder: (context, state) {
        return SharedDashboardScreen(
          title: S.of(context).overview,
          searchLabel: S.of(context).search,
          searchTextEditingController: _searchTextEditingController,
          isFilterSelected: _isFilterSelected,
          onChange: _searchEvent,
          onSubmit: _searchEvent,
          clearActionButton: _clearSearch,
          isHaveSearch: false,
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
    return _overviewChartBySector != null && _overviewChartByPhase != null && cards.isNotEmpty
        ? OverviewDashboardWidget(
            overviewChartByPhase: _overviewChartByPhase!,
            overviewChartBySector: _overviewChartBySector!,
            cards: cards,
            projects: projects,
          )
        : Container();
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _overviews.isEmpty ? _buildEmptyScreen() : _buildOverview();
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyDataWidget(),
    );
  }

  Expanded _buildOverview() {
    return Expanded(
      child: ListView.builder(
        itemCount: _overviews.length,
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: OverviewListCardWidget(
              overview: _overviews[index],
              permission: _permission,
            ),
          );
        },
      ),
    );
  }

  //Helper Functions//
  void init() {
    _getOverview(request: _overviewRequest);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initDashboard() {
    _overviewDashboardBloc.add(GetProjectsInProgressEvent(
      phaseId: _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
      sectorId: _selectedSector.id ?? "",
    ));
    _overviewDashboardBloc.add(GetOverviewCardsEvent(
      phaseId: _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
      sectorId: _selectedSector.id ?? "",
    ));
    _overviewDashboardBloc.add(GetOverviewProjectsByPhaseEvent(
      phaseId: _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
      sectorId: _selectedSector.id ?? "",
    ));
    _overviewDashboardBloc.add(GetOverviewProjectsBySectorEvent(
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

  void _getOverview({
    required OverviewListRequest request,
  }) {
    _overviewDashboardBloc.add(GetOverviewEvent(request: request));
  }

  void _getPhases() {
    _overviewDashboardBloc.add(const GetPhasesEvent());
  }

  void _getSectors() {
    _overviewDashboardBloc.add(const GetSectorsEvent());
  }

  void _searchEvent(String keyword) {
    _overviewDashboardBloc.add(SearchOverviewEvent(keyword: keyword));
  }

  void _searchOverview(String keyword) {
    _overviewRequest = _overviewRequest.copyWith(keyword: keyword, pageNo: 1);
    _getOverview(request: _overviewRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchOverview("");
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
    _overviewDashboardBloc.add(SelectSortEvent(sort: sort));
  }

  void _openFilterBottomSheet() {
    openDashboardFilterBottomSheet(
      context: context,
      height: 300,
      phases: _overviewDashboardBloc.phases,
      selectedPhase: _selectedPhase,
      sectors: _overviewDashboardBloc.sectors,
      selectedSector: _selectedSector,
      onTap: (phase, sector,_) {
        _overviewDashboardBloc.add(SelectPhaseEvent(phase: phase));
        _overviewDashboardBloc.add(SelectSectorEvent(sector: sector));
        _overviewDashboardBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getOverviewWithFilterOptions() {
    _overviewRequest = _overviewRequest.copyWith(
      sector: _selectedSector.id,
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      pageNo: 1,
    );
    if (_isDashboard) {
      _initDashboard();
    } else {
      _getOverview(
        request: _overviewRequest,
      );
    }
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _overviewRequest = _overviewRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getOverview(request: _overviewRequest);
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
