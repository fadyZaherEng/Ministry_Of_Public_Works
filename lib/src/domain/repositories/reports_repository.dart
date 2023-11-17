import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/reports/request/reports_request.dart';
import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:aim/src/domain/entities/reports/reports_data.dart';

abstract class ReportsRepository {
  Future<DataState<ReportsData>> getReports(ReportsRequest request);

  Future<DataState<Report>> getReportById(
    String reportId,
    bool isEnglishLanguage,
  );

  Future<DataState<String>> getReportPDF(
    String reportId,
    bool isEnglishLanguage,
  );

  Future<DataState<String>> getPrintUrl();
}
