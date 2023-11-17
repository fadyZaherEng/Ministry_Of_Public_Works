import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/milestones/request/milestones_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/milestones/milestone.dart';
import 'package:aim/src/presentation/bloc/milestones/milestones_bloc.dart';
import 'package:aim/src/presentation/screens/milestones/widget/milestone_card_widget.dart';
import 'package:aim/src/presentation/screens/milestones/widget/skeleton_milestone_card_widget.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_attachments_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_risks_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MilestonesScreen extends BaseStatefulWidget {
  const MilestonesScreen({Key? key}) : super(key: key);

  @override
  BaseState<MilestonesScreen> baseCreateState() => _MilestonesScreenState();
}

class _MilestonesScreenState extends BaseState<MilestonesScreen> {
  MilestonesBloc get _milestonesBloc =>
      BlocProvider.of<MilestonesBloc>(context);
  final TextEditingController _searchTextEditingController =
      TextEditingController();
  List<Milestone> _milestones = [];
  bool _isFilterSelected = true;
  MilestonesRequest _milestonesRequest = MilestonesRequest();
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
    return BlocConsumer<MilestonesBloc, MilestonesState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetMilestonesSuccessState) {
          isPaginationLoad = false;
          _milestones = state.milestones;
        } else if (state is GetMilestonesFailState) {
        } else if (state is SearchMilestonesState) {
          _searchMilestones(state.keyword);
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
          _getMilestonesWithFilterOptions();
        } else if (state is GetMilestoneByIdSuccessState) {
          if (state.milestone.attachments?.isNotEmpty ?? true) {
            openAttachmentsBottomSheet(
                context: context,
                height: 300,
                attachments: state.milestone.attachments ?? [],
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
        } else if (state is GetMilestoneByIdFailState) {
        } else if (state is GetProjectTypesSuccessState) {
          _openFilterBottomSheet();
        } else if (state is GetProjectTypesFailState) {
        } else if (state is SelectProjectTypeState) {
          _selectedProjectType = state.projectType;
        }
      },
      builder: (context, state) {
        return SharedScreen(
          title: S.of(context).milestone,
          searchLabel: S.of(context).searchMilestone,
          isFilterSelected: _isFilterSelected,
          searchTextEditingController: _searchTextEditingController,
          onChange: _searchEvent,
          onSubmit: _searchEvent,
          clearActionButton: _clearSearch,
          onFilterTab: _onFilterTab,
          onSortTab: _onSortTab,
          isHaveBackButton: true,
          content: state is ShowSkeletonState
              ? const SkeletonMilestoneCardWidget()
              : _buildScreenContent(),
        );
      },
    );
  }

  //Helper Widget//
  Widget _buildScreenContent() {
    return _milestones.isEmpty ? _buildEmptyScreen() : _buildMilestones();
  }

  Expanded _buildMilestones() {
    return Expanded(
      child: ListView.builder(
        itemCount: _milestones.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: MilestoneCardWidget(
              milestone: _milestones[index],
              onDownloadPressed: () {
                _milestonesBloc.add(GetMilestoneByIdEvent(
                  milestoneId: _milestones[index].id ?? "",
                ));
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

  //Helper Functions//
  void init() {
    _selectedSort = _milestonesBloc.selectedSort;
    _selectedPhase = _milestonesBloc.selectedPhase;
    _selectedStatus = _milestonesBloc.selectedStatus;
    _selectedProjectType = _milestonesBloc.selectedProjectType;
    _selectedFromDate = _milestonesBloc.selectedFromDatetime;
    _selectedToDate = _milestonesBloc.selectedToDatetime;
    _milestonesRequest = MilestonesRequest(
      keyword: "",
      fromDate: formatFromDate(_selectedFromDate),
      toDate: formatToDate(_selectedToDate),
      projectPhaseId: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      sector: _selectedProjectType.id.toString() == "0"
          ? ""
          : _selectedProjectType.id.toString(),
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      status: _selectedStatus.id ?? 0,
      pageNo: 1,
      pageSize: pageSize,
      isEnglishLanguage: false,
    );
    _getMilestones(request: _milestonesRequest);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          isPaginationLoad == false) {
        isPaginationLoad = true;
        _milestonesRequest =
            _milestonesRequest.copyWith(pageNo: _milestonesRequest.pageNo! + 1);
        _getMilestones(request: _milestonesRequest);
      }
    });
  }

  void _getMilestones({required MilestonesRequest request}) {
    _milestonesBloc.add(GetMilestonesEvent(request: request));
  }

  void _getPhases() {
    _milestonesBloc.add(const GetPhasesEvent());
  }

  void _getStatus() {
    _milestonesBloc.add(const GetStatusEvent());
  }

  void _searchEvent(String keyword) {
    _milestonesBloc.add(SearchMilestonesEvent(keyword: keyword));
  }

  void _searchMilestones(String keyword) {
    _milestonesRequest =
        _milestonesRequest.copyWith(keyword: keyword, pageNo: 1);
    _getMilestones(request: _milestonesRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchMilestones("");
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
    _milestonesBloc.add(SelectSortEvent(sort: sort));
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _milestonesRequest = _milestonesRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getMilestones(request: _milestonesRequest);
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
      phases: _milestonesBloc.phases,
      selectedPhase: _selectedPhase,
      status: _milestonesBloc.status,
      selectedStatus: _selectedStatus,
      projectTypes: _milestonesBloc.projectTypes,
      selectedProjectType: _selectedProjectType,
      selectedFromDate: _selectedFromDate,
      selectedToDate: _selectedToDate,
      dateTitle: S.of(context).actualFinishDateMilestone,
      onTap: (phase, status, projectType, fromDate, toDate) {
        _milestonesBloc.add(SelectFromDateEvent(fromDateTime: fromDate));
        _milestonesBloc.add(SelectToDateEvent(toDateTime: toDate));
        _milestonesBloc.add(SelectPhaseEvent(phase: phase));
        _milestonesBloc.add(SelectStatusEvent(status: status));
        _milestonesBloc.add(SelectProjectTypeEvent(projectType: projectType));
        _milestonesBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getMilestonesWithFilterOptions() {
    _milestonesRequest = _milestonesRequest.copyWith(
        projectPhaseId: _selectedPhase.id.toString() == "0"
            ? ""
            : _selectedPhase.id.toString(),
        sector: _selectedProjectType.id.toString() == "0"
            ? ""
            : _selectedProjectType.id.toString(),
        fromDate: formatFromDate(_selectedFromDate),
        toDate: formatToDate(_selectedToDate),
        status: _selectedStatus.id ?? 0,
        pageNo: 1);
    _getMilestones(
      request: _milestonesRequest,
    );
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  void _getProjectTypes() {
    _milestonesBloc.add(const GetProjectTypesEvent());
  }
}
