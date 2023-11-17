import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/analysis_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/request/analysis_list_request.dart';
import 'package:aim/src/domain/entities/analysis/analysis_data.dart';
import 'package:aim/src/domain/entities/analysis/extension_item.dart';
import 'package:aim/src/domain/repositories/analysis_repository.dart';
import 'package:dio/dio.dart';

class AnalysisRepositoryImplementation extends AnalysisRepository {
  final AnalysisApiService _analysisApiService;

  AnalysisRepositoryImplementation(this._analysisApiService);

  @override
  Future<DataState<AnalysisData>> getAnalysisList(AnalysisListRequest request) async {
    try {
      final httpResponse = await _analysisApiService.getAnalysisList(request);

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
  Future<DataState<List<ExtensionItem>>> getExtensionPeriod(String sectorId, int year, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _analysisApiService.getExtensionPeriod(sectorId,year,isEnglishLanguage);

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

}
