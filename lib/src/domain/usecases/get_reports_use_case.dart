import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/reports/request/reports_request.dart';
import 'package:aim/src/domain/entities/reports/reports_data.dart';
import 'package:aim/src/domain/repositories/reports_repository.dart';

class GetReportsUseCase {
  final ReportsRepository _reportsRepository;

  GetReportsUseCase(this._reportsRepository);

  Future<DataState<ReportsData>> call(ReportsRequest request) {
    return _reportsRepository.getReports(request);
  }
}
