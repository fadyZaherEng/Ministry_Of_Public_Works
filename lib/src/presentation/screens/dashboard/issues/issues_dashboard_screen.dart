import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/presentation/bloc/dashboards/issues/issues_dashboard_bloc.dart';
import 'package:aim/src/presentation/screens/dashboard/issues/widget/issue_list_card_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/issues/widget/issues_dashboard_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/open_dashboard_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssuesDashboardScreen extends BaseStatefulWidget {
  const IssuesDashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<IssuesDashboardScreen> baseCreateState() =>
      _IssuesDashboardScreenState();
}

class _IssuesDashboardScreenState extends BaseState<IssuesDashboardScreen> {
  IssuesDashboardBloc get _issuesDashboardBloc =>
      BlocProvider.of<IssuesDashboardBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isFilterSelected = true;
  IssuesListRequest _issuesRequest = IssuesListRequest();
  Sort _selectedSort = sorts.first;
  List<Issue> _issues = [];
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
    _selectedSort = _issuesDashboardBloc.selectedSort;
    _selectedPhase = _issuesDashboardBloc.selectedPhase;
    _selectedSector = _issuesDashboardBloc.selectedSector;
    _issuesRequest = IssuesListRequest(
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
        _issuesRequest =
            _issuesRequest.copyWith(pageNo: _issuesRequest.pageNo! + 1);
        _getIssues(request: _issuesRequest);
      }
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<IssuesDashboardBloc, IssuesDashboardState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetIssuesSuccessState) {
          isPaginationLoad = false;
          _issues = state.issues;
        } else if (state is GetIssuesFailState) {
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
        } else if (state is SearchIssuesState) {
          _searchIssues(state.keyword);
        } else if (state is GetIssueAnalysisChartByPhaseSuccessState) {
          _analysisChartByPhase = state.analysisChartByPhase;
        } else if (state is GetIssueAnalysisChartByPhaseFailState) {
        } else if (state is GetIssueAnalysisChartBySectorSuccessState) {
          _analysisChartBySector = state.analysisChartBySector;
        } else if (state is GetIssueAnalysisChartBySectorFailState) {
        } else if (state is GetIssueCountsSuccessState) {
          _riskCounts = state.counts;
        } else if (state is GetIssueCountsFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getIssuesWithFilterOptions();
        }
      },
      builder: (context, state) {
        return SharedDashboardScreen(
          title: S.of(context).issues,
          searchLabel: S.of(context).searchIssue,
          searchTextEditingController: _searchTextEditingController,
          isFilterSelected: _isFilterSelected,
          onChange: _searchEvent,
          isHaveSearch: false,
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
        ? IssuesDashboardWidget(
            analysisChartByPhase: _analysisChartByPhase!,
            analysisChartBySector: _analysisChartBySector!,
            issueCounts: _riskCounts,
          )
        : Container();
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _issues.isEmpty ? _buildEmptyScreen() : _buildIssues();
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyDataWidget(),
    );
  }

  Expanded _buildIssues() {
    return Expanded(
      child: ListView.builder(
        itemCount: _issues.length,
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: IssueListCardWidget(
              issue: _issues[index],
            ),
          );
        },
      ),
    );
  }

  //Helper Functions//
  void init() {
    _getIssues(request: _issuesRequest);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initDashboard() {
    _issuesDashboardBloc.add(GetIssueAnalysisChartBySectorEvent(
      phaseId: _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
      sectorId: _selectedSector.id ?? "",
    ));
    _issuesDashboardBloc.add(GetIssueAnalysisChartByPhaseEvent(
      phaseId: _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
      sectorId: _selectedSector.id ?? "",
    ));
    _issuesDashboardBloc.add(GetIssueCountsEvent(
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

  void _getIssues({
    required IssuesListRequest request,
  }) {
    _issuesDashboardBloc.add(GetIssuesEvent(request: request));
  }

  void _getPhases() {
    _issuesDashboardBloc.add(const GetPhasesEvent());
  }

  void _getSectors() {
    _issuesDashboardBloc.add(const GetSectorsEvent());
  }

  void _searchEvent(String keyword) {
    _issuesDashboardBloc.add(SearchIssuesEvent(keyword: keyword));
  }

  void _searchIssues(String keyword) {
    _issuesRequest = _issuesRequest.copyWith(keyword: keyword, pageNo: 1);
    _getIssues(request: _issuesRequest);
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
    _issuesDashboardBloc.add(SelectSortEvent(sort: sort));
  }

  void _openFilterBottomSheet() {
    openDashboardFilterBottomSheet(
      context: context,
      height: 300,
      phases: _issuesDashboardBloc.phases,
      selectedPhase: _selectedPhase,
      sectors: _issuesDashboardBloc.sectors,
      selectedSector: _selectedSector,
      onTap: (phase, sector,_) {
        _issuesDashboardBloc.add(SelectPhaseEvent(phase: phase));
        _issuesDashboardBloc.add(SelectSectorEvent(sector: sector));
        _issuesDashboardBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getIssuesWithFilterOptions() {
    _issuesRequest = _issuesRequest.copyWith(
      sector: _selectedSector.id,
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      pageNo: 1,
    );
    if (_isDashboard) {
      _initDashboard();
    } else {
      _getIssues(
        request: _issuesRequest,
      );
    }
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _issuesRequest = _issuesRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getIssues(request: _issuesRequest);
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
