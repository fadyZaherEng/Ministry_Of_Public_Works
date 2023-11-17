// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_agreement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAgreement _$RemoteAgreementFromJson(Map<String, dynamic> json) =>
    RemoteAgreement(
      id: json['id'] as String?,
      projectName: json['projectName'] as String?,
      totalVariationOrders: (json['totalVariationOrders'] as num?)?.toDouble(),
      projectSector: json['projectSector'] as String?,
      supervisionServiceContractNumber:
          json['supervisionServiceContractNumber'] as String?,
      projectEngineerEmail: json['projectEngineerEmail'] as String?,
      projectEngineerName: json['projectEngineerName'] as String?,
      projectEngineerPhoneNumber: json['projectEngineerPhoneNumber'] as String?,
      beneficiaryName: json['beneficiaryName'] as String?,
      projectEngineerFax: json['projectEngineerFax'] as String?,
      deputyProjectEngineerName: json['deputyProjectEngineerName'] as String?,
      deputyProjectEngineerPhoneNumber:
          json['deputyProjectEngineerPhoneNumber'] as String?,
      deputyProjectEngineerEmail: json['deputyProjectEngineerEmail'] as String?,
      projectNumberFinancial: json['projectNumberFinancial'] as String?,
      consultantName: json['consultantName'] as String?,
      contractorName: json['contractorName'] as String?,
      locationName: json['locationName'] as String?,
      siteArea: json['siteArea'] as String?,
      buildUpArea: json['buildUpArea'] as String?,
      components: json['components'] as String?,
      contractSignDate: json['contractSignDate'] as String?,
      commenceDate: json['commenceDate'] as String?,
      contractualFinishDate: json['contractualFinishDate'] as String?,
      finishDateAfterExtension: json['finishDateAfterExtension'] as String?,
      executionDuration: (json['executionDuration'] as num?)?.toDouble(),
      extensionPeriod: (json['extensionPeriod'] as num?)?.toDouble(),
      remainingDuration: (json['remainingDuration'] as num?)?.toDouble(),
      elapsedTime: (json['elapsedTime'] as num?)?.toDouble(),
      percentageOfElapsedTime: json['percentageOfElapsedTime'] as String?,
      supervisionContractAmount:
          (json['supervisionContractAmount'] as num?)?.toDouble(),
      paymentNumber: json['paymentNumber'] as String?,
      completedServicesAmount:
          (json['completedServicesAmount'] as num?)?.toDouble(),
      completedServicespercentage:
          json['completedServicespercentage'] as String?,
      totalPaymentNetAmount:
          (json['totalPaymentNetAmount'] as num?)?.toDouble(),
      lastPaymentNetAmount: (json['lastPaymentNetAmount'] as num?)?.toDouble(),
      lastPaymentNetAmountDate: json['lastPaymentNetAmountDate'] as String?,
      totalPaidAmount: (json['totalPaidAmount'] as num?)?.toDouble(),
      totalPaidPercentage: json['totalPaidPercentage'] as String?,
      contractValueAfterVariationOrderandExtensionOrders:
          (json['contractValueAfterVariationOrderandExtensionOrders'] as num?)
              ?.toDouble(),
      exchangepercentage: json['exchangepercentage'] as String?,
      variationOrders: (json['variationOrders'] as num?)?.toDouble(),
      variationOrdersPercentage: json['variationOrdersPercentage'] as String?,
      completedWorkDuringthisMonth:
          json['completedWorkDuringthisMonth'] as String?,
      actions: json['actions'] as String?,
      additionalInformation: json['additionalInformation'] as String?,
      month: json['month'] as int?,
      year: json['year'] as int?,
    );

Map<String, dynamic> _$RemoteAgreementToJson(RemoteAgreement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectName': instance.projectName,
      'projectSector': instance.projectSector,
      'supervisionServiceContractNumber':
          instance.supervisionServiceContractNumber,
      'projectEngineerEmail': instance.projectEngineerEmail,
      'projectEngineerName': instance.projectEngineerName,
      'projectEngineerPhoneNumber': instance.projectEngineerPhoneNumber,
      'beneficiaryName': instance.beneficiaryName,
      'projectEngineerFax': instance.projectEngineerFax,
      'deputyProjectEngineerName': instance.deputyProjectEngineerName,
      'deputyProjectEngineerPhoneNumber':
          instance.deputyProjectEngineerPhoneNumber,
      'deputyProjectEngineerEmail': instance.deputyProjectEngineerEmail,
      'projectNumberFinancial': instance.projectNumberFinancial,
      'consultantName': instance.consultantName,
      'contractorName': instance.contractorName,
      'locationName': instance.locationName,
      'siteArea': instance.siteArea,
      'buildUpArea': instance.buildUpArea,
      'components': instance.components,
      'contractSignDate': instance.contractSignDate,
      'commenceDate': instance.commenceDate,
      'contractualFinishDate': instance.contractualFinishDate,
      'finishDateAfterExtension': instance.finishDateAfterExtension,
      'executionDuration': instance.executionDuration,
      'extensionPeriod': instance.extensionPeriod,
      'remainingDuration': instance.remainingDuration,
      'elapsedTime': instance.elapsedTime,
      'percentageOfElapsedTime': instance.percentageOfElapsedTime,
      'supervisionContractAmount': instance.supervisionContractAmount,
      'paymentNumber': instance.paymentNumber,
      'completedServicesAmount': instance.completedServicesAmount,
      'completedServicespercentage': instance.completedServicespercentage,
      'totalPaymentNetAmount': instance.totalPaymentNetAmount,
      'lastPaymentNetAmount': instance.lastPaymentNetAmount,
      'lastPaymentNetAmountDate': instance.lastPaymentNetAmountDate,
      'totalPaidAmount': instance.totalPaidAmount,
      'totalPaidPercentage': instance.totalPaidPercentage,
      'contractValueAfterVariationOrderandExtensionOrders':
          instance.contractValueAfterVariationOrderandExtensionOrders,
      'exchangepercentage': instance.exchangepercentage,
      'variationOrders': instance.variationOrders,
      'totalVariationOrders': instance.totalVariationOrders,
      'variationOrdersPercentage': instance.variationOrdersPercentage,
      'completedWorkDuringthisMonth': instance.completedWorkDuringthisMonth,
      'actions': instance.actions,
      'additionalInformation': instance.additionalInformation,
      'month': instance.month,
      'year': instance.year,
    };
