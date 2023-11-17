import 'dart:io';

import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/payments/payments_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_request.dart';
import 'package:aim/src/domain/entities/dashboards/payments_chart.dart';
import 'package:aim/src/domain/entities/payments/payment.dart';
import 'package:aim/src/domain/entities/payments/payments_data.dart';
import 'package:aim/src/domain/repositories/payments_repository.dart';
import 'package:dio/dio.dart';

class PaymentsRepositoryImplementation extends PaymentsRepository {
  final PaymentsApiService _paymentsApiService;

  PaymentsRepositoryImplementation(this._paymentsApiService);

  @override
  Future<DataState<PaymentsData>> getPayments(PaymentsRequest request) async {
    try {
      final httpResponse = await _paymentsApiService.getPayments(request);

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
  Future<DataState<Payment>> getPaymentById(
      String paymentId, bool isEnglishLanguage) async {
    try {
      final httpResponse = await _paymentsApiService.getPaymentById(
          paymentId, isEnglishLanguage);

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
  Future<DataState<PaymentsChart>> getPaymentsChart(
      String phaseId, String sectorId,int color) async {
    try {
      final httpResponse =
          await _paymentsApiService.getPaymentsChart(phaseId, sectorId,color);

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
  Future<DataState<PaymentsData>> getPaymentsList(
      PaymentsListRequest request) async {
    try {
      final httpResponse =
      await _paymentsApiService.getPaymentsList(request);

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
