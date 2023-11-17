import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/design/design_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/design/request/design_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/issues/issues_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_request.dart';
import 'package:aim/src/data/sources/remote/aim/overview/overview_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/design/design_chart.dart';
import 'package:aim/src/domain/entities/design/design_data.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/entities/issues/issues_data.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:aim/src/domain/entities/overview/overview_data.dart';
import 'package:aim/src/domain/repositories/design_repository.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';
import 'package:aim/src/domain/repositories/overview_repository.dart';
import 'package:dio/dio.dart';

class DesignRepositoryImplementation extends DesignRepository {
  final DesignApiService _designApiService;

  DesignRepositoryImplementation(this._designApiService);

  @override
  Future<DataState<DesignData>> getDesignList(DesignListRequest request) async {
    try {
      final httpResponse = await _designApiService.getDesignList(request);
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
  Future<DataState<DesignChart>> getDesignChart(String sectorId) async {
    try {
      final httpResponse =
          await _designApiService.getDesignChart( sectorId);
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
  Future<DataState<CircleChart>> getDesignMinistry(String sectorId) async {
    try {
      final httpResponse =
          await _designApiService.getDesignMinistry( sectorId);
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
