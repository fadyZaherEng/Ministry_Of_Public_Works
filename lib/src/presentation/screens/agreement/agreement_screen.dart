import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/routes/app_routes.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/request/agreements_request.dart';
import 'package:aim/src/domain/entities/agreement/agreement.dart';
import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/presentation/bloc/agreement/agreement_bloc.dart';
import 'package:aim/src/presentation/screens/agreement/utils/open_agreement_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/agreement/widgets/agreement_card_widget.dart';
import 'package:aim/src/presentation/screens/agreement/widgets/skeleton_agreement_card_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgreementScreen extends BaseStatefulWidget {
  const AgreementScreen({Key? key}) : super(key: key);

  @override
  BaseState<AgreementScreen> baseCreateState() {
    return _AgreementScreenState();
  }
}

class _AgreementScreenState extends BaseState<AgreementScreen> {
  AgreementBloc get _agreementBloc => BlocProvider.of<AgreementBloc>(context);

  final TextEditingController _searchTextEditingController =
      TextEditingController();
  bool _isFilteredSelected = true;
  AgreementsRequest _agreementsRequest = AgreementsRequest();
  Sort _selectedSort = sorts.first;
  Year _selectedYear = const Year(name: "2022");
  Month _selectedMonth = const Month(name: "12");
  ProjectType _selectedProjectType = const ProjectType();
  List<Agreement> _agreements = [];
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
    return BlocConsumer<AgreementBloc, AgreementState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetAgreementsSuccessState) {
          isPaginationLoad = false;
          _agreements = state.agreements;
        } else if (state is GetAgreementsFailState) {
        } else if (state is SearchAgreementState) {
          _searchAgreements(state.keyword);
        } else if (state is SelectSortState) {
          _selectSort(state.sort);
        } else if (state is GetYearsSuccessState) {
          _getMonths();
        } else if (state is GetYearsFailState) {
        } else if (state is GetMonthsSuccessState) {
          _agreementBloc.add(const GetProjectTypesEvent());
        } else if (state is GetMonthsFailState) {
        } else if (state is SelectYearState) {
          _selectedYear = state.year;
        } else if (state is SelectMonthState) {
          _selectedMonth = state.month;
        } else if (state is GetAgreementByIdSuccessState) {
          downloadSiteUrl(state.agreement.projectEngineerPhoneNumber ?? "");
        } else if (state is GetAgreementByIdFailState) {
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getAgreementsWithFilterOptions();
        } else if(state is GetProjectTypesSuccessState){
          _openFilterBottomSheet();
        } else if (state is GetProjectTypesFailState){

        } else if(state is SelectProjectTypeState){
          _selectedProjectType = state.projectType;
        }
      },
      builder: (context, state) {
        return SharedScreen(
          title: S.of(context).consultantAgreement,
          searchLabel: S.of(context).searchAgreement,
          searchTextEditingController: _searchTextEditingController,
          isFilterSelected: _isFilteredSelected,
          onChange: _searchEvent,
          onSubmit: _searchEvent,
          clearActionButton: _clearSearch,
          onFilterTab: _onFilterTab,
          onSortTab: _onSortTab,
          isHaveBackButton: true,
          content: state is ShowSkeletonState
              ? const SkeletonAgreementCardWidget()
              : _buildScreenContent(),
        );
      },
    );
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return _agreements.isEmpty ? _buildEmptyScreen() : _buildAgreements();
  }

  Expanded _buildAgreements() {
    return Expanded(
      child: ListView.builder(
        itemCount: _agreements.length,
        controller: scrollController,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: AgreementCardWidget(
              agreement: _agreements[index],
              onDownloadPressed: () {
                _agreementBloc.add(
                  GetAgreementByIdEvent(
                    agreementId: _agreements[index].id ?? "",
                  ),
                );
              },
              onOpenFormsPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.agreementForm,
                  arguments: _agreements[index].id ?? "",
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
    _selectedSort = _agreementBloc.selectedSort;
    _agreementsRequest = AgreementsRequest(
      keyword: "",
      year: int.parse(_selectedYear.name ?? "2022"),
      month: int.parse(_selectedMonth.name ?? "12"),
      projectId: null,
      projectPhaseId: null,
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      pageSize: pageSize,
      sector: _selectedProjectType.id,
      isEnglishLanguage: true,
    );
    _getAgreements(request: _agreementsRequest);
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          isPaginationLoad == false) {
        isPaginationLoad = true;
        _agreementsRequest =
            _agreementsRequest.copyWith(pageNo: _agreementsRequest.pageNo! + 1);
        _getAgreements(request: _agreementsRequest);
      }
    });
  }

  void _getAgreements({required AgreementsRequest request}) {
    _agreementBloc.add(GetAgreementsEvent(request: request));
  }

  void _searchEvent(String keyword) {
    _agreementBloc.add(SearchAgreementsEvent(keyword: keyword));
  }

  void _searchAgreements(String keyword) {
    _agreementsRequest =
        _agreementsRequest.copyWith(keyword: keyword, pageNo: 1);
    _getAgreements(request: _agreementsRequest);
  }

  void _clearSearch() {
    _searchTextEditingController.clear();
    _searchAgreements("");
  }

  void _onSortTab() {
    setState(() {
      _isFilteredSelected = false;
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
    _agreementBloc.add(SelectSortEvent(sort: sort));
  }

  void _selectSort(Sort sort) {
    _selectedSort = sort;
    _agreementsRequest = _agreementsRequest.copyWith(
        colDir: _selectedSort.columnDirection,
        sortColumn: _selectedSort.sortColumn,
        pageNo: 1);
    _getAgreements(request: _agreementsRequest);
  }

  void _onFilterTab() {
    setState(() {
      _isFilteredSelected = true;
    });
    _getYears();
  }

  void _getYears() {
    _agreementBloc.add(const GetYearsEvent());
  }

  void _getMonths() {
    _agreementBloc.add(const GetMonthsEvent());
  }

  void _openFilterBottomSheet() {
    openAgreementFilterBottomSheet(
      context: context,
      height: 300,
      months: _agreementBloc.months,
      years: _agreementBloc.years,
      selectedMonth: _selectedMonth,
      selectedYear: _selectedYear,
      selectedProjectType: _selectedProjectType,
      projectTypes: _agreementBloc.projectTypes,
      onTap: (projectType, year, month) {
        _agreementBloc.add(SelectProjectTypeEvent(projectType: projectType));
        _agreementBloc.add(SelectYearEvent(year: year));
        _agreementBloc.add(SelectMonthEvent(month: month));
        _agreementBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getAgreementsWithFilterOptions() {
    _agreementsRequest = _agreementsRequest.copyWith(
        year: int.parse(_selectedYear.name ?? "2022"),
        month: int.parse(_selectedMonth.name ?? "12"),
        sector: _selectedProjectType.id,
        pageNo: 1);
    _getAgreements(
      request: _agreementsRequest,
    );
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  void downloadSiteUrl(String fileUrl) async {
    if (await requestPermission()) {
      downloadFile(fileUrl);
    } else {
      showToastMessage(S.current.permissionDenied);
    }
  }
}
