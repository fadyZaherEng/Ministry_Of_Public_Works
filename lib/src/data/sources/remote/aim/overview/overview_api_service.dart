import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_chart_response.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/overview/entity/remote_overview_chart_by_phase.dart';
import 'package:aim/src/data/sources/remote/aim/overview/entity/remote_overview_chart_by_sector.dart';
import 'package:aim/src/data/sources/remote/aim/overview/entity/remote_overview_data.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'overview_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class OverviewApiService {
  factory OverviewApiService(Dio dio) = _OverviewApiService;

  @POST("Dashboards/OverviewList")
  Future<HttpResponse<AIMResponse<RemoteOverviewData>>> getOverviewList(
      @Body() OverviewListRequest request,
      );
  @GET("Dashboards/OverViewProjectsInProgress")
  Future<HttpResponse<AIMChartResponse<AIMResponse<int>>>>
  getProjectsInProgress(
      @Query("phase") String phaseId,
      @Query("sector") String sectorId,
      );
  @GET("Dashboards/OverViewProjectsByPhase")
  Future<HttpResponse<AIMChartResponse<AIMResponse<RemoteOverviewChartByPhase>>>>
  getOverviewProjectsByPhase(
      @Query("phase") String phaseId,
      @Query("sector") String sectorId,
      );
  @GET("Dashboards/OverViewProjectsBySector")
  Future<HttpResponse<AIMChartResponse<AIMResponse<RemoteOverviewChartBySector>>>>
  getOverviewProjectsBySector(
      @Query("phase") String phaseId,
      @Query("sector") String sectorId,
      );

  @GET("Dashboards/OverViewCards")
  Future<HttpResponse<AIMChartResponse<AIMResponse<List<String>>>>>
  getOverviewCards(
      @Query("phase") String phaseId,
      @Query("sector") String sectorId,
      );

}
