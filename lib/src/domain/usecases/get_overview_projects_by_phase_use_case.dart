import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:aim/src/domain/repositories/overview_repository.dart';

class GetOverviewProjectsByPhaseUseCase {
  final OverviewRepository _overviewRepository;

  GetOverviewProjectsByPhaseUseCase(this._overviewRepository);

  Future<DataState<OverviewChartByPhase>> call(String phaseId,String sectorId) async {
    return _overviewRepository.getOverviewProjectsByPhase(phaseId,sectorId);
  }
}
