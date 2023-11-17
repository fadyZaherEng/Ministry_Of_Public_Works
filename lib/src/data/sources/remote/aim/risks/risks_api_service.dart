import 'dart:ffi';

import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_chart_response.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_analysis_chart_by_phase.dart';
import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_analysis_chart_by_sector.dart';
import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_risk.dart';
import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_risks_data.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'risks_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RisksApiService {
  factory RisksApiService(Dio dio) = _RisksApiService;

  @POST(getRisksEndPoint)
  Future<HttpResponse<AIMResponse<RemoteRisksData>>> getRisks(
      @Body() RisksRequest request);

  @GET("$getRiskByIdEndPoint/{riskId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteRisk>>>> getRiskById(
      @Path("riskId") String riskId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @POST(getRisksListEndPoint)
  Future<HttpResponse<AIMResponse<RemoteRisksData>>> getRisksList(
    @Body() RisksListRequest request,
  );

  @GET(getRiskAnalysisChartBySectorEndPoint)
  Future<HttpResponse<AIMChartResponse<RemoteAnalysisChartBySector>>>
      getRiskAnalysisChartBySector(
    @Query("phase") String phaseId,
    @Query("sector") String sectorId,
  );

  @GET(getRiskAnalysisChartByPhaseEndPoint)
  Future<HttpResponse<AIMChartResponse<RemoteAnalysisChartByPhase>>>
      getRiskAnalysisChartByPhase(
    @Query("phase") String phaseId,
    @Query("sector") String sectorId,
  );

  @GET(getRiskCountsEndPoint)
  Future<HttpResponse<AIMChartResponse<List<int>>>> getRiskCounts(
    @Query("phase") String phaseId,
    @Query("sector") String sectorId,
  );
}
