import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/entity/remote_penalties_chart.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/penalties_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_request.dart';
import 'package:aim/src/domain/entities/penalties/penalties_data.dart';
import 'package:aim/src/domain/entities/penalties/penalty.dart';
import 'package:aim/src/domain/entities/project/project_data.dart';
import 'package:aim/src/domain/repositories/penalties_repository.dart';
import 'package:dio/dio.dart';

class PenaltiesRepositoryImplementation extends PenaltiesRepository {
  final PenaltiesApiService _penaltiesApiService;

  PenaltiesRepositoryImplementation(this._penaltiesApiService);

  @override
  Future<DataState<PenaltiesData>> getPenalties(
      PenaltiesRequest request) async {
    try {
      final httpResponse = await _penaltiesApiService.getPenalties(request);

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
  Future<DataState<Penalty>> getPenaltyById(
      String penaltyId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _penaltiesApiService.getPenaltyById(
          penaltyId, isEnglishLanguage);

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
  Future<DataState<RemotePenaltiesChart>> getPenaltiesChartDesign(
      String sectorId,int color) async {
    try {
      final httpResponse =
          await _penaltiesApiService.getPenaltiesChartDesign(sectorId,color);

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
  Future<DataState<RemotePenaltiesChart>> getPenaltiesChartExecution(
      String sectorId,int color) async {
    try {
      final httpResponse =
          await _penaltiesApiService.getPenaltiesChartExecution(sectorId,color);

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
  Future<DataState<ProjectData>> getPenaltiesList(
      PenaltiesListRequest request) async {
    try {
      final httpResponse = await _penaltiesApiService.getPenaltiesList(request);

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
