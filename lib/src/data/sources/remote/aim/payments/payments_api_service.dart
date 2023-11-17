import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_chart_response.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/payments/entity/remote_payment.dart';
import 'package:aim/src/data/sources/remote/aim/payments/entity/remote_payments_chart.dart';
import 'package:aim/src/data/sources/remote/aim/payments/entity/remote_payments_data.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'payments_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class PaymentsApiService {
  factory PaymentsApiService(Dio dio) = _PaymentsApiService;

  @POST(getPaymentsEndPoint)
  Future<HttpResponse<AIMResponse<RemotePaymentsData>>> getPayments(
      @Body() PaymentsRequest request);

  @GET("$getPaymentByIdEndPoint/{paymentId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemotePayment>>>> getPaymentById(
      @Path("paymentId") String paymentId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @POST("Dashboards/PaymentsList")
  Future<HttpResponse<AIMResponse<RemotePaymentsData>>> getPaymentsList(
    @Body() PaymentsListRequest request,
  );

  @GET("Dashboards/PaymentsChart")
  Future<HttpResponse<AIMChartResponse<RemotePaymentsChart>>> getPaymentsChart(
    @Query("phase") String phaseId,
    @Query("sector") String sectorId,
    @Query("Color") int color,
  );
}
