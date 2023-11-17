import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/presentation/bloc/issues/issues_bloc.dart';
import 'package:aim/src/presentation/screens/issues/widget/issue_card_widget.dart';
import 'package:aim/src/presentation/screens/issues/widget/skeleton_issues_card_widget.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_attachments_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_risks_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IssuesScreen extends BaseStatefulWidget {
  const IssuesScreen({Key? key}) : super(key: key);

  @override
  BaseState<IssuesScreen> baseCreateState() => _IssuesScreenState();
}

class _IssuesScreenState extends BaseState<IssuesScreen> {
  IssuesBloc get _issuesBloc => BlocProvider.of<IssuesBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  List<Issue> _issues = [];
  bool _isFilterSelected = true;
  IssuesRequest _issuesRequest = IssuesRequest();
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
    return BlocConsumer<IssuesBloc, IssuesState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetIssuesSuccessState) {
          isPaginationLoad = false;
          _issues = state.issues;
        } else if (state is GetIssuesFailState) {
        } else if (state is SearchIssuesState) {
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
          _getIssuesWithFilterOptions();
        } else if (state is GetIssueByIdSuccessState) {
          if (state.issue.attachments?.isNotEmpty ?? true) {
            openAttachmentsBottomSheet(
                context: context,
                height: 300,
                attachments: state.issue.attachments ?? [],
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
        } else if (state is GetIssueByIdFailState) {
        } else if (state is GetProjectTypesSuccessState) {
          _openFilterBottomSheet();
        } else if (state is GetProjectTypesFailState) {
        } else if (state is SelectProjectTypeState) {
          _selectedProjectType = state.projectType;
        }
      },
      builder: (context, state) {
        return SharedScreen(
          title: S.of(context).issues,
          searchLabel: S.of(context).searchIssue,
          isFilterSelected: _isFilterSelected,
          searchTextEditingController: _searchTextEditingController,
          onChange: _searchEvent,
          onSubmit: _searchEvent,
          clearActionButton: _clearSearch,
          onFilterTab: _onFilterTab,
          onSortTab: _onSortTab,
          isHaveBackButton: true,
          content: state is ShowSkeletonState
              ? const SkeletonIssuesCardWidget()
              : _buildScreenContent(),
        );
      },
    );
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _issues.isEmpty ? _buildEmptyScreen() : _buildIssues();
  }

  Expanded _buildIssues() {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: _issues.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: IssueCardWidget(
              issue: _issues[index],
              onDownloadPressed: () {
                _issuesBloc.add(
                  GetIssueByIdEvent(
                    issueId: _issues[index].id ?? "",
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
    _selectedSort = _issuesBloc.selectedSort;
    _selectedPhase = _issuesBloc.selectedPhase;
    _selectedStatus = _issuesBloc.selectedStatus;
    _selectedProjectType = _issuesBloc.selectedProjectType;
    _selectedFromDate = _issuesBloc.selectedFromDatetime;
    _selectedToDate = _issuesBloc.selectedToDatetime;
    _issuesRequest = IssuesRequest(
      keyword: "",
      fromDate: formatFromDate(_selectedFromDate),
      toDate: formatToDate(_selectedToDate),
      projectPhaseId: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      status: _selectedStatus.id ?? 0,
      pageSize: pageSize,
      sector: _selectedProjectType.id.toString() == "0"
          ? ""
          : _selectedProjectType.id.toString(),
      isEnglishLanguage: false,
    );
    _getIssues(request: _issuesRequest);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          isPaginationLoad == false) {
        isPaginationLoad = true;
        _issuesRequest =
            _issuesRequest.copyWith(pageNo: _issuesRequest.pageNo! + 1);
        _getIssues(request: _issuesRequest);
      }
    });
  }

  void _getIssues({required IssuesRequest request}) {
    _issuesBloc.add(GetIssuesEvent(request: request));
  }

  void _getPhases() {
    _issuesBloc.add(const GetPhasesEvent());
  }

  void _getStatus() {
    _issuesBloc.add(const GetStatusEvent());
  }

  void _searchEvent(String keyword) {
    _issuesBloc.add(SearchIssuesEvent(keyword: keyword));
  }

  void _searchIssues(String keyword) {
    _issuesRequest = _issuesRequest.copyWith(keyword: keyword, pageNo: 1);
    _getIssues(request: _issuesRequest);
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
    _issuesBloc.add(SelectSortEvent(sort: sort));
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _issuesRequest = _issuesRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getIssues(request: _issuesRequest);
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
      phases: _issuesBloc.phases,
      selectedPhase: _selectedPhase,
      status: _issuesBloc.status,
      selectedStatus: _selectedStatus,
      projectTypes: _issuesBloc.projectTypes,
      selectedProjectType: _selectedProjectType,
      selectedFromDate: _selectedFromDate,
      selectedToDate: _selectedToDate,
      dateTitle: S.of(context).date,
      onTap: (phase, status, projectType, fromDate, toDate) {
        _issuesBloc.add(SelectFromDateEvent(fromDateTime: fromDate));
        _issuesBloc.add(SelectToDateEvent(toDateTime: toDate));
        _issuesBloc.add(SelectPhaseEvent(phase: phase));
        _issuesBloc.add(SelectStatusEvent(status: status));
        _issuesBloc.add(SelectProjectTypeEvent(projectType: projectType));
        _issuesBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getIssuesWithFilterOptions() {
    _issuesRequest = _issuesRequest.copyWith(
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
    _getIssues(
      request: _issuesRequest,
    );
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  void _getProjectTypes() {
    _issuesBloc.add(const GetProjectTypesEvent());
  }
}
