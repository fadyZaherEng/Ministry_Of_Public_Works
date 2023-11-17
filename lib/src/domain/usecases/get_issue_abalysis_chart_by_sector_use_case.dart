import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';

class GetIssueAnalysisChartBySectorUseCase {
  final IssuesRepository _issuesRepository;

  GetIssueAnalysisChartBySectorUseCase(this._issuesRepository);

  Future<DataState<AnalysisChartBySector>> call(
    String phaseId,
    String sectorId,
  ) {
    return _issuesRepository.getIssueAnalysisChartBySector(phaseId, sectorId);
  }
}
