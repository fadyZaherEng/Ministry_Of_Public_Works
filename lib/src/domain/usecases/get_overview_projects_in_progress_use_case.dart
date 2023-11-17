import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/repositories/overview_repository.dart';

class GetOverviewProjectsInProgressUseCase {
  final OverviewRepository _overviewRepository;

  GetOverviewProjectsInProgressUseCase(this._overviewRepository);

  Future<DataState<int>> call(String phaseId,String sectorId) async {
    return _overviewRepository.getProjectsInProgress(phaseId,sectorId);
  }
}
