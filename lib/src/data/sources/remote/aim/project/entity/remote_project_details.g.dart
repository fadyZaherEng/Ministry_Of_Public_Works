// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_project_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteProjectDetails _$RemoteProjectDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteProjectDetails(
      json['id'] as String?,
      json['projectName'] as String?,
      json['milestonesCount'] as int?,
      json['warrantiesCount'] as int?,
      json['governorateName'] as String?,
      json['supervisionServiceContractNumber'] as String?,
      (json['optionalWorksAmount'] as num?)?.toDouble(),
      json['designCompletionDate'] as String?,
      json['expectedTenderingDate'] as String?,
      json['closeoutDate'] as String?,
      json['executionExpectedCompletionDate'] as String?,
      json['contractNumber'] as String?,
      json['projectNameArabic'] as String?,
      json['phaseName'] as String?,
      json['phase'] as int?,
      json['beneficiaryName'] as String?,
      json['creationDatestr'] as String?,
      json['projectEngineerName'] as String?,
      json['headofDepartmentName'] as String?,
      json['projectStatusstr'] as String?,
      (json['durationMonth'] as num?)?.toDouble(),
      (json['durationDay'] as num?)?.toDouble(),
      json['contractSignDate'] as String?,
      json['monthlyReportsCount'] as int?,
      json['designContractNumber'] as String?,
      json['projectPaymentsCount'] as int?,
      json['activeProjectRisksCount'] as int?,
      json['activeProjectIssuesCount'] as int?,
      (json['getAttachments'] as List<dynamic>?)
          ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['getGalleryPicturesList'] as List<dynamic>?)
          ?.map((e) => RemoteAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['consultantName'] as String?,
      json['projectSector'] as String?,
      json['deputyProjectEngineerEmail'] as String?,
      json['deputyProjectEngineerPhoneNumber'] as String?,
      json['deputyProjectEngineerName'] as String?,
      json['projectEngineerFax'] as String?,
      json['projectEngineerEmail'] as String?,
      json['projectEngineerPhoneNumber'] as String?,
      json['deputyProjectEngineerFax'] as String?,
      json['headofDepartmentEmail'] as String?,
      json['financialSystemReferenceNumber'] as String?,
      json['governorate'] as int?,
      json['components'] as String?,
      json['buildUpArea'] as String?,
      json['siteArea'] as String?,
      json['locationName'] as String?,
      (json['contractAmount'] as num?)?.toDouble(),
      (json['totalDuration'] as num?)?.toDouble(),
      json['consultancyServicesStartDatestr'] as String?,
      json['consultancyServicesExpirationDatestr'] as String?,
      json['tenderDate'] as String?,
      json['plannedImplementationDatestr'] as String?,
      json['agreementPeriod'] as int?,
      (json['totalOptionalAmount'] as num?)?.toDouble(),
      (json['projectEstimatedValue'] as num?)?.toDouble(),
      json['projectNumberFinancial'] as String?,
      json['expectedStartDate'] as String?,
      json['isitanOperationandMaintenanceContractstr'] as String?,
      json['contractorFax'] as String?,
      json['contractorPhoneNumber'] as String?,
      json['contractorName'] as String?,
      json['commenceDate'] as String?,
      json['contractualCompletionDate'] as String?,
      json['executionContractNumber'] as String?,
      (json['totalOptionalItemsAmount'] as num?)?.toDouble(),
      (json['totalReserveItemsAmount'] as num?)?.toDouble(),
      json['directSupervisionstr'] as String?,
      json['sumOfVariationOrdersValues'] as int?,
      json['totalPenalties'] as int?,
    );

Map<String, dynamic> _$RemoteProjectDetailsToJson(
        RemoteProjectDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'contractNumber': instance.agreementNumber,
      'supervisionServiceContractNumber':
          instance.supervisionServiceContractNumber,
      'phaseName': instance.phaseName,
      'beneficiaryName': instance.beneficiaryName,
      'headofDepartmentName': instance.headofDepartment,
      'creationDatestr': instance.creationDate,
      'projectEngineerName': instance.projectEngineerName,
      'projectStatusstr': instance.statusName,
      'contractSignDate': instance.contractSigningDate,
      'monthlyReportsCount': instance.monthlyReportsCount,
      'designContractNumber': instance.designContractNumber,
      'projectPaymentsCount': instance.projectPaymentsCount,
      'activeProjectRisksCount': instance.activeProjectRisksCount,
      'activeProjectIssuesCount': instance.activeProjectIssuesCount,
      'getAttachments': instance.files,
      'getGalleryPicturesList': instance.images,
      'financialSystemReferenceNumber': instance.financialSystemReferenceNumber,
      'projectSector': instance.sector,
      'projectEngineerPhoneNumber': instance.projectEngineerPhoneNumber,
      'projectEngineerFax': instance.projectEngineerFax,
      'projectEngineerEmail': instance.projectEngineerEmail,
      'headofDepartmentEmail': instance.headOfDepartmentEmail,
      'deputyProjectEngineerName': instance.deputyManager,
      'deputyProjectEngineerPhoneNumber': instance.deputyManagerPhoneNumber,
      'deputyProjectEngineerEmail': instance.deputyManagerEmail,
      'deputyProjectEngineerFax': instance.deputyManagerFax,
      'consultantName': instance.consultant,
      'locationName': instance.locationName,
      'governorate': instance.governorate,
      'governorateName': instance.governorateName,
      'siteArea': instance.siteArea,
      'buildUpArea': instance.buildUpArea,
      'components': instance.components,
      'expectedStartDate': instance.expectedStartDate,
      'projectNameArabic': instance.projectNameArabic,
      'totalDuration': instance.totalDuration,
      'durationMonth': instance.durationMonth,
      'durationDay': instance.durationDay,
      'agreementPeriod': instance.agreementPeriod,
      'consultancyServicesStartDatestr': instance.consultancyServicesStartDate,
      'plannedImplementationDatestr': instance.plannedImplementationDate,
      'consultancyServicesExpirationDatestr':
          instance.consultancyServicesExpirationDate,
      'tenderDate': instance.tenderDate,
      'projectNumberFinancial': instance.projectNumberFinancial,
      'contractAmount': instance.contractAmount,
      'projectEstimatedValue': instance.theEstimatedValueOfTheProject,
      'totalOptionalAmount': instance.totalOptionalAmount,
      'phase': instance.phaseID,
      'executionContractNumber': instance.executionContractNumber,
      'contractorName': instance.contractorName,
      'contractorPhoneNumber': instance.contractorPhoneNumber,
      'contractorFax': instance.contractorFax,
      'commenceDate': instance.commenceDate,
      'directSupervisionstr': instance.directSupervision,
      'isitanOperationandMaintenanceContractstr':
          instance.isitanOperationandMaintenanceContract,
      'contractualCompletionDate': instance.contractualCompletionDate,
      'totalReserveItemsAmount': instance.totalReserveItemsAmount,
      'totalOptionalItemsAmount': instance.totalOptionalItemsAmount,
      'optionalWorksAmount': instance.optionalWorksAmount,
      'executionExpectedCompletionDate':
          instance.executionExpectedCompletionDate,
      'closeoutDate': instance.closeoutDate,
      'designCompletionDate': instance.designCompletionDate,
      'expectedTenderingDate': instance.expectedTenderingDate,
      'warrantiesCount': instance.warrantiesCount,
      'milestonesCount': instance.milestonesCount,
      'totalPenalties': instance.totalPenalties,
      'sumOfVariationOrdersValues': instance.sumOfVariationOrdersValues,
    };
