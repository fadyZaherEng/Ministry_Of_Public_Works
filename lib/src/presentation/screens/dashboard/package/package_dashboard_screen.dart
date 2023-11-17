import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/package/request/package_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/indicator.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/package/package.dart';
import 'package:aim/src/domain/entities/package/package_analysis_chart.dart';
import 'package:aim/src/domain/entities/package/package_circle_chart.dart';
import 'package:aim/src/presentation/bloc/dashboards/package/package_dashboard_bloc.dart';
import 'package:aim/src/presentation/screens/dashboard/open_dashboard_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/dashboard/overview/widget/overview_dashboard_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/overview/widget/overview_list_card_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/package/widget/package_dashboard_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/package/widget/package_list_card_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageDashboardScreen extends BaseStatefulWidget {
  const PackageDashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<PackageDashboardScreen> baseCreateState() =>
      _PackageDashboardScreenState();
}

class _PackageDashboardScreenState extends BaseState<PackageDashboardScreen> {
  PackageDashboardBloc get _overviewDashboardBloc =>
      BlocProvider.of<PackageDashboardBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isFilterSelected = true;
  PackageListRequest _packageRequest = PackageListRequest();
  Sort _selectedSort = sorts.first;
  List<Package> _packages = [];
  Phase _selectedPhase = const Phase();
  ProjectType _selectedSector = const ProjectType();
  Indicator _selectedIndicator = const Indicator();
  bool isPaginationLoad = false;
  bool _isDashboard = true;
  PackageAnalysisChart? _packageAnalysisChart;
  PackageCircleChart? _packageCircleChart;

  @override
  void initState() {
    super.initState();
    _selectedSort = _overviewDashboardBloc.selectedSort;
    _selectedPhase = _overviewDashboardBloc.selectedPhase;
    _selectedSector = _overviewDashboardBloc.selectedSector;
    _selectedIndicator = _overviewDashboardBloc.selectedIndicator;
    _packageRequest = PackageListRequest(
      keyword: "",
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      sector: _selectedSector.id ?? "",
      phase: (_selectedPhase.id ?? 0) == 0 ? "" : _selectedPhase.id.toString(),
      color: _selectedIndicator.id ?? 0,
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
        _packageRequest =
            _packageRequest.copyWith(pageNo: _packageRequest.pageNo! + 1);
        _getOverview(request: _packageRequest);
      }
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<PackageDashboardBloc, PackageDashboardState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetPackagesSuccessState) {
          isPaginationLoad = false;
          _packages = state.packages;
        } else if (state is GetPackagesFailState) {
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
        } else if (state is SearchPackagesState) {
          _searchPackage(state.keyword);
        } else if (state is GetPackageMinistryChartSuccessState) {
          _packageCircleChart = state.packageCircleChart;
        } else if (state is GetPackageMinistryChartFailState) {
        } else if (state is GetPackageAnalysisCharSuccessState) {
          _packageAnalysisChart = state.packageAnalysisChart;
        } else if (state is GetPackageAnalysisCharFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getOverviewWithFilterOptions();
        } else if(state is SelectIndicatorState){
          _selectedIndicator = state.indicator;
        }
      },
      builder: (context, state) {
        return SharedDashboardScreen(
          title: S.of(context).finalDataPackage,
          searchLabel: S.of(context).searchPackages,
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
    return _packageCircleChart != null && _packageAnalysisChart != null
        ? PackageDashboardWidget(
            packageAnalysisChart: _packageAnalysisChart!,
            packageCircleChart: _packageCircleChart!,
          )
        : Container();
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _packages.isEmpty ? _buildEmptyScreen() : _buildOverview();
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyDataWidget(),
    );
  }

  Expanded _buildOverview() {
    return Expanded(
      child: ListView.builder(
        itemCount: _packages.length,
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: PackageListCardWidget(
              package: _packages[index],
            ),
          );
        },
      ),
    );
  }

  //Helper Functions//
  void init() {
    _getOverview(request: _packageRequest);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initDashboard() {
    _overviewDashboardBloc.add(GetPackageAnalysisChartEvent(
      sectorId: _selectedSector.id ?? "",
      color: _selectedIndicator.id ?? 0,
    ));
    _overviewDashboardBloc.add(GetPackageMinistryChartEvent(
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

  void _getOverview({
    required PackageListRequest request,
  }) {
    _overviewDashboardBloc.add(GetPackagesEvent(request: request));
  }

  void _getPhases() {
    _overviewDashboardBloc.add(const GetPhasesEvent());
  }

  void _getSectors() {
    _overviewDashboardBloc.add(const GetSectorsEvent());
  }

  void _searchEvent(String keyword) {
    _overviewDashboardBloc.add(SearchPackagesEvent(keyword: keyword));
  }

  void _searchPackage(String keyword) {
    _packageRequest = _packageRequest.copyWith(keyword: keyword, pageNo: 1);
    _getOverview(request: _packageRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchPackage("");
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
      isHavePhase: false,
      selectedIndicator: _selectedIndicator,
      indicators: [
        Indicator(id: 1,name: "Green" ,color: ColorSchema.barGreen),
        Indicator(id: 2,name: "Yellow" ,color: Colors.yellow),
        Indicator(id: 3,name: "Red" ,color: Colors.red),
      ],
      isHaveIndicator: true,
      onTap: (phase, sector,indicator) {
        _overviewDashboardBloc.add(SelectPhaseEvent(phase: phase));
        _overviewDashboardBloc.add(SelectSectorEvent(sector: sector));
        _overviewDashboardBloc.add(SelectIndicatorEvent(indicator: indicator));
        _overviewDashboardBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getOverviewWithFilterOptions() {
    _packageRequest = _packageRequest.copyWith(
      sector: _selectedSector.id,
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      color: _selectedIndicator.id ?? 0,
      pageNo: 1,
    );
    if (_isDashboard) {
      _initDashboard();
    } else {
      _getOverview(
        request: _packageRequest,
      );
    }
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _packageRequest = _packageRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getOverview(request: _packageRequest);
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
