import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';

class GetIssueAnalysisChartByPhaseUseCase {
  final IssuesRepository _issuesRepository;

  GetIssueAnalysisChartByPhaseUseCase(this._issuesRepository);

  Future<DataState<AnalysisChartByPhase>> call(
    String phaseId,
    String sectorId,
  ) {
    return _issuesRepository.getIssueAnalysisChartByPhase(phaseId, sectorId);
  }
}
