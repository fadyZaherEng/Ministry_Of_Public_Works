import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/routes/app_routes.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/open_sort_bottom_sheet.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/reports/request/reports_request.dart';
import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:aim/src/presentation/bloc/reports/reports_bloc.dart';
import 'package:aim/src/presentation/screens/reports/utils/open_reports_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/reports/widgets/report_card_widget.dart';
import 'package:aim/src/presentation/screens/reports/widgets/skeleton_reports_card_widget.dart';
import 'package:aim/src/presentation/widgets/empty_data_widget.dart';
import 'package:aim/src/presentation/widgets/shared_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportsScreen extends BaseStatefulWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ReportsScreenState();
}

class _ReportsScreenState extends BaseState<ReportsScreen> {
  ReportsBloc get _reportsBloc => BlocProvider.of<ReportsBloc>(context);

  final TextEditingController _searchTextEditingController =
      TextEditingController();
  bool _isFilteredSelected = true;
  ReportsRequest _reportsRequest = ReportsRequest();
  Sort _selectedSort = sorts.first;
  Phase _selectedPhase = const Phase();
  ProjectType _selectedProjectType = const ProjectType();
  Month _selectedMonth = const Month(name: "10");
  Year _selectedYear = const Year(name: "2022");
  ScrollController scrollController = ScrollController();
  List<Report> reports = [];
  bool isPaginationLoad = false;
  String _reportsUrl = '';

