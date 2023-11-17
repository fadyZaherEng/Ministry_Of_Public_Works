import 'package:aim/src/domain/entities/analysis/analysis.dart';
import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_analysis.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class RemoteAnalysis extends Analysis {
  final String? actionsTaken;
  final double? activeProvisionalSum;
  final String? activeProvisionalSumPercentage;
  final double? actualCompletionRateforthisMonth;
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
  final double? completedWorkAmount;
  final String? completedWorkAmountDate;
  final double? completedWorkandStoredMaterials;
  final String? completedWorkandStoredMaterialsPercentage;
  final String? completedWorkDuringthisMonth;
  final String? completionDateAfterExtensionstr;
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
  final String? contractualCompletionDatestr;
  final double? contractualCompletionPercentage;
  final String? countofActualDelay;
  final String? createdBy;
  final String? creationDate;
  final String? creationDatestr;
  final String? deputyManager;
  final String? deputyManagerEmail;
  final String? designAgreementValue;
  final String? designFinishDatewithExtension;
  final double? earlyStartCompletionrateforthisMonth;
  final double? elapsedTime;
  final double? estimatedFinancialProvision;
  final double? exchangePercentage;
  final String? expectedStartDate;
  final double? extensionPeriod;
  final String? financialProvision;
  final String? getPdfFile;
  final String? governorateName;
  final String? headofDepartment;
  final String? id;
  final String? idReplaced;
  final double? inactiveProvisionalSum;
  final String? inactiveProvisionalSumPercentage;
  final bool? isDeleted;
  final String? lastPaymentCertificateAmount;
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
  final String? totalValueofOutgoingPaymentsFinancialforDepartment;
  final double? totalValueofOutgoingPaymentsforSector;
  final double? totalVariationOrders;
  final String? variationOrders;
  final String? variationOrdersId;
  final String? variationOrdersPercentage;
  final List<String>? variationOrdersValues;
  final String? year;

  RemoteAnalysis(
    this.id,
    this.projectName,
    this.phaseName,
    this.creationDate,
    this.agreementNumber,
    this.contractAmount,
    this.projectEngineerName,
    this.actionsTaken,
    this.activeProvisionalSum,
    this.activeProvisionalSumPercentage,
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
    this.completionDateAfterExtensionstr,
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
    this.contractualCompletionDatestr,
    this.contractualCompletionPercentage,
    this.countofActualDelay,
    this.createdBy,
    this.creationDatestr,
    this.deputyManager,
    this.deputyManagerEmail,
    this.designAgreementValue,
    this.designFinishDatewithExtension,
    this.earlyStartCompletionrateforthisMonth,
    this.elapsedTime,
    this.estimatedFinancialProvision,
    this.exchangePercentage,
    this.expectedStartDate,
    this.extensionPeriod,
    this.financialProvision,
    this.getPdfFile,
    this.governorateName,
    this.headofDepartment,
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
    this.reasonsfortheDelay,
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
    this.theEstimatedValueofTheProject,
    this.theValueoftheExecutionContractWithoutProtectionWorks,
    this.totalContractAmountAfterExtension,
    this.totalPaidAmount,
    this.totalValueofOutgoingPaymentsFinancialforDepartment,
    this.totalValueofOutgoingPaymentsforSector,
    this.totalVariationOrders,
    this.variationOrders,
    this.variationOrdersId,
    this.variationOrdersPercentage,
    this.variationOrdersValues,
    this.year,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          phaseName: phaseName ?? "",
          creationDate: creationDate ?? "",
          agreementNumber: agreementNumber ?? "",
          contractAmount: contractAmount ?? 0.0,
          projectEngineerName: projectEngineerName ?? "",
          actionsTaken: actionsTaken ?? "",
          activeProvisionalSum: activeProvisionalSum ?? 0.0,
          activeProvisionalSumPercentage: activeProvisionalSumPercentage ?? "",
          actualCompletionRateforthisMonth:
              actualCompletionRateforthisMonth ?? 0.0,
          actualPercentageofComplete: actualPercentageofComplete ?? 0,
          additionalInformation: additionalInformation ?? "",
          agreementNumberForConsultancyServices:
              agreementNumberForConsultancyServices ?? "",
          agreementNumberForExecution: agreementNumberForExecution ?? "",
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
          completionDateAfterExtension: completionDateAfterExtensionstr ?? "",
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
          contractualCompletionDate: contractualCompletionDatestr ?? "",
          contractualCompletionPercentage:
              contractualCompletionPercentage ?? 0.0,
          countofActualDelay: countofActualDelay ?? "",
          createdBy: createdBy ?? "",
          creationDatestr: creationDatestr ?? "",
          deputyManager: deputyManager ?? "",
          deputyManagerEmail: deputyManagerEmail ?? "",
          designAgreementValue: designAgreementValue ?? "",
          designFinishDatewithExtension: designFinishDatewithExtension ?? "",
          earlyStartCompletionrateforthisMonth:
              earlyStartCompletionrateforthisMonth ?? 0.0,
          elapsedTime: elapsedTime ?? 0,
          estimatedFinancialProvision: estimatedFinancialProvision ?? 0,
          exchangePercentage: exchangePercentage ?? 0,
          expectedStartDate: expectedStartDate ?? "",
          extensionPeriod: extensionPeriod ?? 0,
          financialProvision: financialProvision ?? "",
          getPdfFile: getPdfFile ?? "",
          governorateName: governorateName ?? "",
          headofDepartment: headofDepartment ?? "",
          idReplaced: idReplaced ?? "",
          inactiveProvisionalSum: inactiveProvisionalSum ?? 0,
          inactiveProvisionalSumPercentage:
              inactiveProvisionalSumPercentage ?? "",
          isDeleted: isDeleted ?? false,
          lastPaymentCertificateAmount: lastPaymentCertificateAmount ?? "",
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
          reasonsfortheDelay: reasonsfortheDelay ?? "",
          recoveryFinishDate: recoveryFinishDate ?? "",
          recoveryPercentageofCompletion: recoveryPercentageofCompletion ?? 0.0,
          remainingDuration: remainingDuration ?? 0,
          reportName: reportName ?? "",
          siteArea: siteArea ?? "",
          startDate: startDate ?? "",
          startStatus: startStatus ?? 0,
          status: status ?? 0,
          statusStr: statusStr ?? "",
          sumOfProjectVariationOrders: sumOfProjectVariationOrders ?? 0,
          supervisionAgreementAmount: supervisionAgreementAmount ?? 0,
          theEstimatedValueofTheProject: theEstimatedValueofTheProject ?? 0,
          theValueoftheExecutionContractWithoutProtectionWorks:
              theValueoftheExecutionContractWithoutProtectionWorks ?? 0.0,
          totalContractAmountAfterExtension:
              totalContractAmountAfterExtension ?? 0,
          totalPaidAmount: totalPaidAmount ?? 0.0,
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

  factory RemoteAnalysis.fromJson(Map<String, dynamic> json) =>
      _$RemoteAnalysisFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAnalysisToJson(this);
}
