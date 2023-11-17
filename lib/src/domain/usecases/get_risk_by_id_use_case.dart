import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:aim/src/domain/repositories/risks_repository.dart';

class GetRiskByIdUseCase {
  final RisksRepository _risksRepository;

  GetRiskByIdUseCase(this._risksRepository);

  Future<DataState<Risk>> call(String riskId, bool isEnglishLanguage) {
    return _risksRepository.getRiskById(riskId, isEnglishLanguage);
  }
}
