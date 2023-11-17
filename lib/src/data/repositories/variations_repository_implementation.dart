import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_request.dart';
import 'package:aim/src/data/sources/remote/aim/variation/variations_api_service.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/dashboards/variations_chart.dart';
import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:aim/src/domain/entities/variations/variations_data.dart';
import 'package:aim/src/domain/repositories/variations_repository.dart';
import 'package:dio/dio.dart';

class VariationsRepositoryImplementation extends VariationsRepository {
  final VariationsApiService _variationsApiService;

  VariationsRepositoryImplementation(this._variationsApiService);

  @override
  Future<DataState<VariationsDate>> getVariations(
      VariationsRequest request) async {
    try {
      final httpResponse = await _variationsApiService.getVariations(request);
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
  Future<DataState<Variation>> getVariationById(
      String variationId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _variationsApiService.getVariationById(
          variationId, isEnglishLanguage);

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
  Future<DataState<CircleChart>> getVariationCircleChart(
      String phaseId, String sectorId) async {
    try {
      final httpResponse = await _variationsApiService.getVariationsCircleChart(
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
  Future<DataState<VariationsChart>> getVariationsChart(
      String phaseId, String sectorId) async {
    try {
      final httpResponse = await _variationsApiService.getVariationsChart(
        phaseId,
        sectorId,
      );
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
  Future<DataState<VariationsDate>> getVariationsList(
      VariationsListRequest request) async {
    try {
      final httpResponse =
          await _variationsApiService.getVariationsList(request);
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
