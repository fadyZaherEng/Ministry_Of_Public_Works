import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/contract/delay_analysis.dart';
import 'package:aim/src/domain/entities/contract/operation_analysis.dart';
import 'package:aim/src/domain/repositories/contract_repository.dart';

class GetOperationAnalysisUseCase {
  final ContractRepository _contractRepository;

  GetOperationAnalysisUseCase(this._contractRepository);

  Future<DataState<OperationAnalysis>> call() {
    return _contractRepository.getOperationAnalysis();
  }
}
