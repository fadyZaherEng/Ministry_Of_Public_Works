import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';

class GetIssueCountsUseCase {
  final IssuesRepository _issuesRepository;

  GetIssueCountsUseCase(this._issuesRepository);

  Future<DataState<List<int>>> call(
    String phaseId,
    String sectorId,
  ) {
    return _issuesRepository.getIssueCounts(phaseId, sectorId);
  }
}
