import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/warranties/request/warranties_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/warranty_type.dart';
import 'package:aim/src/domain/entities/warranties/warranty.dart';
import 'package:aim/src/presentation/bloc/warranties/warranties_bloc.dart';
import 'package:aim/src/presentation/screens/milestones/widget/skeleton_milestone_card_widget.dart';
import 'package:aim/src/presentation/screens/risks/utils/open_attachments_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/warranties/utils/open_warranties_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/warranties/widget/warranty_card_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WarrantiesScreen extends BaseStatefulWidget {
  const WarrantiesScreen({Key? key}) : super(key: key);

  @override
  BaseState<WarrantiesScreen> baseCreateState() => _WarrantiesScreenState();
}

class _WarrantiesScreenState extends BaseState<WarrantiesScreen> {
  WarrantiesBloc get _warrantiesBloc =>
      BlocProvider.of<WarrantiesBloc>(context);

  final TextEditingController _searchTextEditingController =
      TextEditingController();
  List<Warranty> _warranties = [];
  bool _isFilterSelected = true;
  WarrantiesRequest _warrantiesRequest = WarrantiesRequest();
  Sort _selectedSort = sorts.first;
  WarrantyType _selectedWarrantyType = const WarrantyType();
  Phase _selectedPhase = const Phase();
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
    return BlocConsumer<WarrantiesBloc, WarrantiesState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetWarrantiesSuccessState) {
          isPaginationLoad = false;
          _warranties = state.warranties;
        } else if (state is GetWarrantiesFailState) {
        } else if (state is SearchWarrantiesState) {
          _searchWarranties(state.keyword);
        } else if (state is SelectSortState) {
          _selectSort(state.sort);
        } else if(state is GetPhasesSuccessState){
          _openFilterBottomSheet();
        } else if(state is GetPhasesFailState){
        } else if(state is SelectPhaseState){
          _selectedPhase = state.phase;
        }
        else if (state is GetWarrantyTypesSuccessState) {
          _warrantiesBloc.add(const GetPhasesEvent());
        } else if (state is GetWarrantyTypesFailState) {
        } else if (state is SelectWarrantyTypeState) {
          _selectedWarrantyType = state.warrantyType;
        } else if (state is SelectFromDateState) {
          _selectedFromDate = state.fromDate;
        } else if (state is SelectToDateState) {
          _selectedToDate = state.toDate;
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getWarrantiesWithFilterOptions();
        } else if (state is GetWarrantyByIdSuccessState) {
          if (state.warranty.attachments?.isNotEmpty ?? true) {
            openAttachmentsBottomSheet(
                context: context,
                height: 300,
                attachments: state.warranty.attachments ?? [],
                selectedAttachments: (attachments) async {
                  if(await requestPermission()) {
                    downloadAttachments(attachments);
                  } else {
                    showToastMessage(S.current.permissionDenied);
                  }
                });
          } else {
            showToastMessage(S.of(context).attachmentsError);
          }
        } else if (state is GetWarrantyByIdFailState) {}
      },
      builder: (context, state) {
        return SharedScreen(
          title: S.of(context).warranties,
          searchLabel: S.of(context).searchWarranties,
          searchTextEditingController: _searchTextEditingController,
          isFilterSelected: _isFilterSelected,
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

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _warranties.isEmpty ? _buildEmptyScreen() : _buildWarranties();
  }

  Expanded _buildWarranties() {
    return Expanded(
      child: ListView.builder(
        itemCount: _warranties.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: WarrantyCardWidget(
              warranty: _warranties[index],
              onDownloadPressed: () {
                _warrantiesBloc.add(
                  GetWarrantyByIdEvent(
                    warrantyId: _warranties[index].id ?? "",
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
    _selectedPhase = _warrantiesBloc.selectedPhase;
    _selectedSort = _warrantiesBloc.selectedSort;
    _selectedWarrantyType = _warrantiesBloc.selectedWarrantyType;
    _selectedFromDate = _warrantiesBloc.selectedFromDatetime;
    _selectedToDate = _warrantiesBloc.selectedToDatetime;
    _warrantiesRequest = WarrantiesRequest(
      keyword: "",
      fromDate: formatFromDate(_selectedFromDate),
      toDate: formatToDate(_selectedToDate),
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      warrantyType: _selectedWarrantyType.id == 0
          ? ""
          : _selectedWarrantyType.id.toString(),
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      pageSize: pageSize,
      isEnglishLanguage: false,
    );
    _getWarranties(request: _warrantiesRequest);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          isPaginationLoad == false) {
        isPaginationLoad = true;
        _warrantiesRequest =
            _warrantiesRequest.copyWith(pageNo: _warrantiesRequest.pageNo! + 1);
        _getWarranties(request: _warrantiesRequest);
      }
    });
  }

  void _getWarranties({required WarrantiesRequest request}) {
    _warrantiesBloc.add(GetWarrantiesEvent(request: request));
  }

  void _getWarrantyType() {
    _warrantiesBloc.add(const GetWarrantyTypeEvent());
  }

  void _searchEvent(String keyword) {
    _warrantiesBloc.add(SearchWarrantiesEvent(keyword: keyword));
  }

  void _searchWarranties(String keyword) {
    _warrantiesRequest =
        _warrantiesRequest.copyWith(keyword: keyword, pageNo: 1);
    _getWarranties(request: _warrantiesRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchWarranties("");
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
    _warrantiesBloc.add(SelectSortEvent(sort: sort));
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _warrantiesRequest = _warrantiesRequest.copyWith(
      colDir: _selectedSort.columnDirection,
      sortColumn: _selectedSort.sortColumn,
      pageNo: 1,
    );
    _getWarranties(request: _warrantiesRequest);
  }

  void _onFilterTab() {
    setState(() {
      _isFilterSelected = true;
    });
    _getWarrantyType();
  }

  void _openFilterBottomSheet() {
    openWarrantiesFilterBottomSheet(
      context: context,
      height: 340,
      selectedFromDate: _selectedFromDate,
      selectedToDate: _selectedToDate,
      warrantyTypes: _warrantiesBloc.warrantyTypes,
      selectedWarrantyTypes: _selectedWarrantyType,
      phases: _warrantiesBloc.phases,
        selectedPhase: _selectedPhase,
      onTap: (warrantyType, phase,fromDate, toDate) {
        _warrantiesBloc.add(SelectFromDateEvent(fromDateTime: fromDate));
        _warrantiesBloc.add(SelectToDateEvent(toDateTime: toDate));
        _warrantiesBloc
            .add(SelectWarrantyTypeEvent(warrantyType: warrantyType));
        _warrantiesBloc.add(SelectPhaseEvent(phase: phase));
        _warrantiesBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getWarrantiesWithFilterOptions() {
    _warrantiesRequest = _warrantiesRequest.copyWith(
      warrantyType: _selectedWarrantyType.id == 0
          ? ""
          : _selectedWarrantyType.id.toString(),
      fromDate: formatFromDate(_selectedFromDate),
      toDate: formatToDate(_selectedToDate),
      phase: _selectedPhase.id.toString() == "0"
          ? ""
          : _selectedPhase.id.toString(),
      pageNo: 1,
    );
    _getWarranties(
      request: _warrantiesRequest,
    );
  }

  void _navigateBack() {
    Navigator.pop(context);
  }
}
