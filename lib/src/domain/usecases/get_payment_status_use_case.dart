import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/domain/entities/filter/penalty_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/repositories/filter_repository.dart';

class GetPaymentStatusUseCase {
  final FilterRepository _filterRepository;

  GetPaymentStatusUseCase(this._filterRepository);

  Future<DataState<List<Status>>> call(FilterRequest request) {
    return _filterRepository.getPaymentStatus(request);
  }
}