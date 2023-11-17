import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_request.dart';
import 'package:aim/src/domain/entities/variations/variations_data.dart';
import 'package:aim/src/domain/repositories/variations_repository.dart';

class GetVariationsUseCase {
  final VariationsRepository _variationsRepository;

  GetVariationsUseCase(this._variationsRepository);

  Future<DataState<VariationsDate>> call(VariationsRequest request) async {
    return _variationsRepository.getVariations(request);
  }
}
