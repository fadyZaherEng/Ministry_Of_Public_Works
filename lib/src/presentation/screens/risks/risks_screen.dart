import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:aim/src/presentation/bloc/risks/risks_bloc.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_attachments_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_risks_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/risks/widgets/risk_card_widget.dart';
import 'package:aim/src/presentation/screens/risks/widgets/skeleton_risks_card_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RisksScreen extends BaseStatefulWidget {
  const RisksScreen({Key? key}) : super(key: key);

  @override
  BaseState<RisksScreen> baseCreateState() => _RisksScreenState();
}

class _RisksScreenState extends BaseState<RisksScreen> {
  RisksBloc get _risksBloc => BlocProvider.of<RisksBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  bool _isFilterSelected = true;
  RisksRequest _risksRequest = RisksRequest();
  Sort _selectedSort = sorts.first;
  List<Risk> _risks = [];
  Phase _selectedPhase = const Phase();
  Status _selectedStatus = const Status();
  ProjectType _selectedProjectType = const ProjectType();
  DateTime? _selectedFromDate;
  DateTime? _selectedToDate;
  ScrollController scrollController = ScrollController();
  bool isPaginationLoad = false;
  String _language = "en";

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
    return BlocConsumer<RisksBloc, RisksState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetRisksSuccessState) {
          isPaginationLoad = false;
          _risks = state.risks;
          _language = state.language;
        } else if (state is GetRisksFailState) {
        } else if (state is SearchRisksState) {
          _searchRisks(state.keyword);
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
          _getRisksWithFilterOptions();
        } else if (state is GetProjectTypesSuccessState) {
          _openFilterBottomSheet();
        } else if (state is GetProjectTypesFailState) {
        } else if (state is SelectProjectTypeState) {
          _selectedProjectType = state.projectType;
        } else if (state is GetRiskByIdSuccessState) {
          if (state.risk.attachments?.isNotEmpty ?? true) {
            openAttachmentsBottomSheet(
                context: context,
                height: 300,
                attachments: state.risk.attachments ?? [],
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
        } else if (state is GetRiskByIdFailState) {}
      },
      builder: (context, state) {
        return SharedScreen(
          title: S.of(context).risks,
          searchLabel: S.of(context).searchRisk,
          searchTextEditingController: _searchTextEditingController,
          isFilterSelected: _isFilterSelected,
          onChange: _searchEvent,
          onSubmit: _searchEvent,
          clearActionButton: _clearSearch,
          onFilterTab: _onFilterTab,
          onSortTab: _onSortTab,
          isHaveBackButton: true,
          content: state is ShowSkeletonState
              ? const SkeletonRisksCardWidget()
              : _buildScreenContent(),
        );
      },
    );
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
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: RiskCardWidget(
              risk: _risks[index],
              languageCode: _language,
              onDownloadPressed: () {
                _risksBloc.add(GetRiskByIdEvent(
                  riskId: _risks[index].id ?? "",
                ));
              },
            ),
          );
        },
      ),
    );
  }

  //Helper Functions//
  void init() {
    _selectedSort = _risksBloc.selectedSort;
    _selectedPhase = _risksBloc.selectedPhase;
    _selectedStatus = _risksBloc.selectedStatus;
    _selectedProjectType = _risksBloc.selectedProjectType;
    _selectedFromDate = _risksBloc.selectedFromDatetime;
    _selectedToDate = _risksBloc.selectedToDatetime;
    _risksRequest = RisksRequest(
      keyword: "",
      toDate: formatToDate(_selectedToDate),
      fromDate: formatFromDate(_selectedFromDate),
      projectPhaseId: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      status: _selectedStatus.id ?? 0,
      sector: _selectedProjectType.id.toString() == "0"
          ? ""
          : _selectedProjectType.id.toString(),
      pageSize: pageSize,
      isEnglishLanguage: false,
    );
    _getRisks(request: _risksRequest);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          isPaginationLoad == false) {
        isPaginationLoad = true;
        _risksRequest =
            _risksRequest.copyWith(pageNo: _risksRequest.pageNo! + 1);
        _getRisks(request: _risksRequest);
      }
    });
  }

  void _getRisks({required RisksRequest request}) {
    _risksBloc.add(GetRisksEvent(request: request));
  }

  void _getPhases() {
    _risksBloc.add(const GetPhasesEvent());
  }

  void _getStatus() {
    _risksBloc.add(const GetStatusEvent());
  }

  void _searchEvent(String keyword) {
    _risksBloc.add(SearchRisksEvent(keyword: keyword));
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

  void _openFilterBottomSheet() {
    openRisksFilterBottomSheet(
      context: context,
      height: 420,
      phases: _risksBloc.phases,
      selectedPhase: _selectedPhase,
      status: _risksBloc.status,
      selectedStatus: _selectedStatus,
      projectTypes: _risksBloc.projectTypes,
      selectedProjectType: _selectedProjectType,
      selectedFromDate: _selectedFromDate,
      selectedToDate: _selectedToDate,
      dateTitle: S.of(context).date,
      onTap: (phase, status, projectType, fromDate, toDate) {
        _risksBloc.add(SelectFromDateEvent(fromDateTime: fromDate));
        _risksBloc.add(SelectToDateEvent(toDateTime: toDate));
        _risksBloc.add(SelectPhaseEvent(phase: phase));
        _risksBloc.add(SelectStatusEvent(status: status));
        _risksBloc.add(SelectProjectTypeEvent(projectType: projectType));
        _risksBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getRisksWithFilterOptions() {
    _risksRequest = _risksRequest.copyWith(
      status: _selectedStatus.id,
      projectPhaseId: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      sector: _selectedProjectType.id.toString() == "0"
          ? ""
          : _selectedProjectType.id.toString(),
      fromDate: formatFromDate(_selectedFromDate),
      toDate: formatToDate(_selectedToDate),
      pageNo: 1,
    );
    _getRisks(
      request: _risksRequest,
    );
  }

  void _selectSortEvent(Sort sort) {
    _risksBloc.add(SelectSortEvent(sort: sort));
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

  void _getProjectTypes() {
    _risksBloc.add(const GetProjectTypesEvent());
  }
}
