import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/issues/issues_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_request.dart';
import 'package:aim/src/data/sources/remote/aim/overview/overview_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/entities/issues/issues_data.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:aim/src/domain/entities/overview/overview_data.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';
import 'package:aim/src/domain/repositories/overview_repository.dart';
import 'package:dio/dio.dart';

class OverviewRepositoryImplementation extends OverviewRepository {
  final OverviewApiService _overviewApiService;

  OverviewRepositoryImplementation(this._overviewApiService);


  @override
  Future<DataState<OverviewData>> getOverviewList(OverviewListRequest request) async {
    try {
      final httpResponse = await _overviewApiService.getOverviewList(request);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<String>>> getOverviewCards(String phaseId, String sectorId) async {
    try {
      final httpResponse = await _overviewApiService.getOverviewCards(phaseId,sectorId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }


  @override
  Future<DataState<OverviewChartByPhase>> getOverviewProjectsByPhase(String phaseId, String sectorId) async {
    try {
      final httpResponse = await _overviewApiService.getOverviewProjectsByPhase(phaseId,sectorId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<OverviewChartBySector>> getOverviewProjectsBySector(String phaseId, String sectorId) async {
    try {
      final httpResponse = await _overviewApiService.getOverviewProjectsBySector(phaseId,sectorId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<int>> getProjectsInProgress(String phaseId, String sectorId
      ) async {
    try {
      final httpResponse = await _overviewApiService.getProjectsInProgress(phaseId,sectorId);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }  }

}
