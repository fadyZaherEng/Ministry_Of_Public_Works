import 'package:aim/src/domain/entities/payments/payment.dart';
import 'package:equatable/equatable.dart';

class PaymentsData extends Equatable {
  final List<Payment>? payments;
  final int? recordsTotal;

  const PaymentsData({
    this.payments = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        payments,
        recordsTotal,
      ];
}
