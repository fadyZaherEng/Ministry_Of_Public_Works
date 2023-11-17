import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_chart_response.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/issues/entity/remote_issue.dart';
import 'package:aim/src/data/sources/remote/aim/issues/entity/remote_issues_analysis_chart_by_phase.dart';
import 'package:aim/src/data/sources/remote/aim/issues/entity/remote_issues_analysis_chart_by_sector.dart';
import 'package:aim/src/data/sources/remote/aim/issues/entity/remote_issues_data.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_request.dart';
import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_analysis_chart_by_sector.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'issues_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class IssuesApiService {
  factory IssuesApiService(Dio dio) = _IssuesApiService;

  @POST(getProjectIssuesEndPoint)
  Future<HttpResponse<AIMResponse<RemoteIssuesData>>> getIssues(
      @Body() IssuesRequest request);

  @GET("$getIssuesByIdEndPoint/{issueId}")
  Future<HttpResponse<AIMResponse<AIMResponse<RemoteIssue>>>> getIssueById(
      @Path("issueId") String issueId,
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @POST("Dashboards/IssuesList")
  Future<HttpResponse<AIMResponse<RemoteIssuesData>>> getIssuesList(
    @Body() IssuesListRequest request,
  );

  @GET("Dashboards/IssuesAnalysisChartBySector")
  Future<HttpResponse<AIMChartResponse<RemoteIssuesAnalysisChartBySector>>>
      getIssuesAnalysisChartBySector(
    @Query("phase") String phaseId,
    @Query("sector") String sectorId,
  );

  @GET("Dashboards/IssuesAnalysisChartByPhase")
  Future<HttpResponse<AIMChartResponse<RemoteIssuesAnalysisChartByPhase>>>
      getIssuesAnalysisChartByPhase(
    @Query("phase") String phaseId,
    @Query("sector") String sectorId,
  );

  @GET("Dashboards/IssuesGetCounts")
  Future<HttpResponse<AIMChartResponse<List<int>>>> getIssuesCounts(
    @Query("phase") String phaseId,
    @Query("sector") String sectorId,
  );
}
