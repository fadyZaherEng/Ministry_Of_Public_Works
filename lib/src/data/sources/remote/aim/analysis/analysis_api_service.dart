import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_chart_response.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/entity/remote_analysis_data.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/entity/remote_extension_item.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/request/analysis_list_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'analysis_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AnalysisApiService {
  factory AnalysisApiService(Dio dio) = _AnalysisApiService;

  @POST("Dashboards/AnalysisModuleList")
  Future<HttpResponse<AIMResponse<RemoteAnalysisData>>> getAnalysisList(
    @Body() AnalysisListRequest request,
  );

  @GET("Dashboards/ExtensionPeriod")
  Future<HttpResponse<AIMChartResponse<AIMResponse<List<RemoteExtensionItem>>>>>
      getExtensionPeriod(
    @Query("id") String id,
    @Query("year") int year,
    @Query("isEnglishLanguage") bool isEnglishLanguage,
  );
}
