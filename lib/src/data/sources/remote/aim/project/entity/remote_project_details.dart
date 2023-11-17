import 'package:aim/src/data/sources/remote/aim/project/entity/remote_attachment.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_project_details.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteProjectDetails extends ProjectDetails {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'supervisionServiceContractNumber')
  final String? supervisionServiceContractNumber;

  @JsonKey(name: 'phaseName')
  final String? phaseName;
  @JsonKey(name: 'beneficiaryName')
  final String? beneficiaryName;
  @JsonKey(name: 'headofDepartmentName')
  final String? headofDepartment;
  @JsonKey(name: 'creationDatestr')
  final String? creationDate;
  @JsonKey(name: 'projectEngineerName')
  final String? projectEngineerName;
  @JsonKey(name: 'projectStatusstr')
  final String? statusName;
  @JsonKey(name: 'contractSignDate')
  final String? contractSigningDate;
  @JsonKey(name: 'monthlyReportsCount')
  final int? monthlyReportsCount;
  @JsonKey(name: 'designContractNumber')
  final String? designContractNumber;
  @JsonKey(name: 'projectPaymentsCount')
  final int? projectPaymentsCount;
  @JsonKey(name: 'activeProjectRisksCount')
  final int? activeProjectRisksCount;
  @JsonKey(name: 'activeProjectIssuesCount')
  final int? activeProjectIssuesCount;
  @JsonKey(name: 'getAttachments')
  final List<RemoteAttachment>? files;
  @JsonKey(name: 'getGalleryPicturesList')
  final List<RemoteAttachment>? images;
  @JsonKey(name: 'financialSystemReferenceNumber')
  final String? financialSystemReferenceNumber;
  @JsonKey(name: 'projectSector')
  final String? sector;
  @JsonKey(name: 'projectEngineerPhoneNumber')
  final String? projectEngineerPhoneNumber;
  @JsonKey(name: 'projectEngineerFax')
  final String? projectEngineerFax;
  @JsonKey(name: 'projectEngineerEmail')
  final String? projectEngineerEmail;
  @JsonKey(name: 'headofDepartmentEmail')
  final String? headOfDepartmentEmail;
  @JsonKey(name: 'deputyProjectEngineerName')
  final String? deputyManager;
  @JsonKey(name: 'deputyProjectEngineerPhoneNumber')
  final String? deputyManagerPhoneNumber;
  @JsonKey(name: 'deputyProjectEngineerEmail')
  final String? deputyManagerEmail;
  @JsonKey(name: 'deputyProjectEngineerFax')
  final String? deputyManagerFax;
  @JsonKey(name: 'consultantName')
  final String? consultant;
  @JsonKey(name: 'locationName')
  final String? locationName;
  @JsonKey(name: 'governorate')
  final int? governorate;
  @JsonKey(name: 'governorateName')
  final String? governorateName;
  @JsonKey(name: 'siteArea')
  final String? siteArea;
  @JsonKey(name: 'buildUpArea')
  final String? buildUpArea;
  @JsonKey(name: 'components')
  final String? components;
  @JsonKey(name: 'expectedStartDate')
  final String? expectedStartDate;
  @JsonKey(name: 'projectNameArabic')
  final String? projectNameArabic;

  @JsonKey(name: 'totalDuration')
  final double? totalDuration;
  @JsonKey(name: 'durationMonth')
  final double? durationMonth;
  @JsonKey(name: 'durationDay')
  final double? durationDay;
  @JsonKey(name: 'agreementPeriod')
  final int? agreementPeriod;
  @JsonKey(name: 'consultancyServicesStartDatestr')
  final String? consultancyServicesStartDate;
  @JsonKey(name: 'plannedImplementationDatestr')
  final String? plannedImplementationDate;
  @JsonKey(name: 'consultancyServicesExpirationDatestr')
  final String? consultancyServicesExpirationDate;
  @JsonKey(name: 'tenderDate')
  final String? tenderDate;
  @JsonKey(name: 'projectNumberFinancial')
  final String? projectNumberFinancial;
  @JsonKey(name: 'contractAmount')
  final double? contractAmount;
  @JsonKey(name: 'projectEstimatedValue')
  final double? theEstimatedValueOfTheProject;
  @JsonKey(name: 'totalOptionalAmount')
  final double? totalOptionalAmount;
  @JsonKey(name: 'phase')
  final int? phaseID;
  @JsonKey(name: 'executionContractNumber')
  final String? executionContractNumber;
  @JsonKey(name: 'contractorName')
  final String? contractorName;
  @JsonKey(name: 'contractorPhoneNumber')
  final String? contractorPhoneNumber;
  @JsonKey(name: 'contractorFax')
  final String? contractorFax;
  @JsonKey(name: 'commenceDate')
  final String? commenceDate;
  @JsonKey(name: 'directSupervisionstr')
  final String? directSupervision;
  @JsonKey(name: 'isitanOperationandMaintenanceContractstr')
  final String? isitanOperationandMaintenanceContract;
  @JsonKey(name: 'contractualCompletionDate')
  final String? contractualCompletionDate;
  @JsonKey(name: 'totalReserveItemsAmount')
  final double? totalReserveItemsAmount;
  @JsonKey(name: 'totalOptionalItemsAmount')
  final double? totalOptionalItemsAmount;
  @JsonKey(name: 'optionalWorksAmount')
  final double? optionalWorksAmount;
  @JsonKey(name: 'executionExpectedCompletionDate')
  final String? executionExpectedCompletionDate;
  @JsonKey(name: 'closeoutDate')
  final String? closeoutDate;
  @JsonKey(name: 'designCompletionDate')
  final String? designCompletionDate;
  @JsonKey(name: 'expectedTenderingDate')
  final String? expectedTenderingDate;
  @JsonKey(name: 'warrantiesCount')
  final int? warrantiesCount;
  @JsonKey(name: 'milestonesCount')
  final int? milestonesCount;
  @JsonKey(name: 'totalPenalties')
  final int? totalPenalties;
  @JsonKey(name: 'sumOfVariationOrdersValues')
  final int? sumOfVariationOrdersValues;

  RemoteProjectDetails(
    this.id,
    this.projectName,
    this.milestonesCount,
    this.warrantiesCount,
    this.governorateName,
    this.supervisionServiceContractNumber,
    this.optionalWorksAmount,
    this.designCompletionDate,
    this.expectedTenderingDate,
    this.closeoutDate,
    this.executionExpectedCompletionDate,
    this.agreementNumber,
    this.projectNameArabic,
    this.phaseName,
    this.phaseID,
    this.beneficiaryName,
    this.creationDate,
    this.projectEngineerName,
    this.headofDepartment,
    this.statusName,
    this.durationMonth,
    this.durationDay,
    this.contractSigningDate,
    this.monthlyReportsCount,
    this.designContractNumber,
    this.projectPaymentsCount,
    this.activeProjectRisksCount,
    this.activeProjectIssuesCount,
    this.files,
    this.images,
    this.consultant,
    this.sector,
    this.deputyManagerEmail,
    this.deputyManagerPhoneNumber,
    this.deputyManager,
    this.projectEngineerFax,
    this.projectEngineerEmail,
    this.projectEngineerPhoneNumber,
    this.deputyManagerFax,
    this.headOfDepartmentEmail,
    this.financialSystemReferenceNumber,
    this.governorate,
    this.components,
    this.buildUpArea,
    this.siteArea,
    this.locationName,
    this.contractAmount,
    this.totalDuration,
    this.consultancyServicesStartDate,
    this.consultancyServicesExpirationDate,
    this.tenderDate,
    this.plannedImplementationDate,
    this.agreementPeriod,
    this.totalOptionalAmount,
    this.theEstimatedValueOfTheProject,
    this.projectNumberFinancial,
    this.expectedStartDate,
    this.isitanOperationandMaintenanceContract,
    this.contractorFax,
    this.contractorPhoneNumber,
    this.contractorName,
    this.commenceDate,
    this.contractualCompletionDate,
    this.executionContractNumber,
    this.totalOptionalItemsAmount,
    this.totalReserveItemsAmount,
    this.directSupervision,
    this.sumOfVariationOrdersValues,
    this.totalPenalties,
  ) : super(
          isitanOperationandMaintenanceContract:
              isitanOperationandMaintenanceContract ?? "",
          directSupervision: directSupervision ?? "",
    warrantiesCount: warrantiesCount ?? 0,
    milestonesCount: milestonesCount ?? 0,
    totalPenalties: totalPenalties ?? 0,
    sumOfVariationOrdersValues: sumOfVariationOrdersValues ?? 0,
          totalReserveItemsAmount: totalReserveItemsAmount ?? 0.0,
          optionalWorksAmount: optionalWorksAmount ?? 0.0,
          totalOptionalItemsAmount: totalOptionalItemsAmount ?? 0.0,
          durationDay: durationDay ?? 0.0,
          durationMonth: durationMonth ?? 0.0,
          executionContractNumber: executionContractNumber ?? "",
          designCompletionDate: designCompletionDate ?? "",
          expectedTenderingDate: expectedTenderingDate ?? "",
    governorateName: governorateName ?? "",
    supervisionServiceContractNumber: supervisionServiceContractNumber ?? "",
    projectNameArabic: projectNameArabic ?? "",
          executionExpectedCompletionDate:
              executionExpectedCompletionDate ?? "",
          closeoutDate: closeoutDate ?? "",
          contractualCompletionDate: contractualCompletionDate ?? "",
          commenceDate: commenceDate ?? "",
          contractorPhoneNumber: contractorPhoneNumber ?? "",
          contractorName: contractorName ?? "",
          contractorFax: contractorFax ?? "",
          id: id ?? "",
          projectName: projectName ?? "",
          agreementNumber: agreementNumber ?? "",
          phaseName: phaseName ?? "",
          phaseID: phaseID ?? 0,
          endUser: beneficiaryName ?? "",
          creationDate: creationDate ?? "",
          headofDepartment: headofDepartment ?? "",
          statusName: statusName ?? "",
          projectEngineerName: projectEngineerName ?? "",
          contractSigningDate: contractSigningDate ?? "",
          monthlyReportsCount: monthlyReportsCount ?? 0,
          activeProjectIssuesCount: activeProjectIssuesCount ?? 0,
          designContractNumber: designContractNumber ?? "",
          projectPaymentsCount: projectPaymentsCount ?? 0,
          activeProjectRisksCount: activeProjectRisksCount ?? 0,
          files: files ?? [],
          images: images ?? [],
          consultant: consultant ?? "",
          sector: sector ?? "",
          deputyManagerEmail: deputyManagerEmail ?? "",
          deputyManagerPhoneNumber: deputyManagerPhoneNumber ?? "",
          deputyManager: deputyManager ?? "",
          projectEngineerFax: projectEngineerFax ?? "",
          projectEngineerEmail: projectEngineerEmail ?? "",
          projectEngineerPhoneNumber: projectEngineerPhoneNumber ?? "",
          deputyManagerFax: deputyManagerFax ?? "",
          headOfDepartmentEmail: headOfDepartmentEmail ?? "",
          financialSystemReferenceNumber: financialSystemReferenceNumber ?? "",
          governorate: governorate ?? 0,
          components: components ?? "",
          buildUpArea: buildUpArea ?? "",
          siteArea: siteArea ?? "",
          locationName: locationName ?? "",
          contractAmount: contractAmount ?? 0.0,
          totalDuration: totalDuration ?? 0.0,
          consultancyServicesStartDate: consultancyServicesStartDate ?? "",
          consultancyServicesExpirationDate:
              consultancyServicesExpirationDate ?? "",
          tenderDate: tenderDate ?? "",
          plannedImplementationDate: plannedImplementationDate ?? "",
          agreementPeriod: agreementPeriod ?? 0,
          totalOptionalAmount: totalOptionalAmount ?? 0.0,
          theEstimatedValueOfTheProject: theEstimatedValueOfTheProject ?? 0.0,
          projectNumberFinancial: projectNumberFinancial ?? "",
          expectedStartDate: expectedStartDate ?? "",
        );

  factory RemoteProjectDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteProjectDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteProjectDetailsToJson(this);
}
