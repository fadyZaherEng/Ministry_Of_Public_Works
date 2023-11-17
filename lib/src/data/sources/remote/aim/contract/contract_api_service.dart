import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_chart_response.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/contract/entity/remote_approved_analysis.dart';
import 'package:aim/src/data/sources/remote/aim/contract/entity/remote_contract_data.dart';
import 'package:aim/src/data/sources/remote/aim/contract/entity/remote_delay_analysis.dart';
import 'package:aim/src/data/sources/remote/aim/contract/entity/remote_operation_analysis.dart';
import 'package:aim/src/data/sources/remote/aim/contract/request/contract_list_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'contract_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ContractApiService {
  factory ContractApiService(Dio dio) = _ContractApiService;

  @POST("Dashboards/PercentageOfCompletionList")
  Future<HttpResponse<AIMResponse<RemoteContractData>>> getContractList(
    @Body() ContractListRequest request,
  );

  @GET("Dashboards/ApprovedAnalysis")
  Future<HttpResponse<AIMChartResponse<RemoteApprovedAnalysis>>>
      getApprovedAnalysis(
    @Query("sector") String sectorId,
  );

  @GET("Dashboards/DelayAnlysis")
  Future<HttpResponse<AIMChartResponse<AIMResponse<RemoteDelayAnalysis>>>>
      getDelayAnalysis();

  @GET("Dashboards/OperationAndMaintenanceAnalysis")
  Future<HttpResponse<AIMChartResponse<AIMResponse<RemoteOperationAnalysis>>>>
      getOperationAnalysis();
}
