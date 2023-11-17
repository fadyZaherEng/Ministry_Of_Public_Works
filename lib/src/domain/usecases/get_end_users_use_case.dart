import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/domain/entities/filter/end_user.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/repositories/filter_repository.dart';

class GetEndUsersUseCase {
  final FilterRepository _filterRepository;

  GetEndUsersUseCase(this._filterRepository);

  Future<DataState<List<EndUser>>> call(FilterRequest request) async {
    return _filterRepository.getEndUsers(request);
  }
}
