import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:aim/src/domain/entities/overview/overview_data.dart';
import 'package:aim/src/domain/repositories/overview_repository.dart';

class GetOverviewCardsUseCase {
  final OverviewRepository _overviewRepository;

  GetOverviewCardsUseCase(this._overviewRepository);

  Future<DataState<List<String>>> call(String phaseId,String sectorId) async {
    return _overviewRepository.getOverviewCards(phaseId,sectorId);
  }
}
