import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:aim/src/domain/repositories/reports_repository.dart';

class GetReportByIdUseCase {
  final ReportsRepository _reportsRepository;

  const GetReportByIdUseCase(this._reportsRepository);

  Future<DataState<Report>> call(
      String reportId, bool isEnglishLanguage) async {
    return await _reportsRepository.getReportById(reportId, isEnglishLanguage);
  }
}
