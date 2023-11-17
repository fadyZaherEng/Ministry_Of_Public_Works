import 'package:equatable/equatable.dart';

class Report extends Equatable {
  final String? actionsTaken;
  final double? activeProvisionalSum;
  final String? activeProvisionalSumPercentage;
  final double? actualCompletionRateforthisMonth;
  final double? actualPercentageofComplete;
  final double? actualdelay;
  final double? estimatedPaymentCertificate;
  final double? buildUpAreaDecimal;
  final double? siteAreaDecimal;
  final double? actualPaymentCertificate;
  final String? additionalInformation;
  final String? agreementNumber;
  final String? agreementNumberForConsultancyServices;
  final String? agreementNumberForExecution;
  final double? agreementPeriod;
  final double? remeasureItemsAmount;
  final String? agreementSignDate;
  final String? agreementTotalAmount;
  final String? beneficiaryName;
  final String? budgetClausenumber;
  final String? contractSignDate;
  final String? budgetClauseNumber;
  final String? buildUpArea;
  final double? completedWorkAmount;
  final String? completedWorkAmountDate;
  final double? completedWorkandStoredMaterials;
  final String? completedWorkandStoredMaterialsPercentage;
  final String? completedWorkDuringthisMonth;
  final String? completionDateAfterExtension;
  final String? components;
  final String? consultancyServicesExpirationDate;
  final String? consultancyServicesStartDate;
  final String? consultantEmail;
  final String? consultantName;
  final String? consultantPhoneNumber;
  final String? consultantsId;
  final String? executionContractNumber;
  final double? contractAmount;
  final String? contractorFax;
  final String? contractorName;
  final String? contractorPhoneNumber;
  final double? contractPeriod;
  final String? contractSigningDate;
  final String? contractualCompletionDate;
  final double? contractualCompletionPercentage;
  final String? countofActualDelay;
  final String? createdBy;
  final String? creationDate;
  final String? creationDatestr;
  final String? deputyManager;
  final String? deputyProjectEngineerEmail;
  final String? deputyProjectEngineerPhoneNumber;
  final String? designAgreementValue;
  final String? designFinishDatewithExtension;
  final double? earlyStartCompletionrateforthisMonth;
  final double? elapsedTime;
  final double? estimatedFinancialProvision;
  final String? exchangePercentage;
  final String? expectedStartDate;
  final double? extensionPeriod;
  final double? financialProvision;
  final String? getPdfFile;
  final String? governorateName;
  final String? headofDepartment;
  final String? id;
  final String? idReplaced;
  final double? inactiveProvisionalSum;
  final String? inactiveProvisionalSumPercentage;
  final bool? isDeleted;
  final double? lastPaymentCertificateAmount;
  final String? lastPaymentCertificateDate;
  final double? lastPaymentNetAmount;
  final String? lastPaymentNetAmountDate;
  final double? lateStartCompletionRateforthisMonth;
  final String? latestPaymentCertificateNumber;
  final String? locationName;
  final double? measurementsVariations;
  final String? measurementsVariationsPercentage;
  final String? modificationDate;
  final String? modifiedBy;
  final String? month;
  final String? notes;
  final double? optionalWorksagreementAmount;
  final String? paymentCertificateNumber;
  final String? pdfFile;
  final String? pdfFileId;
  final String? percentageofElapsedTime;
  final String? periodDate;
  final String? periodTitle;
  final double? phase;
  final String? phaseName;
  final String? phoneNumberDeputyManager;
  final String? plannedHandoverDate;
  final String? plannedImplementationDate;
  final double? plannedPercentageofCompletion;
  final String? project;
  final String? projectEngineerEmail;
  final String? projectEngineerFax;
  final String? projectEngineerName;
  final String? projectEngineerPhoneNumber;
  final String? projectId;
  final String? projectName;
  final String? projectSector;
  final String? projectSectorId;
  final String? reasonsfortheDelay;
  final String? recoveryFinishDate;
  final double? recoveryPercentageofCompletion;
  final double? remainingDuration;
  final String? reportName;
  final String? contractNumber;
  final String? siteArea;
  final String? startDate;
  final double? startStatus;
  final double? status;
  final String? statusStr;
  final double? sumOfProjectVariationOrders;
  final double? supervisionAgreementAmount;
  final double? theEstimatedValueofTheProject;
  final double? theValueoftheExecutionContractWithoutProtectionWorks;
  final double? totalContractAmountAfterExtension;
  final double? totalPaidAmount;
  final double? designValue;
  final String? totalValueofOutgoingPaymentsFinancialforDepartment;
  final double? totalValueofOutgoingPaymentsforSector;
  final double? totalVariationOrders;
  final double? contractDuration;
  final double? delay;
  final double? delayPercentage;
  final double? earlyPlannedPercentageofCompletion;
  final double? latePlannedPercentageofCompletion;
  final double? actualPercentageofCompletion;
  final double? durationMonth;
  final double? durationDay;
  final double? optionalWorksValue;
  final double? supervisionServicesValue;
  final String? variationOrders;
  final String? variationOrdersId;
  final String? variationOrdersPercentage;
  final String? headofDepartmentEmail;
  final String? deputyProjectEngineerName;
  final List<double>? variationOrdersValues;
  final String? year;
  final String? projectNumberFinancial;
  final String? commenceDate;
  final String? completionDateAfterExtensionstr;
  final String? expectedCompletionDateUpdated;
  final String? designCompletionDate;
  final String? designCompletionDateAfterExtension;
  final String? tenderDate;
  final String? closeoutDate;
  final String? executionExpectedCompletionDate;
  final String? remeasureItemsPercentage;
  final String? expectedTenderingDate;
  final double? contractTotalAmount;
  final double? totalValueofOutgoingPayments;
  final double? paymentCertificate;
  final double? totalPaidWithAdvancedPayment;
  final double? actualCost;

