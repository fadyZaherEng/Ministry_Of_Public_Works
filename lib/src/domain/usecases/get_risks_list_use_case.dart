import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_list_request.dart';
import 'package:aim/src/domain/entities/risks/risks_data.dart';
import 'package:aim/src/domain/repositories/risks_repository.dart';

class GetRisksListUseCase {
  final RisksRepository _risksRepository;

  GetRisksListUseCase(this._risksRepository);

  Future<DataState<RisksData>> call(RisksListRequest request) async {
    return _risksRepository.getRisksList(request);
  }
}
