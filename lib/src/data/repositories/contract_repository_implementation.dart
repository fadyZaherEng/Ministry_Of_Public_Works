import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/contract/contract_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/contract/request/contract_list_request.dart';
import 'package:aim/src/domain/entities/contract/approved_analysis.dart';
import 'package:aim/src/domain/entities/contract/contract_data.dart';
import 'package:aim/src/domain/entities/contract/delay_analysis.dart';
import 'package:aim/src/domain/entities/contract/operation_analysis.dart';
import 'package:aim/src/domain/repositories/contract_repository.dart';
import 'package:dio/dio.dart';

class ContractRepositoryImplementation extends ContractRepository {
  final ContractApiService _contractApiService;

  ContractRepositoryImplementation(this._contractApiService);

  @override
  Future<DataState<ContractData>> getContractList(ContractListRequest request) async {
    try {
      final httpResponse = await _contractApiService.getContractList(request);

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
  Future<DataState<ApprovedAnalysis>> getApprovedAnalysis(String sectorId) async {
    try {
      final httpResponse = await _contractApiService.getApprovedAnalysis(sectorId);

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
  Future<DataState<DelayAnalysis>> getDelayAnalysis() async {
    try {
      final httpResponse = await _contractApiService.getDelayAnalysis();

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
  Future<DataState<OperationAnalysis>> getOperationAnalysis() async {
    try {
      final httpResponse = await _contractApiService.getOperationAnalysis();

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
