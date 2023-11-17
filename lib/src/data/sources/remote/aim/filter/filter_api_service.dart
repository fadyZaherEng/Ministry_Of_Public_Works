import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/data/sources/remote/aim/aim_response.dart';
import 'package:aim/src/data/sources/remote/aim/filter/entity/remote_end_user.dart';
import 'package:aim/src/data/sources/remote/aim/filter/entity/remote_month.dart';
import 'package:aim/src/data/sources/remote/aim/filter/entity/remote_penalty_type.dart';
import 'package:aim/src/data/sources/remote/aim/filter/entity/remote_phase.dart';
import 'package:aim/src/data/sources/remote/aim/filter/entity/remote_project_type.dart';
import 'package:aim/src/data/sources/remote/aim/filter/entity/remote_status.dart';
import 'package:aim/src/data/sources/remote/aim/filter/entity/remote_warranty_type.dart';
import 'package:aim/src/data/sources/remote/aim/filter/entity/remote_year.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'filter_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class FilterApiService {
  factory FilterApiService(Dio dio) = _FilterApiService;

  @GET(getProjectPhaseEndPoint)
  Future<HttpResponse<AIMResponse<List<RemotePhase>>>> getPhases(
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET(getProjectTypesEndPoint)
  Future<HttpResponse<AIMResponse<List<RemoteProjectType>>>> getProjectTypes(
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET(getEndUsersEndPoint)
  Future<HttpResponse<List<RemoteEndUser>>> getEndUsers(
      @Query("isEnglishLanguage") bool isEnglishLanguage);


  @GET(getMonthsEndPoint)
  Future<HttpResponse<AIMResponse<List<RemoteMonth>>>> getMonths(
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET(getYearsEndPoint)
  Future<HttpResponse<AIMResponse<List<RemoteYear>>>> getYears(
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET(getPenaltiesTypes)
  Future<HttpResponse<AIMResponse<List<RemotePenaltyType>>>> getPenaltyTypes(
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET(getProjectCenterStatus)
  Future<HttpResponse<AIMResponse<List<RemoteStatus>>>> getProjectStatus(
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET(getProjectPaymentStatus)
  Future<HttpResponse<AIMResponse<List<RemoteStatus>>>> getPaymentStatus(
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET(getImpactOnCostStatusEndPoint)
  Future<HttpResponse<AIMResponse<List<RemoteStatus>>>> getImpactOnCostStatus(
      @Query("isEnglishLanguage") bool isEnglishLanguage);

  @GET(getWarrantiesTypes)
  Future<HttpResponse<AIMResponse<List<RemoteWarrantyType>>>> getWarrantyTypes(
      @Query("isEnglishLanguage") bool isEnglishLanguage,
      );
}
