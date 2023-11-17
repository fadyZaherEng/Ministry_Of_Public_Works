import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_request.dart';
import 'package:aim/src/domain/entities/penalties/penalties_data.dart';
import 'package:aim/src/domain/repositories/penalties_repository.dart';

class GetPenaltiesUseCase {
  final PenaltiesRepository _penaltiesRepository;

  GetPenaltiesUseCase(this._penaltiesRepository);

  Future<DataState<PenaltiesData>> call(PenaltiesRequest request) async {
    return _penaltiesRepository.getPenalties(request);
  }
}
