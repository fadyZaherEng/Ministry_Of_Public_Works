import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/warranties/entity/remote_warranties_data.dart';
import 'package:aim/src/data/sources/remote/aim/warranties/entity/remote_warranty.dart';
import 'package:aim/src/data/sources/remote/aim/warranties/request/warranties_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'warranties_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class WarrantiesApiService {
  factory WarrantiesApiService(Dio dio) = _WarrantiesApiService;

  @POST(getWarrantiesEndPoint)
  Future<HttpResponse<AIMResponse<RemoteWarrantiesData>>> getWarranties(
      @Body() WarrantiesRequest request);

  @GET("$getWarrantyByIdEndPoint/{warrantyId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteWarranty>>>> getWarrantyById(
      @Path("warrantyId") String warrantyId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

}
