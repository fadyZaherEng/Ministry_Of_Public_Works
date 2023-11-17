import 'package:flutter/material.dart';

const String appTitle = "AIM";

const String baseUrl = "https://aim-api.transitiondemo.com/api/";
const String getProjectsEndPoint = "Projects/GetProjects";
const String getMonthlyReportsEndPoint = "MonthlyReports/GetMonthlyReports";
const String getWarrantiesEndPoint = "Warranties/GetWarranties";
const String getRisksEndPoint = "ProjectRisks/GetProjectRisks";
const String getConsultantAgreementEndPoint =
    "SupervisionServices/GetSupervisionService";
const String getProjectIssuesEndPoint = "ProjectIssues/GetProjectIssues";
const String getProjectMilestonesEndPoint =
    "ProjectMilestones/GetProjectMilestones";
const String getVariationsEndPoint = "VariationOrders/GetVariationOrders";
const String getPenaltiesEndPoint = "Penalties/GetPenalties";
const String getPaymentsEndPoint = "ProjectPayments/GetProjectPayments";
const String getProjectPhaseEndPoint = "General/GetProjectPhase";
const String getProjectTypesEndPoint = "General/GetProjectsTypes";
const String getEndUsersEndPoint = "General/GetEndUsers";
const String getMonthsEndPoint = "General/GetMonths";
const String getYearsEndPoint = "General/GetYears";
const String getProject = "Projects/GetProjectsById";
const String getPenaltiesTypes = "General/GetAllPenaltiesTypes";
const String getWarrantiesTypes = "General/GetWarrantiesTypes";
const String getImpactOnCostStatusEndPoint = "General/GetImpactOnCostStatus";
const String getProjectPaymentStatus = "General/GetProjectPaymentStatus";
const String getProjectCenterStatus = "General/GetProjectCenterStatus";
const String getReportPDFEndPoint = "MonthlyReports/GetMonthlyReportsByPdfFile";
const String getReportByIdEndPoint = "MonthlyReports/GetMonthlyReportsById";
const String getProjectPhaseByIdEndPoint = "Projects/GetProjectPhaseById";
const String getProjectPhasesByIdEndPoint = "Projects/GetProjectPhasesById";
const String getHomeCount = "Home/GetCounts";
const String getHomeUserName = "Account/GetUserName";
const String getRiskByIdEndPoint = "ProjectRisks/GetProjectRisksById";
const String getIssuesByIdEndPoint = "ProjectIssues/GetProjectIssuesById";
const String getMilestoneByIdEndPoint =
    "ProjectMilestones/GetProjectMilestonesById";
const String getWarrantyByIdEndPoint = "Warranties/GetWarrantyById";
const String getPaymentByIdEndPoint = "ProjectPayments/GetProjectPaymentsById";
const String getPenaltyByIdEndPoint = "Penalties/GetPenaltiesById";
const String getVariationByIdEndPoint =
    "VariationOrders/GetVariationOrdersById";
const String getRisksListEndPoint = "Dashboards/RiskList";
const String getRiskAnalysisChartBySectorEndPoint =
    "Dashboards/RiskAnalysisChartBySector";
const String getRiskAnalysisChartByPhaseEndPoint =
    "Dashboards/RiskAnalysisChartByPhase";
const String getRiskCountsEndPoint = "Dashboards/RisksGetCounts";
const String getUserPermissionEndPoint = "General/GetUserPermission";
const String getPrintUrlEndPoint = "Account/GetPrintUrl";

const String englishFontFamily = "Inter";
const String arabicFontFamily = "Droid";

const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;

const String arabicCode = "ar";
const String englishCode = "en";

const tenantId = "ce69d0a5-3ace-44e9-a829-a7347d06953a";
const clientId = "62b80f32-4cfd-462a-8501-577593d576b3";
const clientSecret = "Mp18Q~axPjFSQMbC0ID~B8hWOafOg1Ot77G2Wbzp";
const scope = "api://62b80f32-4cfd-462a-8501-577593d576b3/AIMScope";
const redirectUri =
    "msauth://com.sprint.aim/2jmj7l5rSw0yVb%2FvlWAYkK%2FYBwk%3D";
String token = "";

const String dateFormat = "MM/dd/yyyy";
const String formatLocal = "en";

const int pageSize = 20;
const String sanitaryProjectTypeId = "7465faf0-20f3-4119-bc43-a2b74cef6ed6";