import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_chart_response.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/design/entity/remote_design_chart.dart';
import 'package:aim/src/data/sources/remote/aim/design/entity/remote_design_circle_chart.dart';
import 'package:aim/src/data/sources/remote/aim/design/entity/remote_design_data.dart';
import 'package:aim/src/data/sources/remote/aim/design/request/design_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/overview/entity/remote_overview_chart_by_phase.dart';
import 'package:aim/src/data/sources/remote/aim/overview/entity/remote_overview_chart_by_sector.dart';
import 'package:aim/src/data/sources/remote/aim/overview/entity/remote_overview_data.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'design_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class DesignApiService {
  factory DesignApiService(Dio dio) = _DesignApiService;

  @POST("Dashboards/DesignProcessList")
  Future<HttpResponse<AIMResponse<RemoteDesignData>>> getDesignList(
      @Body() DesignListRequest request,
      );

  @GET("Dashboards/DesignMinistryChart")
  Future<HttpResponse<AIMChartResponse<RemoteDesignCircleChart>>>
  getDesignMinistry(
      @Query("sector") String sectorId,
      );
  @GET("Dashboards/DesignChart")
  Future<HttpResponse<AIMResponse<AIMChartResponse<RemoteDesignChart>>>>
  getDesignChart(
      @Query("sector") String sectorId,
      );

}
