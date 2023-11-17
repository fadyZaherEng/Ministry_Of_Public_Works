import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:aim/src/domain/entities/risks/risks_data.dart';

abstract class RisksRepository {
  Future<DataState<RisksData>> getRisks(RisksRequest request);

  Future<DataState<Risk>> getRiskById(
    String riskId,
    bool isEnglishLanguage,
  );

  Future<DataState<RisksData>> getRisksList(RisksListRequest request);

  Future<DataState<AnalysisChartBySector>> getRiskAnalysisChartBySector(
    String phaseId,
    String sectorId,
  );

  Future<DataState<AnalysisChartByPhase>> getRiskAnalysisChartByPhase(
      String phaseId,
      String sectorId,
      );

  Future<DataState<List<int>>> getRiskCounts(
      String phaseId,
      String sectorId,
      );
}
