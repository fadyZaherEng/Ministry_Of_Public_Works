import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_request.dart';
import 'package:aim/src/domain/entities/risks/risks_data.dart';
import 'package:aim/src/domain/repositories/risks_repository.dart';

class GetRisksUseCase {
  final RisksRepository _risksRepository;

  GetRisksUseCase(this._risksRepository);

  Future<DataState<RisksData>> call(RisksRequest request) async {
    return _risksRepository.getRisks(request);
  }
}
