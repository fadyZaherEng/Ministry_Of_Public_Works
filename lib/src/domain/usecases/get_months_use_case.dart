import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:aim/src/domain/repositories/filter_repository.dart';

class GetMonthsUseCase {
  final FilterRepository _filterRepository;

  GetMonthsUseCase(this._filterRepository);

  Future<DataState<List<Month>>> call(FilterRequest request) async {
    return _filterRepository.getMonths(request);
  }
}
