// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteReport _$RemoteReportFromJson(Map<String, dynamic> json) => RemoteReport(
      json['id'] as String?,
      json['projectName'] as String?,
      json['closeoutDate'] as String?,
      json['expectedTenderingDate'] as String?,
      (json['supervisionServicesValue'] as num?)?.toDouble(),
      json['remeasureItemsPercentage'] as String?,
      (json['totalValueofOutgoingPayments'] as num?)?.toDouble(),
      (json['totalPaidWithAdvancedPayment'] as num?)?.toDouble(),
      (json['actualdelay'] as num?)?.toDouble(),
      json['contractSignDate'] as String?,
      json['executionExpectedCompletionDate'] as String?,
      (json['remeasureItemsAmount'] as num?)?.toDouble(),
      json['designCompletionDate'] as String?,
      (json['estimatedPaymentCertificate'] as num?)?.toDouble(),
      (json['actualPaymentCertificate'] as num?)?.toDouble(),
      json['contractNumber'] as String?,
      json['phaseName'] as String?,
      (json['siteAreaDecimal'] as num?)?.toDouble(),
      (json['buildUpAreaDecimal'] as num?)?.toDouble(),
      (json['contractDuration'] as num?)?.toDouble(),
      (json['actualPercentageofCompletion'] as num?)?.toDouble(),
      json['headofDepartmentEmail'] as String?,
      json['creationDate'] as String?,
      json['projectNumberFinancial'] as String?,
      json['agreementNumber'] as String?,
      (json['contractAmount'] as num?)?.toDouble(),
      json['deputyProjectEngineerPhoneNumber'] as String?,
      json['projectEngineerName'] as String?,
      json['actions'] as String?,
      (json['activeProvisionalSum'] as num?)?.toDouble(),
      json['activeProvisionalSumPercentage'] as String?,
      json['executionContractNumber'] as String?,
      (json['actualCompletionRateforthisMonth'] as num?)?.toDouble(),
      (json['actualPercentageofComplete'] as num?)?.toDouble(),
      json['additionalInformation'] as String?,
      json['agreementNumberForConsultancyServices'] as String?,
      json['agreementNumberForExecution'] as String?,
      (json['agreementPeriod'] as num?)?.toDouble(),
      json['agreementSignDate'] as String?,
      json['agreementTotalAmount'] as String?,
      json['beneficiaryName'] as String?,
      json['budgetClausenumber'] as String?,
      json['budgetClauseNumber'] as String?,
      json['buildUpArea'] as String?,
      (json['completedWorkAmount'] as num?)?.toDouble(),
      json['completedWorkAmountDate'] as String?,
      (json['completedWorkandStoredMaterials'] as num?)?.toDouble(),
      json['completedWorkandStoredMaterialsPercentage'] as String?,
      json['completedWorkDuringthisMonth'] as String?,
      json['completionDateAfterExtension'] as String?,
      json['deputyProjectEngineerName'] as String?,
      json['components'] as String?,
      json['consultancyServicesExpirationDate'] as String?,
      json['consultancyServicesStartDate'] as String?,
      json['consultantEmail'] as String?,
      json['consultantName'] as String?,
      json['consultantPhoneNumber'] as String?,
      json['consultantsId'] as String?,
      json['contractorFax'] as String?,
      json['contractorName'] as String?,
      json['contractorPhoneNumber'] as String?,
      (json['contractPeriod'] as num?)?.toDouble(),
      json['contractSigningDate'] as String?,
      json['contractualCompletionDate'] as String?,
      json['completionDateAfterExtensionstr'] as String?,
      (json['contractualCompletionPercentage'] as num?)?.toDouble(),
      json['countofActualDelay'] as String?,
      json['createdBy'] as String?,
      json['creationDatestr'] as String?,
      json['deputyManager'] as String?,
      json['deputyProjectEngineerEmail'] as String?,
      json['designAgreementValue'] as String?,
      json['designFinishDatewithExtension'] as String?,
      (json['earlyStartCompletionrateforthisMonth'] as num?)?.toDouble(),
      (json['elapsedTime'] as num?)?.toDouble(),
      (json['earlyPlannedPercentageofCompletion'] as num?)?.toDouble(),
      (json['estimatedFinancialProvision'] as num?)?.toDouble(),
      json['exchangepercentage'] as String?,
      json['expectedStartDate'] as String?,
      (json['extensionPeriod'] as num?)?.toDouble(),
      (json['financialProvision'] as num?)?.toDouble(),
      json['getPdfFile'] as String?,
      json['governorateName'] as String?,
      json['headofDepartmentName'] as String?,
      json['idReplaced'] as String?,
      (json['inactiveProvisionalSum'] as num?)?.toDouble(),
      json['inactiveProvisionalSumPercentage'] as String?,
      json['isDeleted'] as bool?,
      (json['lastPaymentCertificateAmount'] as num?)?.toDouble(),
      json['lastPaymentCertificateDate'] as String?,
      (json['lastPaymentNetAmount'] as num?)?.toDouble(),
      json['lastPaymentNetAmountDate'] as String?,
      (json['lateStartCompletionRateforthisMonth'] as num?)?.toDouble(),
      json['latestPaymentCertificateNumber'] as String?,
      json['locationName'] as String?,
      (json['measurementsVariations'] as num?)?.toDouble(),
      json['measurementsVariationsPercentage'] as String?,
      json['modificationDate'] as String?,
      json['modifiedBy'] as String?,
      json['month'] as String?,
      json['notes'] as String?,
      (json['optionalWorksagreementAmount'] as num?)?.toDouble(),
      json['paymentCertificateNumber'] as String?,
      json['pdfFile'] as String?,
      json['pdfFileId'] as String?,
      json['percentageofElapsedTime'] as String?,
      json['periodDate'] as String?,
      json['periodTitle'] as String?,
      (json['phase'] as num?)?.toDouble(),
      json['phoneNumberDeputyManager'] as String?,
      json['plannedHandoverDate'] as String?,
      json['plannedImplementationDate'] as String?,
      (json['plannedPercentageofCompletion'] as num?)?.toDouble(),
      json['project'] as String?,
      json['projectEngineerEmail'] as String?,
      json['projectEngineerFax'] as String?,
      json['projectEngineerPhoneNumber'] as String?,
      json['projectId'] as String?,
      json['projectSector'] as String?,
      json['projectSectorId'] as String?,
      json['delayReasons'] as String?,
      (json['latePlannedPercentageofCompletion'] as num?)?.toDouble(),
      json['recoveryFinishDate'] as String?,
      (json['recoveryPercentageofCompletion'] as num?)?.toDouble(),
      (json['remainingDuration'] as num?)?.toDouble(),
      json['reportName'] as String?,
      json['siteArea'] as String?,
      json['startDate'] as String?,
      (json['startStatus'] as num?)?.toDouble(),
      (json['status'] as num?)?.toDouble(),
      json['statusStr'] as String?,
      (json['sumOfProjectVariationOrders'] as num?)?.toDouble(),
      (json['supervisionAgreementAmount'] as num?)?.toDouble(),
      (json['projectEstimatedValue'] as num?)?.toDouble(),
      (json['designValue'] as num?)?.toDouble(),
      (json['theValueoftheExecutionContractWithoutProtectionWorks'] as num?)
          ?.toDouble(),
      (json['totalContractAmountAfterExtension'] as num?)?.toDouble(),
      (json['totalPaid'] as num?)?.toDouble(),
      json['totalValueofOutgoingPaymentsFinancialforDepartment'] as String?,
      (json['totalValueofOutgoingPaymentsforSector'] as num?)?.toDouble(),
      (json['totalVariationOrders'] as num?)?.toDouble(),
      json['variationOrders'] as String?,
      json['variationOrdersId'] as String?,
      json['variationOrdersPercentage'] as String?,
      (json['variationOrdersValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      json['commenceDate'] as String?,
      json['expectedCompletionDateUpdated'] as String?,
      json['year'] as String?,
      (json['delay'] as num?)?.toDouble(),
      (json['durationDay'] as num?)?.toDouble(),
      json['designCompletionDateAfterExtension'] as String?,
      (json['delayPercentage'] as num?)?.toDouble(),
      json['tenderDate'] as String?,
      (json['durationMonth'] as num?)?.toDouble(),
      (json['optionalWorksValue'] as num?)?.toDouble(),
      (json['contractTotalAmount'] as num?)?.toDouble(),
      (json['paymentCertificate'] as num?)?.toDouble(),
      (json['actualCost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RemoteReportToJson(RemoteReport instance) =>
    <String, dynamic>{
      'actions': instance.actions,
      'contractNumber': instance.contractNumber,
      'activeProvisionalSum': instance.activeProvisionalSum,
      'actualdelay': instance.actualdelay,
      'activeProvisionalSumPercentage': instance.activeProvisionalSumPercentage,
      'executionContractNumber': instance.executionContractNumber,
      'actualCompletionRateforthisMonth':
          instance.actualCompletionRateforthisMonth,
      'remeasureItemsAmount': instance.remeasureItemsAmount,
      'actualPercentageofComplete': instance.actualPercentageofComplete,
      'additionalInformation': instance.additionalInformation,
      'agreementNumber': instance.agreementNumber,
      'agreementNumberForConsultancyServices':
          instance.agreementNumberForConsultancyServices,
      'agreementNumberForExecution': instance.agreementNumberForExecution,
      'agreementPeriod': instance.agreementPeriod,
      'agreementSignDate': instance.agreementSignDate,
      'agreementTotalAmount': instance.agreementTotalAmount,
      'beneficiaryName': instance.beneficiaryName,
      'budgetClausenumber': instance.budgetClausenumber,
      'budgetClauseNumber': instance.budgetClauseNumber,
      'buildUpArea': instance.buildUpArea,
      'buildUpAreaDecimal': instance.buildUpAreaDecimal,
      'siteAreaDecimal': instance.siteAreaDecimal,
      'completedWorkAmount': instance.completedWorkAmount,
      'completedWorkAmountDate': instance.completedWorkAmountDate,
      'completedWorkandStoredMaterials':
          instance.completedWorkandStoredMaterials,
      'completedWorkandStoredMaterialsPercentage':
          instance.completedWorkandStoredMaterialsPercentage,
      'completedWorkDuringthisMonth': instance.completedWorkDuringthisMonth,
      'completionDateAfterExtension': instance.completionDateAfterExtension,
      'components': instance.components,
      'consultancyServicesExpirationDate':
          instance.consultancyServicesExpirationDate,
      'consultancyServicesStartDate': instance.consultancyServicesStartDate,
      'consultantEmail': instance.consultantEmail,
      'consultantName': instance.consultantName,
      'consultantPhoneNumber': instance.consultantPhoneNumber,
      'consultantsId': instance.consultantsId,
      'contractAmount': instance.contractAmount,
      'contractorFax': instance.contractorFax,
      'contractorName': instance.contractorName,
      'contractorPhoneNumber': instance.contractorPhoneNumber,
      'contractPeriod': instance.contractPeriod,
      'contractSigningDate': instance.contractSigningDate,
      'contractualCompletionDate': instance.contractualCompletionDate,
      'contractualCompletionPercentage':
          instance.contractualCompletionPercentage,
      'countofActualDelay': instance.countofActualDelay,
      'createdBy': instance.createdBy,
      'creationDate': instance.creationDate,
      'creationDatestr': instance.creationDatestr,
      'deputyManager': instance.deputyManager,
      'deputyProjectEngineerName': instance.deputyProjectEngineerName,
      'deputyProjectEngineerEmail': instance.deputyProjectEngineerEmail,
      'deputyProjectEngineerPhoneNumber':
          instance.deputyProjectEngineerPhoneNumber,
      'designAgreementValue': instance.designAgreementValue,
      'designFinishDatewithExtension': instance.designFinishDatewithExtension,
      'earlyStartCompletionrateforthisMonth':
          instance.earlyStartCompletionrateforthisMonth,
      'elapsedTime': instance.elapsedTime,
      'estimatedFinancialProvision': instance.estimatedFinancialProvision,
      'exchangepercentage': instance.exchangepercentage,
      'expectedStartDate': instance.expectedStartDate,
      'extensionPeriod': instance.extensionPeriod,
      'financialProvision': instance.financialProvision,
      'getPdfFile': instance.getPdfFile,
      'governorateName': instance.governorateName,
      'headofDepartmentName': instance.headofDepartmentName,
      'id': instance.id,
      'idReplaced': instance.idReplaced,
      'inactiveProvisionalSum': instance.inactiveProvisionalSum,
      'inactiveProvisionalSumPercentage':
          instance.inactiveProvisionalSumPercentage,
      'isDeleted': instance.isDeleted,
      'lastPaymentCertificateAmount': instance.lastPaymentCertificateAmount,
      'lastPaymentCertificateDate': instance.lastPaymentCertificateDate,
      'lastPaymentNetAmount': instance.lastPaymentNetAmount,
      'actualPaymentCertificate': instance.actualPaymentCertificate,
      'estimatedPaymentCertificate': instance.estimatedPaymentCertificate,
      'lastPaymentNetAmountDate': instance.lastPaymentNetAmountDate,
      'lateStartCompletionRateforthisMonth':
          instance.lateStartCompletionRateforthisMonth,
      'latestPaymentCertificateNumber': instance.latestPaymentCertificateNumber,
      'locationName': instance.locationName,
      'measurementsVariations': instance.measurementsVariations,
      'measurementsVariationsPercentage':
          instance.measurementsVariationsPercentage,
      'modificationDate': instance.modificationDate,
      'modifiedBy': instance.modifiedBy,
      'month': instance.month,
      'notes': instance.notes,
      'optionalWorksagreementAmount': instance.optionalWorksagreementAmount,
      'paymentCertificateNumber': instance.paymentCertificateNumber,
      'pdfFile': instance.pdfFile,
      'pdfFileId': instance.pdfFileId,
      'percentageofElapsedTime': instance.percentageofElapsedTime,
      'periodDate': instance.periodDate,
      'periodTitle': instance.periodTitle,
      'projectNumberFinancial': instance.projectNumberFinancial,
      'phase': instance.phase,
      'phaseName': instance.phaseName,
      'phoneNumberDeputyManager': instance.phoneNumberDeputyManager,
      'plannedHandoverDate': instance.plannedHandoverDate,
      'plannedImplementationDate': instance.plannedImplementationDate,
      'plannedPercentageofCompletion': instance.plannedPercentageofCompletion,
      'project': instance.project,
      'projectEngineerEmail': instance.projectEngineerEmail,
      'projectEngineerFax': instance.projectEngineerFax,
      'projectEngineerName': instance.projectEngineerName,
      'projectEngineerPhoneNumber': instance.projectEngineerPhoneNumber,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'projectSector': instance.projectSector,
      'projectSectorId': instance.projectSectorId,
      'delayReasons': instance.delayReasons,
      'recoveryFinishDate': instance.recoveryFinishDate,
      'headofDepartmentEmail': instance.headofDepartmentEmail,
      'recoveryPercentageofCompletion': instance.recoveryPercentageofCompletion,
      'remainingDuration': instance.remainingDuration,
      'reportName': instance.reportName,
      'siteArea': instance.siteArea,
      'startDate': instance.startDate,
      'startStatus': instance.startStatus,
      'status': instance.status,
      'statusStr': instance.statusStr,
      'sumOfProjectVariationOrders': instance.sumOfProjectVariationOrders,
      'supervisionAgreementAmount': instance.supervisionAgreementAmount,
      'projectEstimatedValue': instance.projectEstimatedValue,
      'theValueoftheExecutionContractWithoutProtectionWorks':
          instance.theValueoftheExecutionContractWithoutProtectionWorks,
      'totalContractAmountAfterExtension':
          instance.totalContractAmountAfterExtension,
      'totalPaid': instance.totalPaid,
      'totalValueofOutgoingPaymentsFinancialforDepartment':
          instance.totalValueofOutgoingPaymentsFinancialforDepartment,
      'totalValueofOutgoingPaymentsforSector':
          instance.totalValueofOutgoingPaymentsforSector,
      'contractDuration': instance.contractDuration,
      'totalVariationOrders': instance.totalVariationOrders,
      'delayPercentage': instance.delayPercentage,
      'delay': instance.delay,
      'earlyPlannedPercentageofCompletion':
          instance.earlyPlannedPercentageofCompletion,
      'latePlannedPercentageofCompletion':
          instance.latePlannedPercentageofCompletion,
      'actualPercentageofCompletion': instance.actualPercentageofCompletion,
      'durationMonth': instance.durationMonth,
      'durationDay': instance.durationDay,
      'designValue': instance.designValue,
      'optionalWorksValue': instance.optionalWorksValue,
      'supervisionServicesValue': instance.supervisionServicesValue,
      'variationOrders': instance.variationOrders,
      'variationOrdersId': instance.variationOrdersId,
      'variationOrdersPercentage': instance.variationOrdersPercentage,
      'variationOrdersValues': instance.variationOrdersValues,
      'year': instance.year,
      'contractSignDate': instance.contractSignDate,
      'commenceDate': instance.commenceDate,
      'completionDateAfterExtensionstr':
          instance.completionDateAfterExtensionstr,
      'expectedCompletionDateUpdated': instance.expectedCompletionDateUpdated,
      'designCompletionDate': instance.designCompletionDate,
      'designCompletionDateAfterExtension':
          instance.designCompletionDateAfterExtension,
      'tenderDate': instance.tenderDate,
      'closeoutDate': instance.closeoutDate,
      'executionExpectedCompletionDate':
          instance.executionExpectedCompletionDate,
      'remeasureItemsPercentage': instance.remeasureItemsPercentage,
      'expectedTenderingDate': instance.expectedTenderingDate,
      'contractTotalAmount': instance.contractTotalAmount,
      'totalValueofOutgoingPayments': instance.totalValueofOutgoingPayments,
      'paymentCertificate': instance.paymentCertificate,
      'totalPaidWithAdvancedPayment': instance.totalPaidWithAdvancedPayment,
      'actualCost': instance.actualCost,
    };