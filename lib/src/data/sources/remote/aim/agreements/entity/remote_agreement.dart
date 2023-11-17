import 'package:aim/src/domain/entities/agreement/agreement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_agreement.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteAgreement extends Agreement {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'projectSector')
  final String? projectSector;
  @JsonKey(name: 'supervisionServiceContractNumber')
  final String? supervisionServiceContractNumber;
  @JsonKey(name: 'projectEngineerEmail')
  final String? projectEngineerEmail;
  @JsonKey(name: 'projectEngineerName')
  final String? projectEngineerName;
  @JsonKey(name: 'projectEngineerPhoneNumber')
  final String? projectEngineerPhoneNumber;
  @JsonKey(name: 'beneficiaryName')
  final String? beneficiaryName;
  @JsonKey(name: 'projectEngineerFax')
  final String? projectEngineerFax;
  @JsonKey(name: 'deputyProjectEngineerName')
  final String? deputyProjectEngineerName;
  @JsonKey(name: 'deputyProjectEngineerPhoneNumber')
  final String? deputyProjectEngineerPhoneNumber;
  @JsonKey(name: 'deputyProjectEngineerEmail')
  final String? deputyProjectEngineerEmail;
  @JsonKey(name: 'projectNumberFinancial')
  final String? projectNumberFinancial;
  @JsonKey(name: 'consultantName')
  final String? consultantName;
  @JsonKey(name: 'contractorName')
  final String? contractorName;
  @JsonKey(name: 'locationName')
  final String? locationName;
  @JsonKey(name: 'siteArea')
  final String? siteArea;
  @JsonKey(name: 'buildUpArea')
  final String? buildUpArea;
  @JsonKey(name: 'components')
  final String? components;
  @JsonKey(name: 'contractSignDate')
  final String? contractSignDate;
  @JsonKey(name: 'commenceDate')
  final String? commenceDate;
  @JsonKey(name: 'contractualFinishDate')
  final String? contractualFinishDate;
  @JsonKey(name: 'finishDateAfterExtension')
  final String? finishDateAfterExtension;
  @JsonKey(name: 'executionDuration')
  final double? executionDuration;
  @JsonKey(name: 'extensionPeriod')
  final double? extensionPeriod;
  @JsonKey(name: 'remainingDuration')
  final double? remainingDuration;
  @JsonKey(name: 'elapsedTime')
  final double? elapsedTime;
  @JsonKey(name: 'percentageOfElapsedTime')
  final String? percentageOfElapsedTime;
  @JsonKey(name: 'supervisionContractAmount')
  final double? supervisionContractAmount;
  @JsonKey(name: 'paymentNumber')
  final String? paymentNumber;
  @JsonKey(name: 'completedServicesAmount')
  final double? completedServicesAmount;
  @JsonKey(name: 'completedServicespercentage')
  final String? completedServicespercentage;
  @JsonKey(name: 'totalPaymentNetAmount')
  final double? totalPaymentNetAmount;
  @JsonKey(name: 'lastPaymentNetAmount')
  final double? lastPaymentNetAmount;
  @JsonKey(name: 'lastPaymentNetAmountDate')
  final String? lastPaymentNetAmountDate;
  @JsonKey(name: 'totalPaidAmount')
  final double? totalPaidAmount;
  @JsonKey(name: 'totalPaidPercentage')
  final String? totalPaidPercentage;
  @JsonKey(name: 'contractValueAfterVariationOrderandExtensionOrders')
  final double? contractValueAfterVariationOrderandExtensionOrders;
  @JsonKey(name: 'exchangepercentage')
  final String? exchangepercentage;
  @JsonKey(name: 'variationOrders')
  final double? variationOrders;
  @JsonKey(name: 'totalVariationOrders')
  final double? totalVariationOrders;
  @JsonKey(name: 'variationOrdersPercentage')
  final String? variationOrdersPercentage;
  @JsonKey(name: 'completedWorkDuringthisMonth')
  final String? completedWorkDuringthisMonth;
  @JsonKey(name: 'actions')
  final String? actions;
  @JsonKey(name: 'additionalInformation')
  final String? additionalInformation;
  @JsonKey(name: 'month')
  final int? month;
  @JsonKey(name: 'year')
  final int? year;

  const RemoteAgreement({
    this.id,
    this.projectName,
    this.totalVariationOrders,
    this.projectSector,
    this.supervisionServiceContractNumber,
    this.projectEngineerEmail,
    this.projectEngineerName,
    this.projectEngineerPhoneNumber,
    this.beneficiaryName,
    this.projectEngineerFax,
    this.deputyProjectEngineerName,
    this.deputyProjectEngineerPhoneNumber,
    this.deputyProjectEngineerEmail,
    this.projectNumberFinancial,
    this.consultantName,
    this.contractorName,
    this.locationName,
    this.siteArea,
    this.buildUpArea,
    this.components,
    this.contractSignDate,
    this.commenceDate,
    this.contractualFinishDate,
    this.finishDateAfterExtension,
    this.executionDuration,
    this.extensionPeriod,
    this.remainingDuration,
    this.elapsedTime,
    this.percentageOfElapsedTime,
    this.supervisionContractAmount,
    this.paymentNumber,
    this.completedServicesAmount,
    this.completedServicespercentage,
    this.totalPaymentNetAmount,
    this.lastPaymentNetAmount,
    this.lastPaymentNetAmountDate,
    this.totalPaidAmount,
    this.totalPaidPercentage,
    this.contractValueAfterVariationOrderandExtensionOrders,
    this.exchangepercentage,
    this.variationOrders,
    this.variationOrdersPercentage,
    this.completedWorkDuringthisMonth,
    this.actions,
    this.additionalInformation,
    this.month,
    this.year,
  }) : super(
    id: id ?? "",
    year: year ?? 0,
    month: month ?? 0,
    additionalInformation: additionalInformation?? "",
    contractorName: contractorName ?? "",
    variationOrders: variationOrders ?? 0.0,
    totalPaidPercentage: totalPaidPercentage ?? "",
    totalPaidAmount: totalPaidAmount ?? 0.0,
    siteArea: siteArea ?? "",
    remainingDuration: remainingDuration ?? 0.0,
    projectSector: projectSector ?? "",
    beneficiaryName:  beneficiaryName ?? "",
    percentageOfElapsedTime: percentageOfElapsedTime ?? "",
    locationName: locationName ?? "",
    lastPaymentNetAmountDate: lastPaymentNetAmountDate ?? "",
    lastPaymentNetAmount: lastPaymentNetAmount ?? 0.0,
      totalVariationOrders: totalVariationOrders ?? 0.0,
    extensionPeriod: extensionPeriod ?? 0.0,
    elapsedTime: elapsedTime ?? 0.0,
    consultantName: consultantName ?? "",
    components: components ?? "",
    buildUpArea: buildUpArea ?? "",
    actions: actions ?? "",
    commenceDate: commenceDate ?? "",
    completedServicesAmount: completedServicesAmount ?? 0.0,
    completedServicespercentage: completedServicespercentage ?? "",
    completedWorkDuringthisMonth: completedWorkDuringthisMonth ?? "",
    contractSignDate: contractSignDate ?? "",
    contractualFinishDate: contractualFinishDate ?? "",
    contractValueAfterVariationOrderandExtensionOrders: contractValueAfterVariationOrderandExtensionOrders ?? 0.0,
    deputyProjectEngineerEmail: deputyProjectEngineerEmail ?? "",
    deputyProjectEngineerName: deputyProjectEngineerName ?? "",
    deputyProjectEngineerPhoneNumber: deputyProjectEngineerPhoneNumber ?? "",
    exchangepercentage: exchangepercentage ?? "",
    executionDuration: executionDuration ?? 0.0,
    finishDateAfterExtension: finishDateAfterExtension ?? "",
    paymentNumber: paymentNumber ?? "",
    projectEngineerEmail: projectEngineerEmail ?? "",
    projectEngineerFax: projectEngineerFax ?? "",
    projectEngineerName: projectEngineerName ?? "",
    projectEngineerPhoneNumber: projectEngineerPhoneNumber ?? "",
    projectName: projectName ?? "",
    projectNumberFinancial: projectNumberFinancial ?? "",
    supervisionContractAmount: supervisionContractAmount ?? 0.0,
    supervisionServiceContractNumber: supervisionServiceContractNumber ?? "",
    totalPaymentNetAmount: totalPaymentNetAmount ?? 0.0,
    variationOrdersPercentage: variationOrdersPercentage ??""
  );

  factory RemoteAgreement.fromJson(Map<String, dynamic> json) =>
      _$RemoteAgreementFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAgreementToJson(this);


}
