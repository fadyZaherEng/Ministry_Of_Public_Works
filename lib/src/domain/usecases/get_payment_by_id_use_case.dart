import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/entities/payments/payment.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';
import 'package:aim/src/domain/repositories/payments_repository.dart';

class GetPaymentByIdUseCase {
  final PaymentsRepository _paymentsRepository;

  GetPaymentByIdUseCase(this._paymentsRepository);

  Future<DataState<Payment>> call(String paymentId, bool isEnglishLanguage) {
    return _paymentsRepository.getPaymentById(paymentId, isEnglishLanguage);
  }
}
