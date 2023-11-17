import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/repositories/risks_repository.dart';

class GetRiskAnalysisChartBySectorUseCase {
  final RisksRepository _risksRepository;

  GetRiskAnalysisChartBySectorUseCase(this._risksRepository);

  Future<DataState<AnalysisChartBySector>> call(
    String phaseId,
    String sectorId,
  ) {
    return _risksRepository.getRiskAnalysisChartBySector(phaseId, sectorId);
  }
}
