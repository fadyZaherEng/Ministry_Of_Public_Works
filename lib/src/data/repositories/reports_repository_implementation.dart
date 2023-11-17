import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/reports/reports_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/reports/request/reports_request.dart';
import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:aim/src/domain/entities/reports/reports_data.dart';
import 'package:aim/src/domain/repositories/reports_repository.dart';
import 'package:dio/dio.dart';

class ReportsRepositoryImplementation extends ReportsRepository {
  final ReportsApiService _reportsApiService;

  ReportsRepositoryImplementation(
    this._reportsApiService,
  );

  @override
  Future<DataState<ReportsData>> getReports(ReportsRequest request) async {
    try {
      final httpResponse = await _reportsApiService.getReports(request);

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
  Future<DataState<String>> getReportPDF(
      String reportId, bool isEnglishLanguage) async {
    try {
      final httpResponse =
          await _reportsApiService.getReportPDF(reportId, isEnglishLanguage);

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
  Future<DataState<Report>> getReportById(
      String reportId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _reportsApiService.getReportById(
        reportId,
        isEnglishLanguage,
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
  Future<DataState<String>> getPrintUrl() async {
    try {
      final httpResponse = await _reportsApiService.getPrintUrl();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data ?? '');
      } else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
