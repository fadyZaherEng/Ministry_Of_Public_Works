import 'dart:math';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/request/analysis_list_request.dart';
import 'package:aim/src/domain/entities/analysis/analysis.dart';
import 'package:aim/src/domain/entities/analysis/extension_item.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/presentation/bloc/dashboards/analysis/analysis_dashboard_bloc.dart';
import 'package:aim/src/presentation/screens/dashboard/analysis/utils/open_analysis_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/widgets/bar_chart_widget.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysisDashboardScreen extends BaseStatefulWidget {
  final String id;

  const AnalysisDashboardScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  BaseState<AnalysisDashboardScreen> baseCreateState() =>
      _AnalysisDashboardScreenState();
}

class _AnalysisDashboardScreenState extends BaseState<AnalysisDashboardScreen> {
  AnalysisDashboardBloc get _analysisDashboardBloc =>
      BlocProvider.of<AnalysisDashboardBloc>(context);

  List<Analysis> analysis = [];
  List<ExtensionItem> extensionItems = [];

  // Phase _selectedPhase = const Phase();
  // ProjectType _selectedSector = const ProjectType();
  Year _selectedYear = const Year();
  Sort _selectedSort = sorts.first;
  AnalysisListRequest _analysisListRequest = AnalysisListRequest();

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    // _selectedPhase = _analysisDashboardBloc.selectedPhase;
    // _selectedSector = _analysisDashboardBloc.selectedSector;
    _selectedYear = _analysisDashboardBloc.selectedYear;
    _analysisListRequest = AnalysisListRequest(
      keyword: "",
      sortColumn: _selectedSort.sortColumn,
      colDir: _selectedSort.columnDirection,
      pageNo: 1,
      sector: "",
      // sector: (_selectedSector.id ?? ""),
      // phase: (_selectedPhase.id ?? 0) == 0 ? "" : _selectedPhase.id.toString(),
      phase: "",
      year: int.parse((_selectedYear.name ?? "2023").isEmpty
          ? "2023"
          : _selectedYear.name ?? "2023"),
      projectId: widget.id,
      pageSize: pageSize,
      isEnglishLanguage: false,
    );
    _getExtensionPeriod();
    _getAnalysisList(request: _analysisListRequest);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _getExtensionPeriod() {
    _analysisDashboardBloc.add(
      GetExtensionPeriodEvent(
        id: widget.id,
        year: int.parse(
          (_selectedYear.name ?? "2023").isEmpty
              ? "2023"
              : _selectedYear.name ?? "2023",
        ),
      ),
    );
  }

  void _getAnalysisList({
    required AnalysisListRequest request,
  }) {
    _analysisDashboardBloc.add(GetAnalysisModuleListEvent(request: request));
  }

  // void _getPhases() {
  //   _analysisDashboardBloc.add(const GetPhasesEvent());
  // }
  //
  // void _getSectors() {
  //   _analysisDashboardBloc.add(const GetSectorsEvent());
  // }

  void _getYears() {
    _analysisDashboardBloc.add(const GetYearsEvent());
  }

  void _onFilterTab() {
    _getYears();
  }

  void _openFilterBottomSheet() {
    openAnalysisFilterBottomSheet(
      context: context,
      height: 230,
      // phases: _analysisDashboardBloc.phases,
      // selectedPhase: _selectedPhase,
      // sectors: _analysisDashboardBloc.sectors,
      // selectedSector: _selectedSector,
      years: _analysisDashboardBloc.years,
      selectedYear: _selectedYear,
      onTap: (year) {
        // _analysisDashboardBloc.add(SelectPhaseEvent(phase: phase));
        // _analysisDashboardBloc.add(SelectSectorEvent(sector: sector));
        _analysisDashboardBloc.add(SelectYearEvent(year: year));
        _analysisDashboardBloc.add(const NavigateBackEvent());
      },
    );
  }

