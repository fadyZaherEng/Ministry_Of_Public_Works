import 'package:equatable/equatable.dart';

class Agreement extends Equatable {
  final String? id;
  final String? projectName;
  final String? projectSector;
  final String? supervisionServiceContractNumber;
  final String? projectEngineerEmail;
  final String? projectEngineerName;
  final String? projectEngineerPhoneNumber;
  final String? beneficiaryName;
  final String? projectEngineerFax;
  final String? deputyProjectEngineerName;
  final String? deputyProjectEngineerPhoneNumber;
  final String? deputyProjectEngineerEmail;
  final String? projectNumberFinancial;
  final String? consultantName;
  final String? contractorName;
  final String? locationName;
  final String? siteArea;
  final String? buildUpArea;
  final String? components;
  final String? contractSignDate;
  final String? commenceDate;
  final String? contractualFinishDate;
  final String? finishDateAfterExtension;
  final double? executionDuration;
  final double? extensionPeriod;
  final double? remainingDuration;
  final double? elapsedTime;
  final String? percentageOfElapsedTime;
  final double? supervisionContractAmount;
  final String? paymentNumber;
  final double? completedServicesAmount;
  final String? completedServicespercentage;
  final double? totalPaymentNetAmount;
  final double? lastPaymentNetAmount;
  final String? lastPaymentNetAmountDate;
  final double? totalPaidAmount;
  final String? totalPaidPercentage;
  final double? contractValueAfterVariationOrderandExtensionOrders;
  final String? exchangepercentage;
  final double? variationOrders;
  final double? totalVariationOrders;
  final String? variationOrdersPercentage;
  final String? completedWorkDuringthisMonth;
  final String? actions;
  final String? additionalInformation;
  final int? month;
  final int? year;

  const Agreement({
    this.id = "",
    this.projectName = "",
    this.projectSector = "",
    this.supervisionServiceContractNumber = "",
    this.projectEngineerEmail = "",
    this.projectEngineerName = "",
    this.projectEngineerPhoneNumber = "",
    this.beneficiaryName = "",
    this.projectEngineerFax = "",
    this.deputyProjectEngineerName = "",
    this.deputyProjectEngineerPhoneNumber = "",
    this.deputyProjectEngineerEmail = "",
    this.projectNumberFinancial = "",
    this.consultantName = "",
    this.contractorName = "",
    this.locationName = "",
    this.siteArea = "",
    this.buildUpArea = "",
    this.components = "",
    this.contractSignDate = "",
    this.commenceDate = "",
    this.contractualFinishDate = "",
    this.finishDateAfterExtension = "",
    this.executionDuration = 0.0,
    this.extensionPeriod = 0.0,
    this.totalVariationOrders = 0.0,
    this.remainingDuration = 0.0,
    this.elapsedTime = 0.0,
    this.percentageOfElapsedTime = "",
    this.supervisionContractAmount = 0.0,
    this.paymentNumber = "",
    this.completedServicesAmount = 0.0,
    this.completedServicespercentage = "",
    this.totalPaymentNetAmount = 0.0,
    this.lastPaymentNetAmount = 0.0,
    this.lastPaymentNetAmountDate = "",
    this.totalPaidAmount = 0.0,
    this.totalPaidPercentage = "",
    this.contractValueAfterVariationOrderandExtensionOrders = 0.0,
    this.exchangepercentage = "",
    this.variationOrders = 0.0,
    this.variationOrdersPercentage = "",
    this.completedWorkDuringthisMonth = "",
    this.actions = "",
    this.additionalInformation = "",
    this.month = 0,
    this.year = 0,
  });

  @override
  List<Object?> get props =>
      [
        id,
        projectName,
        projectSector,
        supervisionServiceContractNumber,
        projectEngineerEmail,
        projectEngineerName,
        projectEngineerPhoneNumber,
        beneficiaryName,
        projectEngineerFax,
        deputyProjectEngineerName,
        deputyProjectEngineerPhoneNumber,
        deputyProjectEngineerEmail,
        projectNumberFinancial,
        totalVariationOrders,
        consultantName,
        contractorName,
        locationName,
        siteArea,
        buildUpArea,
        components,
        contractSignDate,
        commenceDate,
        contractualFinishDate,
        finishDateAfterExtension,
        executionDuration,
        extensionPeriod,
        remainingDuration,
        elapsedTime,
        percentageOfElapsedTime,
        supervisionContractAmount,
        paymentNumber,
        completedServicesAmount,
        completedServicespercentage,
        totalPaymentNetAmount,
        lastPaymentNetAmount,
        lastPaymentNetAmountDate,
        totalPaidAmount,
        totalPaidPercentage,
        contractValueAfterVariationOrderandExtensionOrders,
        exchangepercentage,
        variationOrders,
        variationOrdersPercentage,
        completedWorkDuringthisMonth,
        actions,
        additionalInformation,
        month,
        year,
      ];
}
