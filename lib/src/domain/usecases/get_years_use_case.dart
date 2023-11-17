import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/domain/repositories/filter_repository.dart';

class GetYearsUseCase {
  final FilterRepository _filterRepository;

  GetYearsUseCase(this._filterRepository);

  Future<DataState<List<Year>>> call(FilterRequest request) async {
    return _filterRepository.getYears(request);
  }
}
