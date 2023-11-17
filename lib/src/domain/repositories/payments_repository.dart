import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_request.dart';
import 'package:aim/src/domain/entities/dashboards/payments_chart.dart';
import 'package:aim/src/domain/entities/payments/payment.dart';
import 'package:aim/src/domain/entities/payments/payments_data.dart';

abstract class PaymentsRepository {
  Future<DataState<PaymentsData>> getPayments(PaymentsRequest request);

  Future<DataState<Payment>> getPaymentById(
    String paymentId,
    bool isEnglishLanguage,
  );

  Future<DataState<PaymentsData>> getPaymentsList(PaymentsListRequest request);

  Future<DataState<PaymentsChart>> getPaymentsChart(
      String phaseId,
      String sectorId,
      int color,
      );
}
