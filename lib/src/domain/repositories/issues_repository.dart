import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/entities/issues/issues_data.dart';

abstract class IssuesRepository {
  Future<DataState<IssuesData>> getIssues(IssuesRequest request);

  Future<DataState<Issue>> getIssueById(
    String issueId,
    bool isEnglishLanguage,
  );

  Future<DataState<IssuesData>> getIssuesList(IssuesListRequest request);

  Future<DataState<AnalysisChartBySector>> getIssueAnalysisChartBySector(
      String phaseId,
      String sectorId,
      );

  Future<DataState<AnalysisChartByPhase>> getIssueAnalysisChartByPhase(
      String phaseId,
      String sectorId,
      );

  Future<DataState<List<int>>> getIssueCounts(
      String phaseId,
      String sectorId,
      );
}
