import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/milestones/entity/remote_milestone.dart';
import 'package:aim/src/data/sources/remote/aim/milestones/entity/remote_milestones_data.dart';
import 'package:aim/src/data/sources/remote/aim/milestones/request/milestones_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'milestones_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class MilestonesApiService {
  factory MilestonesApiService(Dio dio) = _MilestonesApiService;

  @POST(getProjectMilestonesEndPoint)
  Future<HttpResponse<AIMResponse<RemoteMilestonesData>>> getMilestones(
      @Body() MilestonesRequest request);


  @GET("$getMilestoneByIdEndPoint/{milestoneId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteMilestone>>>> getMilestoneById(
      @Path("milestoneId") String milestoneId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

}
