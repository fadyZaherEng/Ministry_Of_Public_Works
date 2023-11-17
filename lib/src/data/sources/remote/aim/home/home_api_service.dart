import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/home/entity/remote_home.dart';
import 'package:aim/src/data/sources/remote/aim/home/entity/remote_user.dart';
import 'package:aim/src/data/sources/remote/aim/home/entity/remote_user_permission.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(getHomeCount)
  Future<HttpResponse<AIMResponse<RemoteHome>>> getHomeCounts();

  @GET(getHomeUserName)
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteUser>>>> getUser();

  @GET(getUserPermissionEndPoint)
  Future<HttpResponse<AIMResponse<RemoteUserPermission>>> getUserPermission(
      @Query("isEnglishLanguage") bool isEnglishLanguage);
}
