import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_list_request.dart';
import 'package:aim/src/domain/entities/issues/issues_data.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';

class GetIssuesListUseCase {
  final IssuesRepository _issuesRepository;

  GetIssuesListUseCase(this._issuesRepository);

  Future<DataState<IssuesData>> call(IssuesListRequest request) async {
    return _issuesRepository.getIssuesList(request);
  }
}
