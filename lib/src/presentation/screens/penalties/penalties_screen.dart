import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_request.dart';
import 'package:aim/src/domain/entities/filter/penalty_type.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/penalties/penalty.dart';
import 'package:aim/src/presentation/bloc/penalties/penalties_bloc.dart';
import 'package:aim/src/presentation/screens/issues/widget/skeleton_issues_card_widget.dart';
import 'package:aim/src/presentation/screens/penalties/utils/open_penalties_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/penalties/widgets/penalties_card_widget.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_attachments_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PenaltiesScreen extends BaseStatefulWidget {
  const PenaltiesScreen({Key? key}) : super(key: key);

  @override
  BaseState<PenaltiesScreen> baseCreateState() => _PenaltiesScreenState();
}

class _PenaltiesScreenState extends BaseState<PenaltiesScreen> {
  PenaltiesBloc get _penaltiesBloc => BlocProvider.of<PenaltiesBloc>(context);

  final TextEditingController _searchTextEditingController =
      TextEditingController();
  List<Penalty> _penalties = [];
  bool _isFilterSelected = true;
  PenaltiesRequest _penaltiesRequest = PenaltiesRequest();
  Sort _selectedSort = sorts.first;
  PenaltyType _selectedPenaltyType = const PenaltyType();
  Phase _selectedPhase = const Phase();
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
    return BlocConsumer<PenaltiesBloc, PenaltiesState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetPenaltiesSuccessState) {
          isPaginationLoad = false;
          _penalties = state.penalties;
        } else if (state is GetPenaltiesSuccessState) {
        } else if (state is SearchPenaltiesState) {
          _searchPenalties(state.keyword);
        } else if (state is SelectSortState) {
          _selectSort(state.sort);
        } else if (state is GetPenaltyTypesSuccessState) {
          _penaltiesBloc.add(const GetPhasesEvent());
        } else if (state is GetPenaltyTypesFailState) {
        } else if (state is SelectPenaltyTypeState) {
          _selectedPenaltyType = state.penaltyType;
        } else if (state is SelectFromDateState) {
          _selectedFromDate = state.fromDate;
        } else if (state is SelectToDateState) {
          _selectedToDate = state.toDate;
        } else if (state is SelectPhaseState) {
          _selectedPhase = state.phase;
        } else if (state is GetProjectTypesSuccessState) {
          _openFilterBottomSheet();
        } else if (state is GetProjectTypesFailState) {
        } else if (state is SelectProjectTypeState) {
          _selectedProjectType = state.projectType;
        } else if (state is GetPhasesSuccessState) {
          _penaltiesBloc.add(const GetProjectTypesEvent());
        } else if (state is GetPhasesFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getPenaltiesWithFilterOptions();
        } else if (state is GetPenaltyByIdSuccessState) {
          if (state.penalty.attachments?.isNotEmpty ?? true) {
            openAttachmentsBottomSheet(
                context: context,
                height: 300,
                attachments: state.penalty.attachments ?? [],
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
        } else if (state is GetPenaltyByIdFailState) {}
      },
      builder: (context, state) {
        return SharedScreen(
          title: S.of(context).penalties,
          searchLabel: S.of(context).searchPenalties,
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
    return _penalties.isEmpty ? _buildEmptyScreen() : _buildPenalties();
  }

  Expanded _buildPenalties() {
    return Expanded(
      child: ListView.builder(
        itemCount: _penalties.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: PenaltiesCardWidget(
              penalty: _penalties[index],
              onDownloadPressed: () {
                _penaltiesBloc.add(
                  GetPenaltyByIdEvent(
                    penaltyId: _penalties[index].id ?? "",
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
    _selectedSort = _penaltiesBloc.selectedSort;
    _selectedPenaltyType = _penaltiesBloc.selectedPenaltyType;
    _selectedFromDate = _penaltiesBloc.selectedFromDatetime;
    _selectedToDate = _penaltiesBloc.selectedToDatetime;
    _selectedPhase = _penaltiesBloc.selectedPhase;
    _selectedProjectType = _penaltiesBloc.selectedProjectType;

    _penaltiesRequest = PenaltiesRequest(
      keyword: "",
      fromDate: formatFromDate(_selectedFromDate),
      toDate: formatToDate(_selectedToDate),
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      pageSize: pageSize,
      penaltyType: _selectedPenaltyType.name,
      sector: _selectedProjectType.id ?? "",
      isEnglishLanguage: false,
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
    );
    _getPenalties(request: _penaltiesRequest);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          isPaginationLoad == false) {
        isPaginationLoad = true;
        _penaltiesRequest =
            _penaltiesRequest.copyWith(pageNo: _penaltiesRequest.pageNo! + 1);
        _getPenalties(request: _penaltiesRequest);
      }
    });
  }

  void _getPenalties({required PenaltiesRequest request}) {
    _penaltiesBloc.add(GetPenaltiesEvent(request: request));
  }

  void _getPenaltyTypes() {
    _penaltiesBloc.add(const GetPenaltyTypesEvent());
  }

  void _searchEvent(String keyword) {
    _penaltiesBloc.add(SearchPenaltiesEvent(keyword: keyword));
  }

  void _searchPenalties(String keyword) {
    _penaltiesRequest = _penaltiesRequest.copyWith(keyword: keyword, pageNo: 1);
    _getPenalties(request: _penaltiesRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchPenalties("");
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
    _penaltiesBloc.add(SelectSortEvent(sort: sort));
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _penaltiesRequest = _penaltiesRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getPenalties(request: _penaltiesRequest);
  }

  void _onFilterTab() {
    setState(() {
      _isFilterSelected = true;
    });
    _getPenaltyTypes();
  }

  void _openFilterBottomSheet() {
    openPenaltiesFilterBottomSheet(
      context: context,
      height: 350,
      penaltyTypes: _penaltiesBloc.penaltyTypes,
      selectedPenaltyType: _selectedPenaltyType,
      selectedFromDate: _selectedFromDate,
      selectedToDate: _selectedToDate,
      selectedPhase: _selectedPhase,
      phases: _penaltiesBloc.phases,
      projectTypes: _penaltiesBloc.projectTypes,
      selectedProjectType: _selectedProjectType,
      onTap: (penaltyType, projectType, phase, fromDate, toDate) {
        _penaltiesBloc.add(SelectFromDateEvent(fromDateTime: fromDate));
        _penaltiesBloc.add(SelectToDateEvent(toDateTime: toDate));
        _penaltiesBloc.add(SelectPenaltyTypeEvent(penaltyType: penaltyType));
        _penaltiesBloc.add(SelectPhaseEvent(phase: phase));
        _penaltiesBloc.add(SelectProjectTypeEvent(projectType: projectType));
        _penaltiesBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getPenaltiesWithFilterOptions() {
    _penaltiesRequest = _penaltiesRequest.copyWith(
      fromDate: formatFromDate(_selectedFromDate),
      toDate: formatToDate(_selectedToDate),
      penaltyType: _selectedPenaltyType.id,
      sector: _selectedProjectType.id ?? "",
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      pageNo: 1,
    );
    _getPenalties(
      request: _penaltiesRequest,
    );
  }

  void _navigateBack() {
    Navigator.pop(context);
  }
}
