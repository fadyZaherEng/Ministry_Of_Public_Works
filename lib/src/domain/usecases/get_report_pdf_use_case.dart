import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/repositories/reports_repository.dart';

class GetReportPDFUseCase {
  final ReportsRepository _reportsRepository;

  GetReportPDFUseCase(this._reportsRepository);

  Future<DataState<String>> call(
      String reportId, bool isEnglishLanguage) async {
    return _reportsRepository.getReportPDF(reportId, isEnglishLanguage);
  }
}
