import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/payments/payment.dart';
import 'package:aim/src/presentation/bloc/payments/payments_bloc.dart';
import 'package:aim/src/presentation/screens/payments/widgets/payment_card_widget.dart';
import 'package:aim/src/presentation/screens/payments/widgets/skeleton_payment_card_widget.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_attachments_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_risks_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentsScreen extends BaseStatefulWidget {
  final bool showBackButton;

  const PaymentsScreen({
    Key? key,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  BaseState<PaymentsScreen> baseCreateState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends BaseState<PaymentsScreen> {
  PaymentsBloc get _paymentsBloc => BlocProvider.of<PaymentsBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  List<Payment> _payments = [];
  bool _isFilterSelected = true;
  PaymentsRequest _paymentsRequest = PaymentsRequest();
  Sort _selectedSort = sorts.first;
  Phase _selectedPhase = const Phase();
  Status _selectedStatus = const Status();
  ProjectType _selectedProjectType = const ProjectType();
  DateTime? _selectedFromDate;
  DateTime? _selectedToDate;
  ScrollController scrollController = ScrollController();
  bool isPaginationLoad = false;

  @override
  void initState() {
    super.initState();
    init();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<PaymentsBloc, PaymentsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetPaymentsSuccessState) {
          isPaginationLoad = false;
          _payments = state.payments;
        } else if (state is GetPaymentsFailState) {
        } else if (state is SearchPaymentsState) {
          _searchIssues(state.keyword);
        } else if (state is SelectSortState) {
          _selectSort(state.sort);
        } else if (state is GetPhasesSuccessState) {
          _getStatus();
        } else if (state is GetPhasesFailState) {
        } else if (state is GetStatusSuccessState) {
          _getProjectTypes();
        } else if (state is GetStatusFailState) {
        } else if (state is SelectPhaseState) {
          _selectedPhase = state.phase;
        } else if (state is SelectStatusState) {
          _selectedStatus = state.status;
        } else if (state is SelectFromDateState) {
          _selectedFromDate = state.fromDate;
        } else if (state is SelectToDateState) {
          _selectedToDate = state.toDate;
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getPaymentsWithFilterOptions();
        } else if (state is GetPaymentByIdSuccessState) {
          if (state.payment.attachments?.isNotEmpty ?? true) {
            openAttachmentsBottomSheet(
                context: context,
                height: 300,
                attachments: state.payment.attachments ?? [],
                selectedAttachments: (attachments) async {
                  if (await requestPermission()) {
                    downloadAttachments(attachments);
                  } else {
                    showToastMessage(S.current.permissionDenied);
                  }
                });
          } else {
            showToastMessage(S.of(context).attachmentsError);
          }
        } else if (state is GetPaymentByIdFailState) {
        } else if (state is GetProjectTypesSuccessState) {
          _openFilterBottomSheet();
        } else if (state is GetProjectTypesFailState) {
        } else if (state is SelectProjectTypeState) {
          _selectedProjectType = state.projectType;
        }
      },
      builder: (context, state) {
        return SharedScreen(
          title: S.of(context).payments,
          searchLabel: S.of(context).searchPayment,
          searchTextEditingController: _searchTextEditingController,
          isFilterSelected: _isFilterSelected,
          onChange: _searchEvent,
          onSubmit: _searchEvent,
          clearActionButton: _clearSearch,
          onFilterTab: _onFilterTab,
          onSortTab: _onSortTab,
          isHaveBackButton: widget.showBackButton,
          content: state is ShowSkeletonState
              ? const SkeletonPaymentCardWidget()
              : _buildScreenContent(),
        );
      },
    );
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _payments.isEmpty ? _buildEmptyScreen() : _buildPayments();
  }

  Expanded _buildPayments() {
    return Expanded(
      child: ListView.builder(
        itemCount: _payments.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: PaymentCardWidget(
              payment: _payments[index],
              onDownloadPressed: () {
                _paymentsBloc.add(
                  GetPaymentByIdEvent(
                    paymentId: _payments[index].id ?? "",
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Expanded _buildEmptyScreen() {
    return const Expanded(
      child: EmptyDataWidget(),
    );
  }

  //Helper Function//
  void init() {
    _selectedSort = _paymentsBloc.selectedSort;
    _selectedPhase = _paymentsBloc.selectedPhase;
    _selectedStatus = _paymentsBloc.selectedStatus;
    _selectedFromDate = _paymentsBloc.selectedFromDatetime;
    _selectedToDate = _paymentsBloc.selectedToDatetime;

    _paymentsRequest = PaymentsRequest(
      keyword: "",
      fromDate: _selectedFromDate == null ? "" : formatFromDate(_selectedFromDate),
      toDate: _selectedToDate == null ? "" : formatToDate(_selectedToDate),
      projectPhaseId: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      status: (_selectedStatus.id ?? 0) == 0
          ? ""
          : (_selectedStatus.id ?? 0).toString(),
      sector: _selectedProjectType.id.toString() == "0"
          ? ""
          : _selectedProjectType.id.toString(),
      pageSize: pageSize,
      isEnglishLanguage: false,
    );
    _getPayments(request: _paymentsRequest);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          isPaginationLoad == false) {
        isPaginationLoad = true;
        _paymentsRequest =
            _paymentsRequest.copyWith(pageNo: _paymentsRequest.pageNo! + 1);
        _getPayments(request: _paymentsRequest);
      }
    });
  }

  void _getPayments({required PaymentsRequest request}) {
    _paymentsBloc.add(GetPaymentsEvent(request: request));
  }

  void _getPhases() {
    _paymentsBloc.add(const GetPhasesEvent());
  }

  void _getStatus() {
    _paymentsBloc.add(const GetStatusEvent());
  }

  void _searchEvent(String keyword) {
    _paymentsBloc.add(SearchPaymentsEvent(keyword: keyword));
  }

  void _searchIssues(String keyword) {
    _paymentsRequest = _paymentsRequest.copyWith(keyword: keyword, pageNo: 1);
    _getPayments(request: _paymentsRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchIssues("");
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
    _paymentsBloc.add(SelectSortEvent(sort: sort));
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _paymentsRequest = _paymentsRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getPayments(request: _paymentsRequest);
  }

  void _onFilterTab() {
    setState(() {
      _isFilterSelected = true;
    });
    _getPhases();
  }

  void _openFilterBottomSheet() {
    openRisksFilterBottomSheet(
      context: context,
      height: 420,
      phases: _paymentsBloc.phases,
      selectedPhase: _selectedPhase,
      status: _paymentsBloc.status,
      selectedStatus: _selectedStatus,
      projectTypes: _paymentsBloc.projectTypes,
      selectedProjectType: _selectedProjectType,
      selectedFromDate: _selectedFromDate,
      selectedToDate: _selectedToDate,
      dateTitle: S.of(context).actualPaymentDateTitle,
      onTap: (phase, status, projectType, fromDate, toDate) {
        _paymentsBloc.add(SelectFromDateEvent(fromDateTime: fromDate));
        _paymentsBloc.add(SelectToDateEvent(toDateTime: toDate));
        _paymentsBloc.add(SelectPhaseEvent(phase: phase));
        _paymentsBloc.add(SelectStatusEvent(status: status));
        _paymentsBloc.add(SelectProjectTypeEvent(projectType: projectType));
        _paymentsBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getPaymentsWithFilterOptions() {
    _paymentsRequest = _paymentsRequest.copyWith(
        status: (_selectedStatus.id ?? 0) == 0
            ? ""
            : (_selectedStatus.id ?? 0).toString(),
        projectPhaseId: _selectedPhase.id.toString() == "0"
            ? ""
            : _selectedPhase.id.toString(),
        sector: _selectedProjectType.id.toString() == "0"
            ? ""
            : _selectedProjectType.id.toString(),
        fromDate: _selectedFromDate == null ? "" : formatFromDate(_selectedFromDate),
        toDate: _selectedToDate == null ? "" : formatToDate(_selectedToDate),
        pageNo: 1);
    _getPayments(
      request: _paymentsRequest,
    );
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  void _getProjectTypes() {
    _paymentsBloc.add(const GetProjectTypesEvent());
  }
}
