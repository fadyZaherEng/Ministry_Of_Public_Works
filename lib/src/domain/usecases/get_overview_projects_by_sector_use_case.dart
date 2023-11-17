import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:aim/src/domain/repositories/overview_repository.dart';

class GetOverviewProjectsBySectorUseCase {
  final OverviewRepository _overviewRepository;

  GetOverviewProjectsBySectorUseCase(this._overviewRepository);

  Future<DataState<OverviewChartBySector>> call(String phaseId,String sectorId) async {
    return _overviewRepository.getOverviewProjectsBySector(phaseId,sectorId);
  }
}
