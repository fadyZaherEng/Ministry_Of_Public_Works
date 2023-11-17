import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/issues/issues_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/entities/issues/issues_data.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';
import 'package:dio/dio.dart';

class IssuesRepositoryImplementation extends IssuesRepository {
  final IssuesApiService _issuesApiService;

  IssuesRepositoryImplementation(this._issuesApiService);

  @override
  Future<DataState<IssuesData>> getIssues(IssuesRequest request) async {
    try {
      final httpResponse = await _issuesApiService.getIssues(request);

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
  Future<DataState<Issue>> getIssueById(
      String issueId, bool isEnglishLanguage) async {
    try {
      final httpResponse =
          await _issuesApiService.getIssueById(issueId, isEnglishLanguage);

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
  Future<DataState<AnalysisChartByPhase>> getIssueAnalysisChartByPhase(
      String phaseId, String sectorId) async {
    try {
      final httpResponse =
          await _issuesApiService.getIssuesAnalysisChartByPhase(
        phaseId,
        sectorId,
      );

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
  Future<DataState<AnalysisChartBySector>> getIssueAnalysisChartBySector(
      String phaseId, String sectorId) async {
    try {
      final httpResponse =
          await _issuesApiService.getIssuesAnalysisChartBySector(
        phaseId,
        sectorId,
      );

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
  Future<DataState<List<int>>> getIssueCounts(
      String phaseId, String sectorId) async {
    try {
      final httpResponse = await _issuesApiService.getIssuesCounts(
        phaseId,
        sectorId,
      );
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
  Future<DataState<IssuesData>> getIssuesList(IssuesListRequest request) async {
    try {
      final httpResponse = await _issuesApiService.getIssuesList(request);

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
}
