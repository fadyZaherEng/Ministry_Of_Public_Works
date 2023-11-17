import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_request.dart';
import 'package:aim/src/domain/entities/issues/issues_data.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';

class GetIssuesUseCase {
  final IssuesRepository _issuesRepository;

  GetIssuesUseCase(this._issuesRepository);

  Future<DataState<IssuesData>> call(IssuesRequest request) async {
    return _issuesRepository.getIssues(request);
  }
}
