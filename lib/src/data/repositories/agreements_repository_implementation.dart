import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/agreements_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/request/agreements_request.dart';
import 'package:aim/src/domain/entities/agreement/agreement.dart';
import 'package:aim/src/domain/entities/agreement/agreements_data.dart';
import 'package:aim/src/domain/repositories/agreements_repository.dart';
import 'package:dio/dio.dart';

class AgreementsRepositoryImplementation extends AgreementsRepository {
  final AgreementsApiService _agreementsApiService;

  AgreementsRepositoryImplementation(this._agreementsApiService);

  @override
  Future<DataState<AgreementsData>> getAgreements(
      AgreementsRequest request) async {
    try {
      final httpResponse = await _agreementsApiService.getAgreements(request);
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
  Future<DataState<Agreement>> getAgreementById(
      String agreementId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _agreementsApiService.getAgreementById(
        agreementId,
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
}
