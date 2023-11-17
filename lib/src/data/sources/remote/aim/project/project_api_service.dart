import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/project/entity/remote_details_phase.dart';
import 'package:aim/src/data/sources/remote/aim/project/entity/remote_project_data.dart';
import 'package:aim/src/data/sources/remote/aim/project/entity/remote_project_details.dart';
import 'package:aim/src/data/sources/remote/aim/project/request/projects_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'project_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ProjectApiService {
  factory ProjectApiService(Dio dio) = _ProjectApiService;

  @POST(getProjectsEndPoint)
  Future<HttpResponse<AIMResponse<RemoteProjectData>>> getProjects(
      @Body() ProjectsRequest request);

  @GET("$getProject/{projectId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteProjectDetails>>>> getProjectDetails(
      @Path("projectId") String projectId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET("$getProjectPhasesByIdEndPoint/{projectId}")
  Future<HttpResponse<AIMResponse<AIMResponse<List<RemoteProjectDetails>>>>> getProjectPhases(
      @Path("projectId") String projectId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET("$getProjectPhaseByIdEndPoint/{projectId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteProjectDetails>>>> getProjectPhase(
      @Path("projectId") String projectId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET("Projects/GetProjectPhases/{projectId}")
  Future<HttpResponse<List<RemoteDetailsPhase>>> getProjectDetailsPhases(
      @Path("projectId") String projectId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);


}
