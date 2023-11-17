import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';

class GetIssueByIdUseCase {
  final IssuesRepository _issuesRepository;

  GetIssueByIdUseCase(this._issuesRepository);

  Future<DataState<Issue>> call(String issueId, bool isEnglishLanguage) {
    return _issuesRepository.getIssueById(issueId, isEnglishLanguage);
  }
}
