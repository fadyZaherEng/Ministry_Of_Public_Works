import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/repositories/risks_repository.dart';

class GetRiskCountsUseCase {
  final RisksRepository _risksRepository;

  GetRiskCountsUseCase(this._risksRepository);

  Future<DataState<List<int>>> call(
    String phaseId,
    String sectorId,
  ) {
    return _risksRepository.getRiskCounts(phaseId, sectorId);
  }
}
