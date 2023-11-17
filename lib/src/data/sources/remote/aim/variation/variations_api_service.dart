import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_chart_response.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/variation/entity/remote_variation.dart';
import 'package:aim/src/data/sources/remote/aim/variation/entity/remote_variation_circle_chart.dart';
import 'package:aim/src/data/sources/remote/aim/variation/entity/remote_variations_chart.dart';
import 'package:aim/src/data/sources/remote/aim/variation/entity/remote_variations_data.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'variations_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class VariationsApiService {
  factory VariationsApiService(Dio dio) = _VariationsApiService;

  @POST(getVariationsEndPoint)
  Future<HttpResponse<AIMResponse<RemoteVariationsData>>> getVariations(
      @Body() VariationsRequest request);

  @GET("$getVariationByIdEndPoint/{variationId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteVariation>>>>
      getVariationById(@Path("variationId") String variationId,
          @Query("isEnglishLanguage") bool isEnglishLanguage);

  @POST("Dashboards/VariationOrderList")
  Future<HttpResponse<AIMResponse<RemoteVariationsData>>> getVariationsList(
    @Body() VariationsListRequest request,
  );

  @GET("Dashboards/VariationOrderChart")
  Future<HttpResponse<AIMChartResponse<AIMResponse<RemoteVariationsChart>>>>
      getVariationsChart(
    @Query("phase") String phaseId,
    @Query("sector") String sectorId,
  );

  @GET("Dashboards/VariationOrdersMinistryChart")
  Future<HttpResponse<AIMChartResponse<RemoteVariationCircleChart>>>
      getVariationsCircleChart(
    @Query("phase") String phaseId,
    @Query("sector") String sectorId,
  );
}
