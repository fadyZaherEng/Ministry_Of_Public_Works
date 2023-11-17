import 'package:aim/src/data/sources/remote/aim/project/entity/remote_attachment.dart';
import 'package:aim/src/domain/entities/payments/payment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_payment.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePayment extends Payment {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'phasestr')
  final String? projectPhase;
  @JsonKey(name: 'paymentAmount')
  final double? paymentAmount;
  @JsonKey(name: 'paymentVariance')
  final double? paymentVariance;

  @JsonKey(name: 'paymentDatestr')
  final String? paymentDatestr;
  @JsonKey(name: 'plannedPaymentDatestr')
  final String? plannedPaymentDate;
  @JsonKey(name: 'actualPaymentDatestr')
  final String? actualPaymentDate;
  @JsonKey(name: 'paymentStatusstr')
  final String? status;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'projectSector')
  final String? projectSector;
  @JsonKey(name: 'getAttachments')
  final List<RemoteAttachment>? attachments;

  const RemotePayment(
    this.id,
    this.projectName,
    this.agreementNumber,
    this.projectSector,
    this.title,
    this.projectPhase,
    this.paymentAmount,
    this.paymentDatestr,
    this.plannedPaymentDate,
    this.actualPaymentDate,
    this.status,
    this.attachments,
    this.paymentVariance,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          agreementNumber: agreementNumber ?? "",
          projectSector: projectSector ?? "",
          phase: projectPhase ?? "",
          status: status ?? "",
          title: title ?? "",
          paymentAmount: paymentAmount ?? 0.0,
    paymentDatestr: paymentDatestr ?? "",
          plannedPaymentDate: plannedPaymentDate ?? "",
          actualPaymentDate: actualPaymentDate ?? "",
          attachments: attachments ?? const [],
    paymentVariance: paymentVariance ?? 0.0,
        );

  factory RemotePayment.fromJson(Map<String, dynamic> json) =>
      _$RemotePaymentFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePaymentToJson(this);
}
