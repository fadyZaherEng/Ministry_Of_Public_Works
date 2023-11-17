import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/warranties/request/warranties_request.dart';
import 'package:aim/src/data/sources/remote/aim/warranties/warranties_api_service.dart';
import 'package:aim/src/domain/entities/warranties/warranties_data.dart';
import 'package:aim/src/domain/entities/warranties/warranty.dart';
import 'package:aim/src/domain/repositories/warranties_repository.dart';
import 'package:dio/dio.dart';

class WarrantiesRepositoryImplementation extends WarrantiesRepository {
  final WarrantiesApiService _warrantiesApiService;

  WarrantiesRepositoryImplementation(this._warrantiesApiService);

  @override
  Future<DataState<WarrantiesData>> getWarranties(
      WarrantiesRequest request) async {
    try {
      final httpResponse = await _warrantiesApiService.getWarranties(request);
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
  Future<DataState<Warranty>> getWarrantyById(
      String warrantyId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _warrantiesApiService.getWarrantyById(
          warrantyId, isEnglishLanguage);

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
