import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/core/interceptor.dart';
import 'package:aim/src/data/repositories/agreements_repository_implementation.dart';
import 'package:aim/src/data/repositories/analysis_repository_implementation.dart';
import 'package:aim/src/data/repositories/contract_repository_implementation.dart';
import 'package:aim/src/data/repositories/design_repository_implementation.dart';
import 'package:aim/src/data/repositories/filter_repository_implementation.dart';
import 'package:aim/src/data/repositories/home_repository_implementation.dart';
import 'package:aim/src/data/repositories/issues_repository_implementation.dart';
import 'package:aim/src/data/repositories/language_repository_implementation.dart';
import 'package:aim/src/data/repositories/milestones_repository_implementation.dart';
import 'package:aim/src/data/repositories/overview_repository_implementation.dart';
import 'package:aim/src/data/repositories/package_repository_implementation.dart';
import 'package:aim/src/data/repositories/payments_repository_implementation.dart';
import 'package:aim/src/data/repositories/penalties_repository_implementation.dart';
import 'package:aim/src/data/repositories/proejct_repository_implementaion.dart';
import 'package:aim/src/data/repositories/reports_repository_implementation.dart';
import 'package:aim/src/data/repositories/risks_repository_implementation.dart';
import 'package:aim/src/data/repositories/variations_repository_implementation.dart';
import 'package:aim/src/data/repositories/warranties_repository_implementation.dart';
import 'package:aim/src/data/sources/local/language_shared_preference.dart';
import 'package:aim/src/data/sources/local/language_shared_preference_implementation.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/agreements_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/analysis_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/contract/contract_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/design/design_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/filter/filter_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/home/home_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/issues/issues_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/milestones/milestones_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/overview/overview_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/package/package_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/payments/payments_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/penalties_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/project/project_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/reports/reports_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/risks/risks_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/variation/variations_api_service.dart';
import 'package:aim/src/data/sources/remote/aim/warranties/warranties_api_service.dart';
import 'package:aim/src/domain/repositories/agreements_repository.dart';
import 'package:aim/src/domain/repositories/analysis_repository.dart';
import 'package:aim/src/domain/repositories/contract_repository.dart';
import 'package:aim/src/domain/repositories/design_repository.dart';
import 'package:aim/src/domain/repositories/filter_repository.dart';
import 'package:aim/src/domain/repositories/home_repository.dart';
import 'package:aim/src/domain/repositories/issues_repository.dart';
import 'package:aim/src/domain/repositories/language_repository.dart';
import 'package:aim/src/domain/repositories/milestones_repository.dart';
import 'package:aim/src/domain/repositories/overview_repository.dart';
import 'package:aim/src/domain/repositories/package_repository.dart';
import 'package:aim/src/domain/repositories/payments_repository.dart';
import 'package:aim/src/domain/repositories/penalties_repository.dart';
import 'package:aim/src/domain/repositories/project_repository.dart';
import 'package:aim/src/domain/repositories/reports_repository.dart';
import 'package:aim/src/domain/repositories/risks_repository.dart';
import 'package:aim/src/domain/repositories/variations_repository.dart';
import 'package:aim/src/domain/repositories/warranties_repository.dart';
import 'package:aim/src/domain/usecases/change_orientation_use_case.dart';
import 'package:aim/src/domain/usecases/get_agreement_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_agreements_use_case.dart';
import 'package:aim/src/domain/usecases/get_analysis_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_approved_analysis_use_case.dart';
import 'package:aim/src/domain/usecases/get_contract_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_delay_analysis_use_case.dart';
import 'package:aim/src/domain/usecases/get_design_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_design_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_design_ministry_use_case.dart';
import 'package:aim/src/domain/usecases/get_end_users_use_case.dart';
import 'package:aim/src/domain/usecases/get_extension_period_use_case.dart';
import 'package:aim/src/domain/usecases/get_home_counts_use_case.dart';
import 'package:aim/src/domain/usecases/get_home_user_use_case.dart';
import 'package:aim/src/domain/usecases/get_impact_on_cost_status_use_case.dart';
import 'package:aim/src/domain/usecases/get_issue_abalysis_chart_by_phase_use_case.dart';
import 'package:aim/src/domain/usecases/get_issue_abalysis_chart_by_sector_use_case.dart';
import 'package:aim/src/domain/usecases/get_issue_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_issue_counts_use_case.dart';
import 'package:aim/src/domain/usecases/get_issues_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_issues_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_milestone_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_milestones_use_case.dart';
import 'package:aim/src/domain/usecases/get_months_use_case.dart';
import 'package:aim/src/domain/usecases/get_operation_analysis_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_cards_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_projects_by_phase_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_projects_by_sector_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_projects_in_progress_use_case.dart';
import 'package:aim/src/domain/usecases/get_package_analysis_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_package_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_package_ministry_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_payment_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_payment_status_use_case.dart';
import 'package:aim/src/domain/usecases/get_payments_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_payments_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_payments_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalties_chart_design_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalties_chart_execution_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalties_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalties_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalty_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalty_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_permission_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_print_url_case.dart';
import 'package:aim/src/domain/usecases/get_project_details_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_details_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_phase_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_status_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_projects_use_case.dart';
import 'package:aim/src/domain/usecases/get_report_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_report_pdf_use_case.dart';
import 'package:aim/src/domain/usecases/get_reports_use_case.dart';
import 'package:aim/src/domain/usecases/get_risk_abalysis_chart_by_phase_use_case.dart';
import 'package:aim/src/domain/usecases/get_risk_abalysis_chart_by_sector_use_case.dart';
import 'package:aim/src/domain/usecases/get_risk_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_risk_counts_use_case.dart';
import 'package:aim/src/domain/usecases/get_risks_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_risks_use_case.dart';
import 'package:aim/src/domain/usecases/get_user_permission_use_case.dart';
import 'package:aim/src/domain/usecases/get_variation_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_variations_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_variations_circle_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_variations_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_variations_use_case.dart';
import 'package:aim/src/domain/usecases/get_warranties_use_case.dart';
import 'package:aim/src/domain/usecases/get_warranty_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_warranty_type_use_case.dart';
import 'package:aim/src/domain/usecases/get_years_use_case.dart';
import 'package:aim/src/domain/usecases/set_language_use_case.dart';
import 'package:aim/src/domain/usecases/set_permission_use_case.dart';
import 'package:aim/src/presentation/bloc/agreement/agreement_bloc.dart';
import 'package:aim/src/presentation/bloc/agreement/forms/agreement_form_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/analysis/analysis_dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/contract/contract_dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/dashboard/dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/design/design_dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/issues/issues_dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/overview/overview_dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/package/package_dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/payments/payments_dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/penalties/penalties_dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/risks/risks_dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/dashboards/variations/variations_dashboard_bloc.dart';
import 'package:aim/src/presentation/bloc/details/project_details_bloc.dart';
import 'package:aim/src/presentation/bloc/home/home_bloc.dart';
import 'package:aim/src/presentation/bloc/issues/issues_bloc.dart';
import 'package:aim/src/presentation/bloc/milestones/milestones_bloc.dart';
import 'package:aim/src/presentation/bloc/more/more_bloc.dart';
import 'package:aim/src/presentation/bloc/payments/payments_bloc.dart';
import 'package:aim/src/presentation/bloc/penalties/penalties_bloc.dart';
import 'package:aim/src/presentation/bloc/projects/forms/projects_forms_bloc.dart';
import 'package:aim/src/presentation/bloc/projects/projects_bloc.dart';
import 'package:aim/src/presentation/bloc/reports/forms/reports_forms_bloc.dart';
import 'package:aim/src/presentation/bloc/reports/reports_bloc.dart';
import 'package:aim/src/presentation/bloc/risks/risks_bloc.dart';
import 'package:aim/src/presentation/bloc/settings/settings_bloc.dart';
import 'package:aim/src/presentation/bloc/splash/splash_cubit.dart';
import 'package:aim/src/presentation/bloc/variation/variation_bloc.dart';
import 'package:aim/src/presentation/bloc/warranties/warranties_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerLazySingleton(() => Dio()
    ..options.baseUrl = baseUrl
    ..options.headers["Authorization"] = token
    ..options.headers['Content-Type'] = 'application/json'
    ..options.headers['Accept'] = '*/*'
    ..interceptors.add(CustomInterceptors()));

  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => sharedPreferences);

  //Local
  injector.registerFactory<LanguageSharedPreference>(
      () => LanguageSharedPreferenceImplementation(injector()));

  //Remote
  injector
      .registerFactory<ProjectApiService>(() => ProjectApiService(injector()));
  injector
      .registerFactory<ReportsApiService>(() => ReportsApiService(injector()));
  injector.registerFactory<WarrantiesApiService>(
      () => WarrantiesApiService(injector()));
  injector.registerFactory<AgreementsApiService>(
      () => AgreementsApiService(injector()));
  injector
      .registerFactory<IssuesApiService>(() => IssuesApiService(injector()));
  injector.registerFactory<RisksApiService>(() => RisksApiService(injector()));
  injector.registerFactory<MilestonesApiService>(
      () => MilestonesApiService(injector()));
  injector.registerFactory<VariationsApiService>(
      () => VariationsApiService(injector()));
  injector.registerFactory<PaymentsApiService>(
      () => PaymentsApiService(injector()));
  injector.registerFactory<PenaltiesApiService>(
      () => PenaltiesApiService(injector()));
  injector
      .registerFactory<FilterApiService>(() => FilterApiService(injector()));
  injector.registerFactory<HomeApiService>(() => HomeApiService(injector()));
  injector
      .registerFactory<PackageApiService>(() => PackageApiService(injector()));
  injector.registerFactory<OverviewApiService>(
      () => OverviewApiService(injector()));
  injector
      .registerFactory<DesignApiService>(() => DesignApiService(injector()));
  injector.registerFactory<ContractApiService>(
      () => ContractApiService(injector()));
  injector.registerFactory<AnalysisApiService>(
      () => AnalysisApiService(injector()));

  //Repositories
  injector.registerFactory<LanguageRepository>(
      () => LanguageRepositoryImplementation(injector()));
  injector.registerFactory<ProjectRepository>(
      () => ProjectRepositoryImplementation(injector()));
  injector.registerFactory<ReportsRepository>(
      () => ReportsRepositoryImplementation(injector()));
  injector.registerFactory<WarrantiesRepository>(
      () => WarrantiesRepositoryImplementation(injector()));
  injector.registerFactory<AgreementsRepository>(
      () => AgreementsRepositoryImplementation(injector()));
  injector.registerFactory<IssuesRepository>(
      () => IssuesRepositoryImplementation(injector()));
  injector.registerFactory<RisksRepository>(
      () => RisksRepositoryImplementation(injector()));
  injector.registerFactory<MilestonesRepository>(
      () => MilestonesRepositoryImplementation(injector()));
  injector.registerFactory<VariationsRepository>(
      () => VariationsRepositoryImplementation(injector()));
  injector.registerFactory<PaymentsRepository>(
      () => PaymentsRepositoryImplementation(injector()));
  injector.registerFactory<PenaltiesRepository>(
      () => PenaltiesRepositoryImplementation(injector()));
  injector.registerFactory<FilterRepository>(
      () => FilterRepositoryImplementation(injector()));
  injector.registerFactory<HomeRepository>(
      () => HomeRepositoryImplementation(injector(), injector()));
  injector.registerFactory<PackageRepository>(
      () => PackageRepositoryImplementation(injector()));
  injector.registerFactory<OverviewRepository>(
      () => OverviewRepositoryImplementation(injector()));
  injector.registerFactory<DesignRepository>(
      () => DesignRepositoryImplementation(injector()));
  injector.registerFactory<ContractRepository>(
      () => ContractRepositoryImplementation(injector()));
  injector.registerFactory<AnalysisRepository>(
      () => AnalysisRepositoryImplementation(injector()));

  //UseCases
  injector.registerFactory<GetLanguageUseCase>(() => GetLanguageUseCase(
        injector(),
      ));
  injector.registerFactory<SetLanguageUseCase>(() => SetLanguageUseCase(
        injector(),
      ));
  injector.registerFactory<GetProjectsUseCase>(() => GetProjectsUseCase(
        injector(),
      ));
  injector.registerFactory<GetReportsUseCase>(() => GetReportsUseCase(
        injector(),
      ));
  injector.registerFactory<GetWarrantiesUseCase>(() => GetWarrantiesUseCase(
        injector(),
      ));
  injector.registerFactory<GetAgreementsUseCase>(() => GetAgreementsUseCase(
        injector(),
      ));
  injector.registerFactory<GetIssuesUseCase>(() => GetIssuesUseCase(
        injector(),
      ));
  injector.registerFactory<GetRisksUseCase>(() => GetRisksUseCase(
        injector(),
      ));
  injector.registerFactory<GetMilestonesUseCase>(() => GetMilestonesUseCase(
        injector(),
      ));
  injector.registerFactory<GetVariationsUseCase>(() => GetVariationsUseCase(
        injector(),
      ));
  injector.registerFactory<GetPaymentsUseCase>(() => GetPaymentsUseCase(
        injector(),
      ));
  injector.registerFactory<GetPenaltiesUseCase>(() => GetPenaltiesUseCase(
        injector(),
      ));
  injector.registerFactory<GetPhasesUseCase>(() => GetPhasesUseCase(
        injector(),
      ));
  injector.registerFactory<GetProjectTypesUseCase>(() => GetProjectTypesUseCase(
        injector(),
      ));
  injector.registerFactory<GetMonthsUseCase>(() => GetMonthsUseCase(
        injector(),
      ));
  injector.registerFactory<GetYearsUseCase>(() => GetYearsUseCase(
        injector(),
      ));

  injector
      .registerFactory<GetProjectDetailsUseCase>(() => GetProjectDetailsUseCase(
            injector(),
          ));
  injector.registerFactory<GetWarrantyTypeUseCase>(() => GetWarrantyTypeUseCase(
        injector(),
      ));
  injector
      .registerFactory<GetProjectStatusUseCase>(() => GetProjectStatusUseCase(
            injector(),
          ));
  injector.registerFactory<GetPenaltyTypesUseCase>(() => GetPenaltyTypesUseCase(
        injector(),
      ));
  injector
      .registerFactory<GetPaymentStatusUseCase>(() => GetPaymentStatusUseCase(
            injector(),
          ));
  injector.registerFactory<GetImpactOnCostStatusUseCase>(
      () => GetImpactOnCostStatusUseCase(
            injector(),
          ));
  injector.registerFactory<GetReportPDFUseCase>(() => GetReportPDFUseCase(
        injector(),
      ));
  injector.registerFactory<GetReportByIdUseCase>(() => GetReportByIdUseCase(
        injector(),
      ));
  injector
      .registerFactory<GetProjectPhasesUseCase>(() => GetProjectPhasesUseCase(
            injector(),
          ));
  injector.registerFactory<GetProjectPhaseByIdUseCase>(
      () => GetProjectPhaseByIdUseCase(
            injector(),
          ));
  injector.registerFactory<GetHomeCountsUseCase>(() => GetHomeCountsUseCase(
        injector(),
      ));
  injector.registerFactory<GetRiskByIdUseCase>(() => GetRiskByIdUseCase(
        injector(),
      ));
  injector.registerFactory<GetIssueByIdUseCase>(() => GetIssueByIdUseCase(
        injector(),
      ));
  injector
      .registerFactory<GetMilestoneByIdUseCase>(() => GetMilestoneByIdUseCase(
            injector(),
          ));
  injector.registerFactory<GetWarrantyByIdUseCase>(() => GetWarrantyByIdUseCase(
        injector(),
      ));
  injector.registerFactory<GetPaymentByIdUseCase>(() => GetPaymentByIdUseCase(
        injector(),
      ));
  injector.registerFactory<GetPenaltyByIdUseCase>(() => GetPenaltyByIdUseCase(
        injector(),
      ));
  injector
      .registerFactory<GetVariationByIdUseCase>(() => GetVariationByIdUseCase(
            injector(),
          ));
  injector
      .registerFactory<GetAgreementByIdUseCase>(() => GetAgreementByIdUseCase(
            injector(),
          ));

  injector.registerFactory<GetHomeUserUseCase>(() => GetHomeUserUseCase(
        injector(),
      ));
  injector.registerFactory<GetRisksListUseCase>(() => GetRisksListUseCase(
        injector(),
      ));
  injector.registerFactory<GetRiskAnalysisChartBySectorUseCase>(
      () => GetRiskAnalysisChartBySectorUseCase(
            injector(),
          ));
  injector.registerFactory<GetRiskAnalysisChartByPhaseUseCase>(
      () => GetRiskAnalysisChartByPhaseUseCase(
            injector(),
          ));
  injector.registerFactory<GetRiskCountsUseCase>(() => GetRiskCountsUseCase(
        injector(),
      ));

  injector.registerFactory<GetIssuesListUseCase>(() => GetIssuesListUseCase(
        injector(),
      ));
  injector.registerFactory<GetIssueAnalysisChartBySectorUseCase>(
      () => GetIssueAnalysisChartBySectorUseCase(
            injector(),
          ));
  injector.registerFactory<GetIssueAnalysisChartByPhaseUseCase>(
      () => GetIssueAnalysisChartByPhaseUseCase(
            injector(),
          ));
  injector.registerFactory<GetIssueCountsUseCase>(() => GetIssueCountsUseCase(
        injector(),
      ));
  injector.registerFactory<GetPaymentsListUseCase>(() => GetPaymentsListUseCase(
        injector(),
      ));
  injector
      .registerFactory<GetPaymentsChartUseCase>(() => GetPaymentsChartUseCase(
            injector(),
          ));
  injector
      .registerFactory<GetPenaltiesListUseCase>(() => GetPenaltiesListUseCase(
            injector(),
          ));
  injector.registerFactory<GetPenaltiesChartDesignUseCase>(
      () => GetPenaltiesChartDesignUseCase(
            injector(),
          ));
  injector.registerFactory<GetPenaltiesChartExecutionUseCase>(
      () => GetPenaltiesChartExecutionUseCase(
            injector(),
          ));
  injector
      .registerFactory<GetVariationsListUseCase>(() => GetVariationsListUseCase(
            injector(),
          ));
  injector.registerFactory<GetVariationsChartUseCase>(
      () => GetVariationsChartUseCase(
            injector(),
          ));
  injector.registerFactory<GetVariationsCircleChartUseCase>(
      () => GetVariationsCircleChartUseCase(
            injector(),
          ));
  injector
      .registerFactory<GetOverviewCardsUseCase>(() => GetOverviewCardsUseCase(
            injector(),
          ));
  injector.registerFactory<GetOverviewProjectsBySectorUseCase>(
      () => GetOverviewProjectsBySectorUseCase(
            injector(),
          ));
  injector.registerFactory<GetOverviewProjectsByPhaseUseCase>(
      () => GetOverviewProjectsByPhaseUseCase(
            injector(),
          ));
  injector.registerFactory<GetOverviewProjectsInProgressUseCase>(
      () => GetOverviewProjectsInProgressUseCase(
            injector(),
          ));
  injector.registerFactory<GetOverviewListUseCase>(() => GetOverviewListUseCase(
        injector(),
      ));

  injector.registerFactory<GetPackageListUseCase>(() => GetPackageListUseCase(
        injector(),
      ));
  injector.registerFactory<GetPackageMinistryChartUseCase>(
      () => GetPackageMinistryChartUseCase(
            injector(),
          ));
  injector.registerFactory<GetPackageAnalysisChartUseCase>(
      () => GetPackageAnalysisChartUseCase(
            injector(),
          ));

  injector.registerFactory<GetDesignListUseCase>(() => GetDesignListUseCase(
        injector(),
      ));

  injector
      .registerFactory<GetDesignMinistryUseCase>(() => GetDesignMinistryUseCase(
            injector(),
          ));

  injector.registerFactory<GetDesignChartUseCase>(() => GetDesignChartUseCase(
        injector(),
      ));

  injector.registerFactory<GetContractListUseCase>(() => GetContractListUseCase(
        injector(),
      ));
  injector.registerFactory<GetApprovedAnalysisUseCase>(
      () => GetApprovedAnalysisUseCase(
            injector(),
          ));

  injector.registerFactory<GetExtensionPeriodUseCase>(
      () => GetExtensionPeriodUseCase(
            injector(),
          ));

  injector.registerFactory<GetAnalysisListUseCase>(() => GetAnalysisListUseCase(
        injector(),
      ));

  injector
      .registerFactory<GetDelayAnalysisUseCase>(() => GetDelayAnalysisUseCase(
            injector(),
          ));
  injector.registerFactory<GetOperationAnalysisUseCase>(
      () => GetOperationAnalysisUseCase(
            injector(),
          ));
  injector.registerFactory<GetProjectDetailsPhasesUseCase>(
      () => GetProjectDetailsPhasesUseCase(
            injector(),
          ));

  injector.registerFactory<GetEndUsersUseCase>(() => GetEndUsersUseCase(
        injector(),
      ));
  injector
      .registerFactory<GetUserPermissionUseCase>(() => GetUserPermissionUseCase(
            injector(),
          ));
  injector.registerFactory<SetPermissionUseCase>(() => SetPermissionUseCase(
        injector(),
      ));

  injector.registerFactory<GetLocalPermissionUserCase>(
      () => GetLocalPermissionUserCase(
            injector(),
          ));

  injector.registerFactory<GetPrintUrlUseCase>(() => GetPrintUrlUseCase(
        injector(),
      ));
  injector.registerFactory<ChangeOrientationUseCase>(
      () => ChangeOrientationUseCase());

  //Bloc
  injector.registerFactory<SplashCubit>(() => SplashCubit(
        injector(),
      ));

  injector.registerFactory<ProjectsBloc>(() => ProjectsBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<AgreementBloc>(() => AgreementBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<IssuesBloc>(() => IssuesBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<MilestonesBloc>(() => MilestonesBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<ReportsBloc>(() => ReportsBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<RisksBloc>(() => RisksBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<VariationBloc>(() => VariationBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<WarrantiesBloc>(() => WarrantiesBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<ProjectDetailsBloc>(() => ProjectDetailsBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<PaymentsBloc>(() => PaymentsBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<PenaltiesBloc>(() => PenaltiesBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<SettingsBloc>(() => SettingsBloc(
        injector(),
        injector(),
      ));
  injector.registerFactory<ReportsFormsBloc>(() => ReportsFormsBloc(
        injector(),
        injector(),
      ));
  injector.registerFactory<HomeBloc>(() => HomeBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<ProjectsFormsBloc>(() => ProjectsFormsBloc(
        injector(),
        injector(),
      ));
  injector.registerFactory<RisksDashboardBloc>(() => RisksDashboardBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<IssuesDashboardBloc>(() => IssuesDashboardBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<PaymentsDashboardBloc>(() => PaymentsDashboardBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<PenaltiesDashboardBloc>(() => PenaltiesDashboardBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector
      .registerFactory<VariationsDashboardBloc>(() => VariationsDashboardBloc(
            injector(),
            injector(),
            injector(),
            injector(),
            injector(),
            injector(),
          ));

  injector.registerFactory<OverviewDashboardBloc>(() => OverviewDashboardBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<PackageDashboardBloc>(() => PackageDashboardBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<DesignDashboardBloc>(() => DesignDashboardBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<ContractDashboardBloc>(() => ContractDashboardBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<AgreementFormBloc>(() => AgreementFormBloc(
        injector(),
        injector(),
      ));

  injector.registerFactory<AnalysisDashboardBloc>(() => AnalysisDashboardBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));

  injector.registerFactory<MoreBloc>(() => MoreBloc(
        injector(),
      ));

  injector.registerFactory<DashboardBloc>(() => DashboardBloc(
        injector(),
      ));
}
