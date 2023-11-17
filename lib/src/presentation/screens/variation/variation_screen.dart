import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:aim/src/presentation/bloc/variation/variation_bloc.dart';
import 'package:aim/src/presentation/screens/issues/widget/skeleton_issues_card_widget.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_attachments_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/variation/utils/open_variations_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/variation/widgets/variation_card_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VariationScreen extends BaseStatefulWidget {
  const VariationScreen({Key? key}) : super(key: key);

  @override
  BaseState<VariationScreen> baseCreateState() => _VariationScreenState();
}

class _VariationScreenState extends BaseState<VariationScreen> {
  VariationBloc get _variationBloc => BlocProvider.of<VariationBloc>(context);

  final TextEditingController _searchTextEditingController =
      TextEditingController();
  List<Variation> _variations = [];
  bool _isFilterSelected = true;
  VariationsRequest _variationsRequest = VariationsRequest();
  Phase _selectedPhase = const Phase();
  Sort _selectedSort = sorts.first;
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
    return BlocConsumer<VariationBloc, VariationState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetVariationsSuccessState) {
          isPaginationLoad = false;
          _variations = state.variations;
        } else if (state is GetVariationsFailState) {
        } else if (state is GetPhasesSuccessState) {
          _variationBloc.add(const GetProjectTypesEvent());
        } else if (state is GetPhasesFailState) {
        } else if (state is SelectPhaseState) {
          _selectedPhase = state.phase;
        } else if (state is SearchVariationsState) {
          _searchVariations(state.keyword);
        } else if (state is SelectSortState) {
          _selectSort(state.sort);
        } else if (state is GetStatusSuccessState) {
          _variationBloc.add(const GetPhasesEvent());
        } else if (state is GetStatusFailState) {
        } else if (state is SelectStatusState) {
          _selectedStatus = state.status;
        } else if (state is SelectFromDateState) {
          _selectedFromDate = state.fromDate;
        } else if (state is SelectToDateState) {
          _selectedToDate = state.toDate;
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getVariationsWithFilterOptions();
        } else if (state is GetVariationByIdSuccessState) {
          if (state.variation.attachments?.isNotEmpty ?? true) {
            openAttachmentsBottomSheet(
                context: context,
                height: 300,
                attachments: state.variation.attachments ?? [],
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
        } else if (state is GetVariationByIdFailState) {}
        else if(state is GetProjectTypesSuccessState){
          _openFilterBottomSheet();
        } else if(state is GetProjectTypesFailState){

        } else if(state is SelectProjectTypeState){
          _selectedProjectType = state.projectType;
        }
      },
      builder: (context, state) {
        return SharedScreen(
          title: S.of(context).variationOrdersTitle,
          searchLabel: S.of(context).searchVariation,
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
    return _variations.isEmpty ? _buildEmptyScreen() : _buildVariations();
  }

  Expanded _buildVariations() {
    return Expanded(
      child: ListView.builder(
        itemCount: _variations.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: VariationCardWidget(
              variation: _variations[index],
              onDownloadPressed: () {
                _variationBloc.add(
                  GetVariationByIdEvent(
                    variationId: _variations[index].id ?? "",
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
    _selectedPhase = _variationBloc.selectedPhase;
    _selectedSort = _variationBloc.selectedSort;
    _selectedStatus = _variationBloc.selectedStatus;
    _selectedProjectType = _variationBloc.selectedProjectType;
    _selectedFromDate = _variationBloc.selectedFromDatetime;
    _selectedToDate = _variationBloc.selectedToDatetime;
    _variationsRequest = VariationsRequest(
      keyword: "",
      fromDate: formatFromDate(_selectedFromDate),
      toDate: formatToDate(_selectedToDate),
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      sector: _selectedProjectType.id,
      pageNo: 1,
      impactOnCost:
          (_selectedStatus.id ?? 0) == 0 ? "" : _selectedStatus.id.toString(),
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      pageSize: pageSize,
      isEnglishLanguage: false,
    );
    _getVariations(request: _variationsRequest);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          isPaginationLoad == false) {
        isPaginationLoad = true;
        _variationsRequest =
            _variationsRequest.copyWith(pageNo: _variationsRequest.pageNo! + 1);
        _getVariations(request: _variationsRequest);
      }
    });
  }

  void _getVariations({required VariationsRequest request}) {
    _variationBloc.add(GetVariationsEvent(request: request));
  }

  void _getStatus() {
    _variationBloc.add(const GetStatusEvent());
  }

  void _searchEvent(String keyword) {
    _variationBloc.add(SearchVariationsEvent(keyword: keyword));
  }

  void _searchVariations(String keyword) {
    _variationsRequest =
        _variationsRequest.copyWith(keyword: keyword, pageNo: 1);
    _getVariations(request: _variationsRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchVariations("");
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
    _variationBloc.add(SelectSortEvent(sort: sort));
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _variationsRequest = _variationsRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getVariations(request: _variationsRequest);
  }

  void _onFilterTab() {
    setState(() {
      _isFilterSelected = true;
    });
    _getStatus();
  }

  void _openFilterBottomSheet() {
    openVariationsFilterBottomSheet(
      context: context,
      height: 350,
      status: _variationBloc.status,
      selectedStatus: _selectedStatus,
      selectedProjectType: _selectedProjectType,
      selectedFromDate: _selectedFromDate,
      selectedToDate: _selectedToDate,
      selectedPhase: _selectedPhase,
      phases: _variationBloc.phases,
      projectTypes: _variationBloc.projectTypes,
      onTap: (status, phase, projectType , fromDate, toDate) {
        _variationBloc.add(SelectFromDateEvent(fromDateTime: fromDate));
        _variationBloc.add(SelectToDateEvent(toDateTime: toDate));
        _variationBloc.add(SelectStatusEvent(status: status));
        _variationBloc.add(SelectPhaseEvent(phase: phase));
        _variationBloc.add(SelectProjectTypeEvent(projectType: projectType));
        _variationBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getVariationsWithFilterOptions() {
    _variationsRequest = _variationsRequest.copyWith(
      fromDate: formatFromDate(_selectedFromDate),
      toDate: formatToDate(_selectedToDate),
      impactOnCost:
          (_selectedStatus.id ?? 0) == 0 ? "" : _selectedStatus.id.toString(),
      pageNo: 1,
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      sector: _selectedProjectType.id,
    );
    _getVariations(
      request: _variationsRequest,
    );
  }

  void _navigateBack() {
    Navigator.pop(context);
  }
}
