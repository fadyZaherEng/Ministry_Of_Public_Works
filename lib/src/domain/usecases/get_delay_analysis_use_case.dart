import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/contract/delay_analysis.dart';
import 'package:aim/src/domain/repositories/contract_repository.dart';

class GetDelayAnalysisUseCase {
  final ContractRepository _contractRepository;

  GetDelayAnalysisUseCase(this._contractRepository);

  Future<DataState<DelayAnalysis>> call() {
    return _contractRepository.getDelayAnalysis();
  }
}
