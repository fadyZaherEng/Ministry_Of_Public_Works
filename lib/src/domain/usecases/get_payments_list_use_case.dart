import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_list_request.dart';
import 'package:aim/src/domain/entities/payments/payments_data.dart';
import 'package:aim/src/domain/repositories/payments_repository.dart';

class GetPaymentsListUseCase {
  final PaymentsRepository _paymentsRepository;

  GetPaymentsListUseCase(this._paymentsRepository);

  Future<DataState<PaymentsData>> call(PaymentsListRequest request) async {
    return _paymentsRepository.getPaymentsList(request);
  }
}
