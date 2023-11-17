import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_report.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class RemoteReport extends Report {
  final String? actions;
  final String? contractNumber;
  final double? activeProvisionalSum;
  final double? actualdelay;
  final String? activeProvisionalSumPercentage;
  final String? executionContractNumber;
  final double? actualCompletionRateforthisMonth;
  final double? remeasureItemsAmount;
  final double? actualPercentageofComplete;
  final String? additionalInformation;
  final String? agreementNumber;
  final String? agreementNumberForConsultancyServices;
  final String? agreementNumberForExecution;
  final double? agreementPeriod;
  final String? agreementSignDate;
  final String? agreementTotalAmount;
  final String? beneficiaryName;
  final String? budgetClausenumber;
  final String? budgetClauseNumber;
  final String? buildUpArea;
  final double? buildUpAreaDecimal;
  final double? siteAreaDecimal;
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
  final String? deputyProjectEngineerName;
  final String? deputyProjectEngineerEmail;
  final String? deputyProjectEngineerPhoneNumber;
  final String? designAgreementValue;
  final String? designFinishDatewithExtension;
  final double? earlyStartCompletionrateforthisMonth;
  final double? elapsedTime;
  final double? estimatedFinancialProvision;
  final String? exchangepercentage;
  final String? expectedStartDate;
  final double? extensionPeriod;
  final double? financialProvision;
  final String? getPdfFile;
  final String? governorateName;
  final String? headofDepartmentName;
  final String? id;
  final String? idReplaced;
  final double? inactiveProvisionalSum;
  final String? inactiveProvisionalSumPercentage;
  final bool? isDeleted;
  final double? lastPaymentCertificateAmount;
  final String? lastPaymentCertificateDate;
  final double? lastPaymentNetAmount;
  final double? actualPaymentCertificate;
  final double? estimatedPaymentCertificate;
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
  final String? projectNumberFinancial;
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
  final String? delayReasons;
  final String? recoveryFinishDate;
  final String? headofDepartmentEmail;
  final double? recoveryPercentageofCompletion;
  final double? remainingDuration;
  final String? reportName;
  final String? siteArea;
  final String? startDate;
  final double? startStatus;
  final double? status;
  final String? statusStr;
  final double? sumOfProjectVariationOrders;
  final double? supervisionAgreementAmount;
  final double? projectEstimatedValue;
  final double? theValueoftheExecutionContractWithoutProtectionWorks;
  final double? totalContractAmountAfterExtension;
  final double? totalPaid;
  final String? totalValueofOutgoingPaymentsFinancialforDepartment;
  final double? totalValueofOutgoingPaymentsforSector;
  final double? contractDuration;
  final double? totalVariationOrders;
  final double? delayPercentage;
  final double? delay;
  final double? earlyPlannedPercentageofCompletion;
  final double? latePlannedPercentageofCompletion;
  final double? actualPercentageofCompletion;
  final double? durationMonth;
  final double? durationDay;
  final double? designValue;
  final double? optionalWorksValue;
  final double? supervisionServicesValue;
  final String? variationOrders;
  final String? variationOrdersId;
  final String? variationOrdersPercentage;
  final List<double>? variationOrdersValues;
  final String? year;
  final String? contractSignDate;
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

  RemoteReport(
    this.id,
    this.projectName,
    this.closeoutDate,
    this.expectedTenderingDate,
    this.supervisionServicesValue,
    this.remeasureItemsPercentage,
    this.totalValueofOutgoingPayments,
    this.totalPaidWithAdvancedPayment,
    this.actualdelay,
    this.contractSignDate,
    this.executionExpectedCompletionDate,
    this.remeasureItemsAmount,
    this.designCompletionDate,
    this.estimatedPaymentCertificate,
    this.actualPaymentCertificate,
    this.contractNumber,
    this.phaseName,
    this.siteAreaDecimal,
    this.buildUpAreaDecimal,
    this.contractDuration,
    this.actualPercentageofCompletion,
    this.headofDepartmentEmail,
    this.creationDate,
    this.projectNumberFinancial,
    this.agreementNumber,
    this.contractAmount,
    this.deputyProjectEngineerPhoneNumber,
    this.projectEngineerName,
    this.actions,
    this.activeProvisionalSum,
    this.activeProvisionalSumPercentage,
    this.executionContractNumber,
    this.actualCompletionRateforthisMonth,
    this.actualPercentageofComplete,
    this.additionalInformation,
    this.agreementNumberForConsultancyServices,
    this.agreementNumberForExecution,
    this.agreementPeriod,
    this.agreementSignDate,
    this.agreementTotalAmount,
    this.beneficiaryName,
    this.budgetClausenumber,
    this.budgetClauseNumber,
    this.buildUpArea,
    this.completedWorkAmount,
    this.completedWorkAmountDate,
    this.completedWorkandStoredMaterials,
    this.completedWorkandStoredMaterialsPercentage,
    this.completedWorkDuringthisMonth,
    this.completionDateAfterExtension,
    this.deputyProjectEngineerName,
    this.components,
    this.consultancyServicesExpirationDate,
    this.consultancyServicesStartDate,
    this.consultantEmail,
    this.consultantName,
    this.consultantPhoneNumber,
    this.consultantsId,
    this.contractorFax,
    this.contractorName,
    this.contractorPhoneNumber,
    this.contractPeriod,
    this.contractSigningDate,
    this.contractualCompletionDate,
    this.completionDateAfterExtensionstr,
    this.contractualCompletionPercentage,
    this.countofActualDelay,
    this.createdBy,
    this.creationDatestr,
    this.deputyManager,
    this.deputyProjectEngineerEmail,
    this.designAgreementValue,
    this.designFinishDatewithExtension,
    this.earlyStartCompletionrateforthisMonth,
    this.elapsedTime,
    this.earlyPlannedPercentageofCompletion,
    this.estimatedFinancialProvision,
    this.exchangepercentage,
    this.expectedStartDate,
    this.extensionPeriod,
    this.financialProvision,
    this.getPdfFile,
    this.governorateName,
    this.headofDepartmentName,
    this.idReplaced,
    this.inactiveProvisionalSum,
    this.inactiveProvisionalSumPercentage,
    this.isDeleted,
    this.lastPaymentCertificateAmount,
    this.lastPaymentCertificateDate,
    this.lastPaymentNetAmount,
    this.lastPaymentNetAmountDate,
    this.lateStartCompletionRateforthisMonth,
    this.latestPaymentCertificateNumber,
    this.locationName,
    this.measurementsVariations,
    this.measurementsVariationsPercentage,
    this.modificationDate,
    this.modifiedBy,
    this.month,
    this.notes,
    this.optionalWorksagreementAmount,
    this.paymentCertificateNumber,
    this.pdfFile,
    this.pdfFileId,
    this.percentageofElapsedTime,
    this.periodDate,
    this.periodTitle,
    this.phase,
    this.phoneNumberDeputyManager,
    this.plannedHandoverDate,
    this.plannedImplementationDate,
    this.plannedPercentageofCompletion,
    this.project,
    this.projectEngineerEmail,
    this.projectEngineerFax,
    this.projectEngineerPhoneNumber,
    this.projectId,
    this.projectSector,
    this.projectSectorId,
    this.delayReasons,
    this.latePlannedPercentageofCompletion,
    this.recoveryFinishDate,
    this.recoveryPercentageofCompletion,
    this.remainingDuration,
    this.reportName,
    this.siteArea,
    this.startDate,
    this.startStatus,
    this.status,
    this.statusStr,
    this.sumOfProjectVariationOrders,
    this.supervisionAgreementAmount,
    this.projectEstimatedValue,
    this.designValue,
    this.theValueoftheExecutionContractWithoutProtectionWorks,
    this.totalContractAmountAfterExtension,
    this.totalPaid,
    this.totalValueofOutgoingPaymentsFinancialforDepartment,
    this.totalValueofOutgoingPaymentsforSector,
    this.totalVariationOrders,
    this.variationOrders,
    this.variationOrdersId,
    this.variationOrdersPercentage,
    this.variationOrdersValues,
    this.commenceDate,
    this.expectedCompletionDateUpdated,
    this.year,
    this.delay,
    this.durationDay,
    this.designCompletionDateAfterExtension,
    this.delayPercentage,
    this.tenderDate,
    this.durationMonth,
    this.optionalWorksValue,
    this.contractTotalAmount,
    this.paymentCertificate,
    this.actualCost,
  ) : super(
          id: id ?? "",
    remeasureItemsPercentage: remeasureItemsPercentage ?? "",
    tenderDate: tenderDate ?? "",
          projectName: projectName ?? "",
    closeoutDate: closeoutDate ?? "",
    contractSignDate: contractSignDate ?? "",
    expectedCompletionDateUpdated: expectedCompletionDateUpdated ?? "",
    executionExpectedCompletionDate: executionExpectedCompletionDate ?? "",
    commenceDate: commenceDate ?? "",
          phaseName: phaseName ?? "",
          creationDate: creationDate ?? "",
          agreementNumber: agreementNumber ?? "",
    contractNumber: contractNumber ?? "",
    executionContractNumber: executionContractNumber ?? "",
    designCompletionDate: designCompletionDate ?? "",
    expectedTenderingDate: expectedTenderingDate ?? "",
    designCompletionDateAfterExtension: designCompletionDateAfterExtension ?? "",
          contractAmount: contractAmount ?? 0.0,
    actualCost: actualCost ?? 0.0,
    totalPaidWithAdvancedPayment: totalPaidWithAdvancedPayment ?? 0.0,
    paymentCertificate: paymentCertificate ?? 0.0,
    contractTotalAmount: contractTotalAmount ?? 0.0,
    supervisionServicesValue: supervisionServicesValue ?? 0.0,
    designValue: designValue ?? 0.0,
    optionalWorksValue: optionalWorksValue ?? 0.0,
    totalValueofOutgoingPayments: totalValueofOutgoingPayments ?? 0.0,
    durationDay: durationDay ?? 0.0,
    durationMonth: durationMonth ?? 0.0,
    siteAreaDecimal: siteAreaDecimal ?? 0.0,
    buildUpAreaDecimal: buildUpAreaDecimal ?? 0.0,
    actualdelay: actualdelay ?? 0.0,
    actualPercentageofCompletion: actualPercentageofCompletion ?? 0.0,
          projectEngineerName: projectEngineerName ?? "",
          actionsTaken: actions ?? "",
    projectNumberFinancial: projectNumberFinancial ?? "",
          activeProvisionalSum: activeProvisionalSum ?? 0.0,
    earlyPlannedPercentageofCompletion: earlyPlannedPercentageofCompletion ?? 0.0,
    latePlannedPercentageofCompletion: latePlannedPercentageofCompletion ?? 0.0,
          activeProvisionalSumPercentage: activeProvisionalSumPercentage ?? "",
          actualCompletionRateforthisMonth:
              actualCompletionRateforthisMonth ?? 0.0,
          actualPercentageofComplete: actualPercentageofComplete ?? 0,
          additionalInformation: additionalInformation ?? "",
          agreementNumberForConsultancyServices:
              agreementNumberForConsultancyServices ?? "",
          agreementNumberForExecution: agreementNumberForExecution ?? "",
    headofDepartmentEmail: headofDepartmentEmail ?? "",
    deputyProjectEngineerPhoneNumber: deputyProjectEngineerPhoneNumber ?? "",
    deputyProjectEngineerName: deputyProjectEngineerName ?? "",
          agreementPeriod: agreementPeriod ?? 0,
          agreementSignDate: agreementSignDate ?? "",
          agreementTotalAmount: agreementTotalAmount ?? "",
          beneficiaryName: beneficiaryName ?? "",
          budgetClausenumber: budgetClausenumber ?? "",
          budgetClauseNumber: budgetClauseNumber ?? "",
          buildUpArea: buildUpArea ?? "",
          completedWorkAmount: completedWorkAmount ?? 0.0,
          completedWorkAmountDate: completedWorkAmountDate ?? "",
          completedWorkandStoredMaterials:
              completedWorkandStoredMaterials ?? 0.0,
          completedWorkandStoredMaterialsPercentage:
              completedWorkandStoredMaterialsPercentage ?? "",
          completedWorkDuringthisMonth: completedWorkDuringthisMonth ?? "",
          completionDateAfterExtension: completionDateAfterExtension ?? "",
          components: components ?? "",
          consultancyServicesExpirationDate:
              consultancyServicesExpirationDate ?? "",
          consultancyServicesStartDate: consultancyServicesStartDate ?? "",
          consultantEmail: consultantEmail ?? "",
          consultantName: consultantName ?? "",
          consultantPhoneNumber: consultantPhoneNumber ?? "",
          consultantsId: consultantsId ?? "",
          contractorFax: contractorFax ?? "",
          contractorName: contractorName ?? "",
          contractorPhoneNumber: contractorPhoneNumber ?? "",
          contractPeriod: contractPeriod ?? 0,
          contractSigningDate: contractSigningDate ?? "",
          contractualCompletionDate: contractualCompletionDate ?? "",
    completionDateAfterExtensionstr: completionDateAfterExtensionstr ?? "",
          contractualCompletionPercentage:
              contractualCompletionPercentage ?? 0.0,
          countofActualDelay: countofActualDelay ?? "",
          createdBy: createdBy ?? "",
          creationDatestr: creationDatestr ?? "",
          deputyManager: deputyManager ?? "",
    deputyProjectEngineerEmail: deputyProjectEngineerEmail ?? "",
          designAgreementValue: designAgreementValue ?? "",
          designFinishDatewithExtension: designFinishDatewithExtension ?? "",
          earlyStartCompletionrateforthisMonth:
              earlyStartCompletionrateforthisMonth ?? 0.0,
          elapsedTime: elapsedTime ?? 0,
          estimatedFinancialProvision: estimatedFinancialProvision ?? 0,
          exchangePercentage: exchangepercentage ?? "",
          expectedStartDate: expectedStartDate ?? "",
          extensionPeriod: extensionPeriod ?? 0,
          financialProvision: financialProvision ?? 0.0,
    remeasureItemsAmount: remeasureItemsAmount ?? 0.0,
    contractDuration: contractDuration ?? 0.0,
    delayPercentage: delayPercentage ?? 0.0,
    delay: delay ?? 0.0,
          getPdfFile: getPdfFile ?? "",
          governorateName: governorateName ?? "",
          headofDepartment: headofDepartmentName ?? "",
          idReplaced: idReplaced ?? "",
          inactiveProvisionalSum: inactiveProvisionalSum ?? 0,
          inactiveProvisionalSumPercentage:
              inactiveProvisionalSumPercentage ?? "",
          isDeleted: isDeleted ?? false,
          lastPaymentCertificateAmount: lastPaymentCertificateAmount ?? 0.0,
          lastPaymentCertificateDate: lastPaymentCertificateDate ?? "",
          lastPaymentNetAmount: lastPaymentNetAmount ?? 0.0,
          lastPaymentNetAmountDate: lastPaymentNetAmountDate ?? "",
          lateStartCompletionRateforthisMonth:
              lateStartCompletionRateforthisMonth ?? 0.0,
          latestPaymentCertificateNumber: latestPaymentCertificateNumber ?? "",
          locationName: locationName ?? "",
          measurementsVariations: measurementsVariations ?? 0,
          measurementsVariationsPercentage:
              measurementsVariationsPercentage ?? "",
          modificationDate: modificationDate ?? "",
          modifiedBy: modifiedBy ?? "",
          month: month ?? "",
          notes: notes ?? "",
          optionalWorksagreementAmount: optionalWorksagreementAmount ?? 0,
          paymentCertificateNumber: paymentCertificateNumber ?? "",
          pdfFile: pdfFile ?? "",
          pdfFileId: pdfFileId ?? "",
          percentageofElapsedTime: percentageofElapsedTime ?? "",
          periodDate: periodDate ?? "",
          periodTitle: periodTitle ?? "",
          phase: phase ?? 0,
          phoneNumberDeputyManager: phoneNumberDeputyManager ?? "",
          plannedHandoverDate: plannedHandoverDate ?? "",
          plannedImplementationDate: plannedImplementationDate ?? "",
          plannedPercentageofCompletion: plannedPercentageofCompletion ?? 0,
          project: project ?? "",
          projectEngineerEmail: projectEngineerEmail ?? "",
          projectEngineerFax: projectEngineerFax ?? "",
          projectEngineerPhoneNumber: projectEngineerPhoneNumber ?? "",
          projectId: projectId ?? "",
          projectSector: projectSector ?? "",
          projectSectorId: projectSectorId ?? "",
          reasonsfortheDelay: delayReasons ?? "",
          recoveryFinishDate: recoveryFinishDate ?? "",
          recoveryPercentageofCompletion: recoveryPercentageofCompletion ?? 0.0,
    estimatedPaymentCertificate: estimatedPaymentCertificate ?? 0.0,
    actualPaymentCertificate: actualPaymentCertificate ?? 0.0,
          remainingDuration: remainingDuration ?? 0,
          reportName: reportName ?? "",
          siteArea: siteArea ?? "",
          startDate: startDate ?? "",
          startStatus: startStatus ?? 0,
          status: status ?? 0,
          statusStr: statusStr ?? "",
          sumOfProjectVariationOrders: sumOfProjectVariationOrders ?? 0,
          supervisionAgreementAmount: supervisionAgreementAmount ?? 0,
          theEstimatedValueofTheProject: projectEstimatedValue ?? 0,
          theValueoftheExecutionContractWithoutProtectionWorks:
              theValueoftheExecutionContractWithoutProtectionWorks ?? 0.0,
          totalContractAmountAfterExtension:
              totalContractAmountAfterExtension ?? 0,
          totalPaidAmount: totalPaid ?? 0,
          totalValueofOutgoingPaymentsFinancialforDepartment:
              totalValueofOutgoingPaymentsFinancialforDepartment ?? "",
          totalValueofOutgoingPaymentsforSector:
              totalValueofOutgoingPaymentsforSector ?? 0.0,
          totalVariationOrders: totalVariationOrders ?? 0,
          variationOrders: variationOrders ?? "",
          variationOrdersId: variationOrdersId ?? "",
          variationOrdersPercentage: variationOrdersPercentage ?? "",
          variationOrdersValues: variationOrdersValues ?? [],
          year: year ?? "",
        );

  factory RemoteReport.fromJson(Map<String, dynamic> json) =>
      _$RemoteReportFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteReportToJson(this);
}
