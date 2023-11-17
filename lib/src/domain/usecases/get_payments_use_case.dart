import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_request.dart';
import 'package:aim/src/domain/entities/payments/payments_data.dart';
import 'package:aim/src/domain/repositories/payments_repository.dart';

class GetPaymentsUseCase {
  final PaymentsRepository _paymentsRepository;

  GetPaymentsUseCase(this._paymentsRepository);

  Future<DataState<PaymentsData>> call(PaymentsRequest request) async {
    return _paymentsRepository.getPayments(request);
  }
}
