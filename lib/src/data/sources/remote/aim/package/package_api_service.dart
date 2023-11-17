import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_chart_response.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/overview/entity/remote_overview_data.dart';
import 'package:aim/src/data/sources/remote/aim/package/entity/remote_package_analysis_chart.dart';
import 'package:aim/src/data/sources/remote/aim/package/entity/remote_package_circle_chart.dart';
import 'package:aim/src/data/sources/remote/aim/package/entity/remote_package_data.dart';
import 'package:aim/src/data/sources/remote/aim/package/request/package_list_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'package_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PackageApiService {
  factory PackageApiService(Dio dio) = _PackageApiService;

  @POST("Dashboards/FinalDataPackageList")
  Future<HttpResponse<AIMResponse<RemotePackageData>>> getPackageList(
      @Body() PackageListRequest request,
      );
  @GET("Dashboards/FinalDataPackageAnalysisChart")
  Future<HttpResponse<AIMChartResponse<RemotePackageAnalysisChart>>>
  getPackageAnalysisChart(
      @Query("sector") String sectorId,
      @Query("Color") int color,
      );
  @GET("Dashboards/FinalDataPackageMinistryChart")
  Future<HttpResponse<AIMChartResponse<RemotePackageCircleChart>>>
  getPackageMinistryChart(
      @Query("sector") String sectorId,
      @Query("Color") int color,
      );
}
