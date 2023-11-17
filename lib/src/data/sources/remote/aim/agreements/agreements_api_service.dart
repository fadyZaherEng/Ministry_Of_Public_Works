import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/entity/remote_agreement.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/entity/remote_agreements_data.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/request/agreements_request.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'agreements_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AgreementsApiService {
  factory AgreementsApiService(Dio dio) = _AgreementsApiService;

  @POST(getConsultantAgreementEndPoint)
  Future<HttpResponse<AIMResponse<RemoteAgreementsData>>> getAgreements(
      @Body() AgreementsRequest request);

  @GET("SupervisionServices/GetSupervisionServiceById/{agreementId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteAgreement>>>> getAgreementById(
      @Path("agreementId") String agreementId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

}