  @override
  void initState() {
    super.initState();
    _selectedSort = _reportsBloc.selectedSort;
    _reportsRequest = ReportsRequest(
      keyword: "",
      projectPhaseId: null,
      projectId: null,
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      pageSize: pageSize,
      year: int.parse(_selectedYear.name ?? "2022"),
      month: int.parse(_selectedMonth.name ?? "10"),
      sector: _selectedProjectType.id ?? "",
      isEnglishLanguage: false,
    );
    _getReports(_reportsRequest);

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent &&
          isPaginationLoad == false) {
        isPaginationLoad = true;
        _reportsRequest =
            _reportsRequest.copyWith(pageNo: _reportsRequest.pageNo! + 1);
        _getReports(_reportsRequest);
      }
    });
    _reportsBloc.add(GetPrintUrlEvent());
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ReportsBloc, ReportsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetReportsSuccessState) {
          isPaginationLoad = false;
          reports = state.reports;
        } else if (state is GetReportsFailState) {
        } else if (state is GetPhasesSuccessState) {
          _reportsBloc.add(const GetMonthsEvent());
        } else if (state is GetPhasesFailState) {
        } else if (state is GetMonthsSuccessState) {
          _reportsBloc.add(const GetYearsEvent());
        } else if (state is GetMonthsFailState) {
        } else if (state is GetYearsSuccessState) {
          _reportsBloc.add(const GetProjectTypesEvent());
        } else if (state is GetMonthsSuccessState) {
        } else if (state is SearchReportsState) {
          _reportsRequest =
              _reportsRequest.copyWith(keyword: state.keyword, pageNo: 1);
          _getReports(_reportsRequest);
        } else if (state is SelectSortState) {
          _selectedSort = state.sort;
          _reportsRequest = _reportsRequest.copyWith(
            colDir: _selectedSort.columnDirection,
            sortColumn: _selectedSort.sortColumn,
            pageNo: 1,
          );
          _getReports(_reportsRequest);
        } else if (state is SelectPhaseState) {
          _selectedPhase = state.phase;
        } else if (state is SelectMonthState) {
          _selectedMonth = state.month;
        } else if (state is SelectYearState) {
          _selectedYear = state.year;
        } else if (state is NavigateBackState) {
          _navigateBack();
          _reportsRequest = _reportsRequest.copyWith(
            projectPhaseId:
                _selectedPhase.id == 0 ? "" : _selectedPhase.id.toString(),
            month: int.parse((_selectedMonth.name ?? "10")),
            year: int.parse((_selectedYear.name ?? "2022")),
            sector: _selectedProjectType.id ?? "",
            pageNo: 1,
          );
          _getReports(
            _reportsRequest,
          );
        } else if (state is GetReportPDSuccessState) {
          if (state.pdfUrl.isNotEmpty) {
            _launchUrl(state.pdfUrl);
          } else {
            _showToast("Report not found");
          }
        } else if (state is GetReportPDFailState) {
          _showToast(state.errorMessage);
        } else if (state is GetProjectTypesSuccessState) {
          openReportsFilterBottomSheet(
            context: context,
            height: 400,
            phases: _reportsBloc.phases,
            projectTypes: _reportsBloc.projectTypes,
            selectedProjectType: _selectedProjectType,
            months: _reportsBloc.months,
            years: _reportsBloc.years,
            selectedPhase: _selectedPhase,
            selectedMonth: _selectedMonth,
            selectedYear: _selectedYear,
            onTap: (phase, projectType, month, year) {
              _reportsBloc.add(SelectPhaseEvent(phase: phase));
              _reportsBloc.add(SelectMonthEvent(month: month));
              _reportsBloc.add(SelectYearEvent(year: year));
              _reportsBloc
                  .add(SelectProjectTypeEvent(projectType: projectType));
              _reportsBloc.add(const NavigateBackEvent());
            },
          );
        } else if (state is GetProjectTypesFailState) {
        } else if (state is SelectProjectTypeState) {
          _selectedProjectType = state.projectType;
        } else if (state is GetPrintUrlSuccessState) {
          _reportsUrl = state.url;
        } else if (state is GetPrintUrlFailState) {
          _reportsUrl = '';
        } else if (state is OpenPdfWebViewState) {
          Navigator.pushNamed(
            context,
            AppRoutes.webView,
            arguments: {
              'url': state.pdfUrl,
              'reportId': state.reportId,
            },
          );
          _reportsBloc.add(
            const ChangeDeviceOrientationEvent(
              deviceOrientationList: [
                DeviceOrientation.landscapeRight,
                DeviceOrientation.landscapeLeft
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        return SharedScreen(
          title: S.of(context).reports,
          searchLabel: S.of(context).searchReport,
          searchTextEditingController: _searchTextEditingController,
          isFilterSelected: _isFilteredSelected,
          isHaveForms: false,
          onFormsTab: () {},
          onFilterTab: () {
            setState(() {
              _isFilteredSelected = true;
            });
            _reportsBloc.add(const GetPhasesEvent());
          },
          onSortTab: () {
            setState(() {
              _isFilteredSelected = false;
            });
            openSortBottomSheet(
                height: 300,
                context: context,
                sorts: sorts,
                selectedSort: _selectedSort,
                selectSortEvent: _selectSortEvent);
          },
          clearActionButton: () {
            _searchTextEditingController.clear();
            _reportsBloc.add(const SearchReportsEvent(keyword: ""));
          },
          onSubmit: (value) {
            _reportsBloc.add(SearchReportsEvent(keyword: value));
          },
          onChange: (value) {
            _reportsBloc.add(SearchReportsEvent(keyword: value));
          },
          content: state is ShowSkeletonState
              ? const SkeletonReportsCardWidget()
              : _buildScreenContent(),
        );
      },
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  //Helper Widgets//
  Widget _buildScreenContent() {
    return reports.isEmpty ? _buildEmptyScreen() : _buildReports();
  }

  Expanded _buildReports() {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: reports.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: ReportCardWidget(
              report: reports[index],
              onOpenReportPressed: () {
                _reportsBloc.add(OpenPdfWebViewEvent(
                  reportUrl: _reportsUrl,
                  reportId: reports[index].id ?? "",
                ));
              },
              onViewFormPresses: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.reportsForm,
                  arguments: reports[index].id ?? "",
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

  void _getReports(ReportsRequest request) {
    _reportsBloc.add(GetReportsEvent(request: request));
  }

  void _selectSortEvent(Sort sort) {
    _reportsBloc.add(SelectSortEvent(sort: sort));
  }

  Future<void> _launchUrl(String pdfUrl) async {
    if (!await launchUrl(Uri.parse(pdfUrl))) {
      throw Exception('Could not launch url');
    }
  }

  Future<void> _openFile(String pdfUrl) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file =
        File("${appStorage.path}/${Uri.parse(pdfUrl).path.split("/").last}");
    late Response response;
    try {
      response = await Dio().get(pdfUrl,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));
    } catch (e) {
      _showToast("Report not found");
    }

    final ref = file.openSync(mode: FileMode.write);
    ref.writeFromSync(response.data);
    await ref.close();
    // OpenFile.open(file.path);
  }

  void _navigateBack() {
    Navigator.pop(context);
  }
}
