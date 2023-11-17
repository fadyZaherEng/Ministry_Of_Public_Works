import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/issues/issues_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_request.dart';
import 'package:aim/src/data/sources/remote/aim/overview/overview_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/package/package_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/package/request/package_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/entities/issues/issues_data.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:aim/src/domain/entities/overview/overview_data.dart';
import 'package:aim/src/domain/entities/package/package_analysis_chart.dart';
import 'package:aim/src/domain/entities/package/package_circle_chart.dart';
import 'package:aim/src/domain/entities/package/package_data.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';
import 'package:aim/src/domain/repositories/overview_repository.dart';
import 'package:aim/src/domain/repositories/package_repository.dart';
import 'package:dio/dio.dart';

class PackageRepositoryImplementation extends PackageRepository {
  final PackageApiService _packageApiService;

  PackageRepositoryImplementation(this._packageApiService);

  @override
  Future<DataState<PackageData>> getPackageList(
      PackageListRequest request) async {
    try {
      final httpResponse = await _packageApiService.getPackageList(request);

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
  Future<DataState<PackageAnalysisChart>> getPackageAnalysisChart(
    String sectorId,int color) async {
    try {
      final httpResponse =
          await _packageApiService.getPackageAnalysisChart(sectorId,color);

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
  Future<DataState<PackageCircleChart>> getPackageMinistryChart(
       String sectorId,int color) async {
    try {
      final httpResponse =
          await _packageApiService.getPackageMinistryChart( sectorId,color);

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
