import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_chart_response.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/entity/remote_penalties_chart.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/entity/remote_penalties_data.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/entity/remote_penalty.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_request.dart';
import 'package:aim/src/data/sources/remote/aim/project/entity/remote_project_data.dart';
import 'package:aim/src/domain/entities/dashboards/penalties_chart.dart';
import 'package:aim/src/domain/entities/project/project_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'penalties_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PenaltiesApiService {
  factory PenaltiesApiService(Dio dio) = _PenaltiesApiService;

  @POST(getPenaltiesEndPoint)
  Future<HttpResponse<AIMResponse<RemotePenaltiesData>>> getPenalties(
      @Body() PenaltiesRequest request);

  @GET("$getPenaltyByIdEndPoint/{penaltyId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemotePenalty>>>> getPenaltyById(
      @Path("penaltyId") String penaltyId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @POST("Dashboards/PenaltiesList")
  Future<HttpResponse<AIMResponse<RemoteProjectData>>> getPenaltiesList(
    @Body() PenaltiesListRequest request,
  );

  @GET("Dashboards/PenalitesChartDesign")
  Future<HttpResponse<AIMChartResponse<AIMResponse<RemotePenaltiesChart>>>>
      getPenaltiesChartDesign(
    @Query("sector") String sectorId,
    @Query("Color") int color,
  );

  @GET("Dashboards/PenalitesChartExecution")
  Future<HttpResponse<AIMChartResponse<AIMResponse<RemotePenaltiesChart>>>>
      getPenaltiesChartExecution(
    @Query("sector") String sectorId,
    @Query("Color") int color,
  );
}
