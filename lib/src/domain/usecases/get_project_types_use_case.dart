import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/repositories/filter_repository.dart';

class GetProjectTypesUseCase {
  final FilterRepository _filterRepository;

  GetProjectTypesUseCase(this._filterRepository);

  Future<DataState<List<ProjectType>>> call(FilterRequest request) {
    return _filterRepository.getProjectTypes(request);
  }
}
