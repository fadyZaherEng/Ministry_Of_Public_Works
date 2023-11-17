import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_list_request.dart';
import 'package:aim/src/domain/entities/variations/variations_data.dart';
import 'package:aim/src/domain/repositories/variations_repository.dart';

class GetVariationsListUseCase {
  final VariationsRepository _variationsRepository;

  GetVariationsListUseCase(this._variationsRepository);

  Future<DataState<VariationsDate>> call(VariationsListRequest request) async {
    return _variationsRepository.getVariationsList(request);
  }
}
