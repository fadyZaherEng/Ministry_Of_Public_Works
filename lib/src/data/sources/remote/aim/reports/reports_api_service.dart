import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/reports/entity/remote_report.dart';
import 'package:aim/src/data/sources/remote/aim/reports/entity/remote_reports_data.dart';
import 'package:aim/src/data/sources/remote/aim/reports/request/reports_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'reports_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ReportsApiService {
  factory ReportsApiService(Dio dio) = _ReportsApiService;

  @POST(getMonthlyReportsEndPoint)
  Future<HttpResponse<AIMResponse<RemoteReportsData>>> getReports(
      @Body() ReportsRequest request);

  @GET("$getReportByIdEndPoint/{reportId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteReport>>>> getReportById(
      @Path("reportId") String reportId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET("$getReportPDFEndPoint/{reportId}")
  Future<HttpResponse<AIMResponse<String>>> getReportPDF(
      @Path("reportId") String reportId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET(getPrintUrlEndPoint)
  Future<HttpResponse<AIMResponse<String>>> getPrintUrl();
}
