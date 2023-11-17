import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:equatable/equatable.dart';

class ProjectDetails extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? phaseName;
  final int? phaseID;
  final String? endUser;
  final String? headofDepartment;
  final String? projectNameArabic;
  final String? creationDate;
  final String? projectEngineerName;
  final String? governorateName;
  final String? statusName;
  final String? contractSigningDate;
  final int? monthlyReportsCount;
  final String? designContractNumber;
  final int? projectPaymentsCount;
  final int? activeProjectRisksCount;
  final int? activeProjectIssuesCount;
  final List<Attachment>? files;
  final List<Attachment>? images;
  final String? financialSystemReferenceNumber;
  final String? sector;
  final String? projectEngineerPhoneNumber;
  final String? projectEngineerFax;
  final String? projectEngineerEmail;
  final String? headOfDepartmentEmail;
  final String? deputyManager;
  final String? deputyManagerPhoneNumber;
  final String? deputyManagerEmail;
  final String? deputyManagerFax;
  final String? consultant;
  final String? locationName;
  final int? governorate;
  final String? siteArea;
  final String? buildUpArea;
  final String? components;
  final String? expectedStartDate;
  final double? totalDuration;
  final double? durationMonth;
  final double? durationDay;
  final int? agreementPeriod;
  final String? consultancyServicesStartDate;
  final String? plannedImplementationDate;
  final String? consultancyServicesExpirationDate;
  final String? tenderDate;
  final double? contractAmount;
  final double? theEstimatedValueOfTheProject;
  final double? totalOptionalAmount;
  final String? projectNumberFinancial;
  final String? executionContractNumber;
  final String? contractorName;
  final String? contractorPhoneNumber;
  final String? contractorFax;
  final String? commenceDate;
  final String? directSupervision;
  final String? isitanOperationandMaintenanceContract;
  final String? contractualCompletionDate;
  final double? totalReserveItemsAmount;
  final double? totalOptionalItemsAmount;
  final double? optionalWorksAmount;

  final String? executionExpectedCompletionDate;
  final String? closeoutDate;
  final String? designCompletionDate;
  final String? expectedTenderingDate;
  final String? supervisionServiceContractNumber;
  final int? milestonesCount;
  final int? warrantiesCount;
  final int? totalPenalties;
  final int? sumOfVariationOrdersValues;

  const ProjectDetails({
    this.executionExpectedCompletionDate = "",
    this.expectedTenderingDate = "",
    this.governorateName = "",
    this.closeoutDate = "",
    this.supervisionServiceContractNumber = "",
    this.designCompletionDate = "",
    this.projectNameArabic = "",
    this.totalReserveItemsAmount = 0.0,
    this.durationDay = 0.0,
    this.durationMonth = 0.0,
    this.optionalWorksAmount = 0.0,
    this.totalOptionalItemsAmount = 0.0,
    this.contractualCompletionDate = "",
    this.directSupervision = "",
    this.milestonesCount = 0,
    this.warrantiesCount = 0,
    this.totalPenalties = 0,
    this.sumOfVariationOrdersValues = 0,
    this.isitanOperationandMaintenanceContract = "",
    this.commenceDate = "",
    this.contractorPhoneNumber = "",
    this.contractorFax = "",
    this.contractorName = "",
    this.executionContractNumber = "",
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.projectEngineerName = "",
    this.creationDate = "",
    this.statusName = "",
    this.phaseID = 0,
    this.phaseName = "",
    this.endUser = "",
    this.headofDepartment = "",
    this.contractSigningDate = "",
    this.monthlyReportsCount = 0,
    this.designContractNumber = "",
    this.projectPaymentsCount = 0,
    this.activeProjectRisksCount = 0,
    this.activeProjectIssuesCount = 0,
    this.files = const [],
    this.images = const [],
    this.consultant = "",
    this.sector = "",
    this.deputyManagerEmail = "",
    this.deputyManagerPhoneNumber = "",
    this.deputyManager = "",
    this.projectEngineerFax = "",
    this.projectEngineerEmail = "",
    this.projectEngineerPhoneNumber = "",
    this.deputyManagerFax = "",
    this.headOfDepartmentEmail = "",
    this.financialSystemReferenceNumber = "",
    this.governorate = 0,
    this.components = "",
    this.buildUpArea = "",
    this.siteArea = "",
    this.locationName = "",
    this.contractAmount = 0.0,
    this.totalDuration = 0.0,
    this.consultancyServicesStartDate = "",
    this.consultancyServicesExpirationDate = "",
    this.tenderDate = "",
    this.plannedImplementationDate = "",
    this.agreementPeriod = 0,
    this.totalOptionalAmount = 0.0,
    this.theEstimatedValueOfTheProject = 0.0,
    this.projectNumberFinancial = "",
    this.expectedStartDate = "",
  });

  @override
  List<Object?> get props => [
        id,
        projectNumberFinancial,
        projectName,
        agreementNumber,
        projectEngineerName,
        creationDate,
        statusName,
        phaseName,
        endUser,
        headofDepartment,
        contractSigningDate,
        governorateName,
        monthlyReportsCount,
        designContractNumber,
        phaseID,
        projectPaymentsCount,
        activeProjectRisksCount,
        activeProjectIssuesCount,
        files,
        images,
        warrantiesCount,
        milestonesCount,
        sumOfVariationOrdersValues,
        totalPenalties,
      ];
}
