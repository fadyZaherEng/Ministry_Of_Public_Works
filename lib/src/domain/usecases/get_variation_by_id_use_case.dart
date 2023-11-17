import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:aim/src/domain/repositories/variations_repository.dart';

class GetVariationByIdUseCase {
  final VariationsRepository _variationsRepository;

  GetVariationByIdUseCase(this._variationsRepository);

  Future<DataState<Variation>> call(
      String variationId, bool isEnglishLanguage) {
    return _variationsRepository.getVariationById(
        variationId, isEnglishLanguage);
  }
}
