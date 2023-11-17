import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/warranties/request/warranties_request.dart';
import 'package:aim/src/domain/entities/warranties/warranties_data.dart';
import 'package:aim/src/domain/repositories/warranties_repository.dart';

class GetWarrantiesUseCase {
  final WarrantiesRepository _warrantiesRepository;

  GetWarrantiesUseCase(this._warrantiesRepository);

  Future<DataState<WarrantiesData>> call(WarrantiesRequest request) async {
    return _warrantiesRepository.getWarranties(request);
  }
}
