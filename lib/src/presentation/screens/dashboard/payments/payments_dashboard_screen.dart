import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/indicator.dart';
import 'package:aim/src/domain/entities/dashboards/payments_chart.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/payments/payment.dart';
import 'package:aim/src/presentation/bloc/dashboards/payments/payments_dashboard_bloc.dart';
import 'package:aim/src/presentation/screens/dashboard/open_dashboard_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/dashboard/payments/widget/payment_list_card_widget.dart';
import 'package:aim/src/presentation/screens/dashboard/payments/widget/payments_dashboard_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentsDashboardScreen extends BaseStatefulWidget {
  const PaymentsDashboardScreen({Key? key}) : super(key: key);

  @override
  BaseState<PaymentsDashboardScreen> baseCreateState() =>
      _PaymentsDashboardScreenState();
}

class _PaymentsDashboardScreenState extends BaseState<PaymentsDashboardScreen> {
  PaymentsDashboardBloc get _paymentsDashboardBloc =>
      BlocProvider.of<PaymentsDashboardBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isFilterSelected = true;
  PaymentsListRequest _paymentsListRequest = PaymentsListRequest();
  Sort _selectedSort = sorts.first;
  List<Payment> _payments = [];
  Phase _selectedPhase = const Phase();
  ProjectType _selectedSector = const ProjectType();
  Indicator _selectedIndicator = const Indicator();
  bool isPaginationLoad = false;
  bool _isDashboard = true;
  PaymentsChart? _paymentsChart;

  @override
  void initState() {
    super.initState();
    _selectedSort = _paymentsDashboardBloc.selectedSort;
    _selectedPhase = _paymentsDashboardBloc.selectedPhase;
    _selectedSector = _paymentsDashboardBloc.selectedSector;
    _selectedIndicator = _paymentsDashboardBloc.selectedIndicator;
    _paymentsListRequest = PaymentsListRequest(
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
        _paymentsListRequest = _paymentsListRequest.copyWith(
            pageNo: _paymentsListRequest.pageNo! + 1);
        _getPayments(request: _paymentsListRequest);
      }
    });
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<PaymentsDashboardBloc, PaymentsDashboardState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetPaymentsSuccessState) {
          isPaginationLoad = false;
          _payments = state.payments;
        } else if (state is GetPaymentsFailState) {
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
        } else if (state is SearchPaymentsState) {
          _searchPayments(state.keyword);
        } else if (state is GetPaymentsChartSuccessState) {
          _paymentsChart = state.paymentsChart;
        } else if (state is GetPaymentsChartFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getPaymentsWithFilterOptions();
        } else if (state is SelectIndicatorState) {
          _selectedIndicator = state.indicator;
        }
      },
      builder: (context, state) {
        return SharedDashboardScreen(
          title: S.of(context).paymentsDashboard,
          searchLabel: S.of(context).searchPayment,
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
    return _paymentsChart != null
        ? PaymentsDashboardWidget(
            paymentsChart: _paymentsChart!,
          )
        : Container();
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _payments.isEmpty ? _buildEmptyScreen() : _buildPayments();
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyDataWidget(),
    );
  }

  Expanded _buildPayments() {
    return Expanded(
      child: ListView.builder(
        itemCount: _payments.length,
        controller: _scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: PaymentListCardWidget(
              payment: _payments[index],
            ),
          );
        },
      ),
    );
  }

  //Helper Functions//
  void init() {
    _getPayments(request: _paymentsListRequest);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initDashboard() {
    _paymentsDashboardBloc.add(GetPaymentsChartEvent(
      phaseId: _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
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

  void _getPayments({
    required PaymentsListRequest request,
  }) {
    _paymentsDashboardBloc.add(GetPaymentsEvent(request: request));
  }

  void _getPhases() {
    _paymentsDashboardBloc.add(const GetPhasesEvent());
  }

  void _getSectors() {
    _paymentsDashboardBloc.add(const GetSectorsEvent());
  }

  void _searchEvent(String keyword) {
    _paymentsDashboardBloc.add(SearchPaymentsEvent(keyword: keyword));
  }

  void _searchPayments(String keyword) {
    _paymentsListRequest =
        _paymentsListRequest.copyWith(keyword: keyword, pageNo: 1);
    _getPayments(request: _paymentsListRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchPayments("");
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
    _paymentsDashboardBloc.add(SelectSortEvent(sort: sort));
  }

  void _openFilterBottomSheet() {
    openDashboardFilterBottomSheet(
      context: context,
      height: 300,
      phases: _paymentsDashboardBloc.phases,
      selectedPhase: _selectedPhase,
      sectors: _paymentsDashboardBloc.sectors,
      selectedSector: _selectedSector,
      selectedIndicator: _selectedIndicator,
      indicators: [
        Indicator(id: 1, name: "Green", color: ColorSchema.barGreen),
        Indicator(id: 3, name: "Red", color: Colors.red),
      ],
      isHaveIndicator: true,
      onTap: (phase, sector, indicator) {
        _paymentsDashboardBloc.add(SelectPhaseEvent(phase: phase));
        _paymentsDashboardBloc.add(SelectSectorEvent(sector: sector));
        _paymentsDashboardBloc.add(SelectIndicatorEvent(indicator: indicator));
        _paymentsDashboardBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getPaymentsWithFilterOptions() {
    _paymentsListRequest = _paymentsListRequest.copyWith(
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
      _getPayments(
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
    _getPayments(request: _paymentsListRequest);
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
