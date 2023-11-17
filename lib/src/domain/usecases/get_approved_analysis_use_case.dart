import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/contract/approved_analysis.dart';
import 'package:aim/src/domain/repositories/contract_repository.dart';

class GetApprovedAnalysisUseCase {
  final ContractRepository _contractRepository;

  GetApprovedAnalysisUseCase(this._contractRepository);

  Future<DataState<ApprovedAnalysis>> call(
    String sectorId,
  ) {
    return _contractRepository.getApprovedAnalysis(sectorId);
  }
}