  void _getAnalysisWithFilterOptions() {
    _analysisListRequest = _analysisListRequest.copyWith(
      // sector: _selectedSector.id,
      // phase: _selectedPhase.id.toString() == "0"
      //     ? ""
      //     : _selectedPhase.id.toString(),
      pageNo: 1,
      year: int.parse(
        (_selectedYear.name ?? "2023").isEmpty
            ? "2023"
            : _selectedYear.name ?? "2023",
      ),
    );
    _getAnalysisList(request: _analysisListRequest);
    _getExtensionPeriod();
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AnalysisDashboardBloc, AnalysisDashboardState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
        } else if (state is HideLoadingState) {
        } else if (state is GetAnalysisModuleListSuccessState) {
          analysis = state.analysis;
        } else if (state is GetAnalysisModuleListFailState) {
        } else if (state is GetExtensionPeriodSuccessState) {
          extensionItems = state.extensionItems;
          convertToBarData(extensionItems);
        } else if (state is GetExtensionPeriodFailState) {
        }
        // else if (state is GetPhasesSuccessState) {
        //   _getSectors();
        // }
        // else if (state is GetPhasesFailState) {
        // }
        // else if (state is GetSectorsSuccessState) {
        //   _getYears();
        // }
        // else if (state is GetSectorsFailState) {
        // }
        else if (state is GetYearsSuccessState) {
          _openFilterBottomSheet();
        } else if (state is GetYearsFailState) {
        }
        // else if (state is SelectPhaseState) {
        //   _selectedPhase = state.phase;
        // }
        // else if (state is SelectSectorState) {
        //   _selectedSector = state.sector;
        // }
        else if (state is SelectYearState) {
          _selectedYear = state.year;
        } else if (state is NavigateBackState) {
          _navigateBack();
          _getAnalysisWithFilterOptions();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    AppBarWidget(
                      title: S.of(context).analysisModule,
                      isHaveBackButton: true,
                      isHaveForms: false,
                      isHaveFilter: true,
                      onFilterTab: _onFilterTab,
                      onFormsTab: () {},
                      imagePath: ImagePaths.arrowBack,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 24),
                    DashboardCardWidget(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _sectionTitle(S
                                .of(context)
                                .contractualCompletionDateAndCompletionDateAfterExtension),
                            const SizedBox(height: 22),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  border: TableBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    horizontalInside: const BorderSide(
                                      width: 0.5,
                                      color: Colors.black,
                                    ),
                                    verticalInside: const BorderSide(
                                      width: 0.5,
                                      color: Colors.black,
                                    ),
                                    bottom: const BorderSide(
                                      width: 0.5,
                                      color: Colors.black,
                                    ),
                                    top: const BorderSide(
                                      width: 0.5,
                                      color: Colors.black,
                                    ),
                                    left: const BorderSide(
                                      width: 0.5,
                                      color: Colors.black,
                                    ),
                                    right: const BorderSide(
                                      width: 0.5,
                                      color: Colors.black,
                                    ),
                                  ),
                                  horizontalMargin: 8,
                                  dataRowHeight: 50,
                                  // 100
                                  columns: [
                                    // DataColumn(
                                    //   label: Text(S.of(context).projectName),
                                    // ),
                                    // DataColumn(
                                    //   label: Text(S.of(context).phase),
                                    // ),
                                    DataColumn(
                                      label: Text(S.of(context).month),
                                    ),
                                    DataColumn(
                                      label: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(S.of(context).contractual),
                                          Text(S.of(context).completionDate)
                                        ],
                                      ),
                                    ),

                                    DataColumn(
                                      label: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(S.of(context).completionDate),
                                          Text(S.of(context).afterExtension)
                                        ],
                                      ),
                                    ),
                                  ],
                                  rows: analysis
                                      .map((item) => DataRow(
                                            cells: [
                                              // DataCell(
                                              //   Container(
                                              //     width: 150,
                                              //     child: Container(
                                              //       margin:
                                              //           EdgeInsets.symmetric(
                                              //               vertical: 8),
                                              //       child: Text(
                                              //         "${item.projectName ?? ""}",
                                              //         maxLines: 6,
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                              // DataCell(Container(
                                              //   width: 65,
                                              //   child: Container(
                                              //     margin: EdgeInsets.symmetric(
                                              //         vertical: 8),
                                              //     child: Text(
                                              //       "${item.phaseName ?? ""}",
                                              //       maxLines: 6,
                                              //     ),
                                              //   ),
                                              // )),
                                              DataCell(SizedBox(
                                                width: 60,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  child: Text(
                                                    "${item.month ?? ""}",
                                                    maxLines: 6,
                                                  ),
                                                ),
                                              )),
                                              DataCell(SizedBox(
                                                width: 80,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  // child: Text(
                                                  //   "${item.contractualCompletionDate ?? ""}",
                                                  child: Text(
                                                    formatDateTimeString(
                                                        item.contractualCompletionDate ??
                                                            ""),
                                                    maxLines: 6,
                                                  ),
                                                ),
                                              )),
                                              DataCell(SizedBox(
                                                width: 80,
                                                child: Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 8),
                                                  // child: Text(
                                                  //   "${formatDate(item.completionDateAfterExtension ?? "")}",
                                                  child: Text(
                                                    formatDateTimeString(
                                                        item.completionDateAfterExtension ??
                                                            ""),
                                                    maxLines: 6,
                                                  ),
                                                ),
                                              )),
                                            ],
                                          ))
                                      .toList()),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DashboardCardWidget(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _sectionTitle(S.of(context).extensionPeriod),
                            const SizedBox(height: 22),
                            BarChartWidget(
                              labelRotation: 90,
                              maximumLabels: 12,
                              data: convertToBarData(extensionItems),
                              height: 250,
                              minimum: 0,
                              maximum: getMax(extensionItems),
                              interval: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Text _sectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline3?.copyWith(
            letterSpacing: -0.32,
            fontWeight: semiBold,
          ),
    );
  }

  List<BarChart> convertToBarData(List<ExtensionItem> extensionItems) {
    return [
      BarChart(
          extensionItems
              .map((item) =>
                  BarData(item.month.toString(), item.extensionPeriod ?? 0.0))
              .toList(),
          ColorSchema.barGreen),
    ];
  }

  double getMax(List<ExtensionItem> extensionItems) {
    double maxValue = 0.0;
    for (var item in extensionItems) {
      maxValue = max(maxValue, item.extensionPeriod ?? 0.0);
    }
    return maxValue;
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
