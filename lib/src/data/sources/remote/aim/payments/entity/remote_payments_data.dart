import 'package:aim/src/data/sources/remote/aim/payments/entity/remote_payment.dart';
import 'package:aim/src/domain/entities/payments/payments_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_payments_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePaymentsData extends PaymentsData {
  @JsonKey(name: 'projectPaymentsList')
  final List<RemotePayment>? payments;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemotePaymentsData(
    this.payments,
    this.recordsTotal,
  ) : super(
          payments: payments ?? [],
          recordsTotal: recordsTotal ?? 0,
        );

  factory RemotePaymentsData.fromJson(Map<String, dynamic> json) =>
      _$RemotePaymentsDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePaymentsDataToJson(this);
}
