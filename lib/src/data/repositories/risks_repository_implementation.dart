import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_request.dart';
import 'package:aim/src/data/sources/remote/aim/risks/risks_api_service.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:aim/src/domain/entities/risks/risks_data.dart';
import 'package:aim/src/domain/repositories/risks_repository.dart';
import 'package:dio/dio.dart';

class RisksRepositoryImplementation extends RisksRepository {
  final RisksApiService _risksApiService;

  RisksRepositoryImplementation(this._risksApiService);

  @override
  Future<DataState<RisksData>> getRisks(RisksRequest request) async {
    try {
      final httpResponse = await _risksApiService.getRisks(request);

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
  Future<DataState<Risk>> getRiskById(
      String riskId, bool isEnglishLanguage) async {
    try {
      final httpResponse =
          await _risksApiService.getRiskById(riskId, isEnglishLanguage);

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
  Future<DataState<RisksData>> getRisksList(RisksListRequest request) async {
    try {
      final httpResponse = await _risksApiService.getRisksList(request);

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
  Future<DataState<AnalysisChartBySector>> getRiskAnalysisChartBySector(
      String phaseId, String sectorId) async {
    try {
      final httpResponse = await _risksApiService.getRiskAnalysisChartBySector(
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
  Future<DataState<AnalysisChartByPhase>> getRiskAnalysisChartByPhase(
      String phaseId, String sectorId) async {
    try {
      final httpResponse = await _risksApiService.getRiskAnalysisChartByPhase(
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
  Future<DataState<List<int>>> getRiskCounts(
      String phaseId, String sectorId) async {
    try {
      final httpResponse = await _risksApiService.getRiskCounts(
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
}