  Report({
    this.actionsTaken = "",
    this.closeoutDate = "",
    this.contractNumber = "",
    this.executionContractNumber = "",
    this.deputyProjectEngineerPhoneNumber = "",
    this.remeasureItemsPercentage = "",
    this.designCompletionDateAfterExtension = "",
    this.executionExpectedCompletionDate = "",
    this.activeProvisionalSum = 0.0,
    this.siteAreaDecimal = 0.0,
    this.buildUpAreaDecimal = 0.0,
    this.totalPaidWithAdvancedPayment = 0.0,
    this.actualCost = 0.0,
    this.paymentCertificate = 0.0,
    this.actualPaymentCertificate = 0.0,
    this.estimatedPaymentCertificate = 0.0,
    this.remeasureItemsAmount = 0.0,
    this.totalValueofOutgoingPayments = 0.0,
    this.supervisionServicesValue = 0.0,
    this.contractTotalAmount = 0.0,
    this.durationDay = 0.0,
    this.durationMonth = 0.0,
    this.earlyPlannedPercentageofCompletion = 0.0,
    this.actualdelay = 0.0,
    this.contractDuration = 0.0,
    this.activeProvisionalSumPercentage = "",
    this.actualCompletionRateforthisMonth = 0.0,
    this.actualPercentageofCompletion = 0.0,
    this.actualPercentageofComplete = 0,
    this.additionalInformation = "",
    this.agreementNumber = "",
    this.agreementNumberForConsultancyServices = "",
    this.completionDateAfterExtensionstr = "",
    this.expectedCompletionDateUpdated = "",
    this.agreementNumberForExecution = "",
    this.agreementPeriod = 0,
    this.agreementSignDate = "",
    this.contractSignDate = "",
    this.agreementTotalAmount = "",
    this.beneficiaryName = "",
    this.budgetClausenumber = "",
    this.budgetClauseNumber = "",
    this.buildUpArea = "",
    this.completedWorkAmount = 0.0,
    this.designValue = 0.0,
    this.optionalWorksValue = 0.0,
    this.completedWorkAmountDate = "",
    this.completedWorkandStoredMaterials = 0.0,
    this.completedWorkandStoredMaterialsPercentage = "",
    this.completedWorkDuringthisMonth = "",
    this.completionDateAfterExtension = "",
    this.components = "",
    this.consultancyServicesExpirationDate = "",
    this.consultancyServicesStartDate = "",
    this.consultantEmail = "",
    this.deputyProjectEngineerName = "",
    this.consultantName = "",
    this.consultantPhoneNumber = "",
    this.consultantsId = "",
    this.contractAmount = 0.0,
    this.contractorFax = "",
    this.contractorName = "",
    this.contractorPhoneNumber = "",
    this.contractPeriod = 0,
    this.contractSigningDate = "",
    this.contractualCompletionDate = "",
    this.designCompletionDate = "",
    this.contractualCompletionPercentage = 0.0,
    this.countofActualDelay = "",
    this.createdBy = "",
    this.creationDate = "",
    this.creationDatestr = "",
    this.deputyManager = "",
    this.deputyProjectEngineerEmail = "",
    this.designAgreementValue = "",
    this.designFinishDatewithExtension = "",
    this.earlyStartCompletionrateforthisMonth = 0,
    this.elapsedTime = 0,
    this.estimatedFinancialProvision = 0,
    this.exchangePercentage = "",
    this.expectedStartDate = "",
    this.extensionPeriod = 0,
    this.financialProvision = 0.0,
    this.delay = 0.0,
    this.delayPercentage = 0.0,
    this.getPdfFile = "",
    this.governorateName = "",
    this.headofDepartment = "",
    this.id = "",
    this.idReplaced = "",
    this.inactiveProvisionalSum = 0,
    this.inactiveProvisionalSumPercentage = "",
    this.isDeleted = false,
    this.lastPaymentCertificateAmount = 0.0,
    this.lastPaymentCertificateDate = "",
    this.lastPaymentNetAmount = 0.0,
    this.lastPaymentNetAmountDate = "",
    this.lateStartCompletionRateforthisMonth = 0,
    this.latestPaymentCertificateNumber = "",
    this.locationName = "",
    this.measurementsVariations = 0,
    this.measurementsVariationsPercentage = "",
    this.modificationDate = "",
    this.modifiedBy = "",
    this.month = "",
    this.notes = "",
    this.optionalWorksagreementAmount = 0,
    this.paymentCertificateNumber = "",
    this.pdfFile = "",
    this.pdfFileId = "",
    this.percentageofElapsedTime = "",
    this.periodDate = "",
    this.periodTitle = "",
    this.phase = 0,
    this.phaseName = "",
    this.phoneNumberDeputyManager = "",
    this.plannedHandoverDate = "",
    this.plannedImplementationDate = "",
    this.plannedPercentageofCompletion = 0,
    this.project = "",
    this.projectEngineerEmail = "",
    this.projectEngineerFax = "",
    this.projectEngineerName = "",
    this.projectEngineerPhoneNumber = "",
    this.projectId = "",
    this.projectName = "",
    this.projectSector = "",
    this.projectSectorId = "",
    this.reasonsfortheDelay = "",
    this.recoveryFinishDate = "",
    this.recoveryPercentageofCompletion = 0,
    this.remainingDuration = 0,
    this.reportName = "",
    this.expectedTenderingDate = "",
    this.siteArea = "",
    this.startDate = "",
    this.tenderDate = "",
    this.startStatus = 0,
    this.status = 0,
    this.statusStr = "",
    this.sumOfProjectVariationOrders = 0,
    this.supervisionAgreementAmount = 0,
    this.theEstimatedValueofTheProject = 0,
    this.theValueoftheExecutionContractWithoutProtectionWorks = 0.0,
    this.latePlannedPercentageofCompletion = 0.0,
    this.totalContractAmountAfterExtension = 0,
    this.totalPaidAmount = 0.0,
    this.totalValueofOutgoingPaymentsFinancialforDepartment = "",
    this.totalValueofOutgoingPaymentsforSector = 0.0,
    this.totalVariationOrders = 0,
    this.variationOrders = "",
    this.headofDepartmentEmail = "",
    this.variationOrdersId = "",
    this.variationOrdersPercentage = "",
    this.projectNumberFinancial = "",
    this.variationOrdersValues = const [],
    this.year = "",
    this.commenceDate = "",
  });

  @override
  List<Object?> get props => [identityHashCode(this)];
}
