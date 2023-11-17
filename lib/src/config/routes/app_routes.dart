import 'package:aim/src/presentation/screens/agreement/agreement_screen.dart';
import 'package:aim/src/presentation/screens/agreement/foms/agreement_form_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/analysis/analysis_dashboard_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/contract/contract_dashboard_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/design/design_dashboard_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/dashboards_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/issues/issues_dashboard_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/overview/overview_dashboard_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/package/package_dashboard_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/payments/payments_dashboard_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/penalties/penalties_dashboard_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/risks/risks_dashboard_screen.dart';
import 'package:aim/src/presentation/screens/dashboard/variations/variations_dashboard_screen.dart';
import 'package:aim/src/presentation/screens/issues/issues_screen.dart';
import 'package:aim/src/presentation/screens/login/login_screen.dart';
import 'package:aim/src/presentation/screens/main/main_screen.dart';
import 'package:aim/src/presentation/screens/milestones/milestones_screen.dart';
import 'package:aim/src/presentation/screens/payments/payments_screen.dart';
import 'package:aim/src/presentation/screens/penalties/penalties_screen.dart';
import 'package:aim/src/presentation/screens/projects/details/forms/project_form_screen.dart';
import 'package:aim/src/presentation/screens/projects/details/project_details_screen.dart';
import 'package:aim/src/presentation/screens/reports/forms/report_form_screen.dart';
import 'package:aim/src/presentation/screens/risks/risks_screen.dart';
import 'package:aim/src/presentation/screens/settings/settings_screen.dart';
import 'package:aim/src/presentation/screens/splash/splash_screen.dart';
import 'package:aim/src/presentation/screens/variation/variation_screen.dart';
import 'package:aim/src/presentation/screens/warranties/warranties_screen.dart';
import 'package:aim/src/presentation/screens/web_view/web_view_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = "/";
  static const String main = "/main";
  static const String projectDetails = "/projectDetails";
  static const String setting = "/settings";
  static const String login = "/login";
  static const String risks = "/risks";
  static const String issues = "/issues";
  static const String milestones = "/milestones";
  static const String warranties = "/warranties";
  static const String payments = "/payments";
  static const String variation = "/variations";
  static const String penalties = "/penalties";
  static const String agreement = "/agreements";
  static const String projectDetailsForm = "/projectDetailsForm";
  static const String reportsForm = "/reportsForm";
  static const String packages = "/packages";
  static const String dashboards = "/dashboards";
  static const String risksDashboard = "/risksDashboard";
  static const String issuesDashboard = "/issuesDashboard";
  static const String paymentsDashboard = "/paymentsDashboard";
  static const String variationDashboard = "/variationDashboard";
  static const String penaltiesDashboard = "/penaltiesDashboard";
  static const String agreementDashboard = "/agreementDashboard";
  static const String packagesDashboard = "/packagesDashboard";
  static const String contractsDashboard = "/contractsDashboard";
  static const String analysisDashboard = "/analysisDashboard";
  static const String overviewDashboard = "/overviewDashboard";
  static const String agreementForm = "/agreementForm";
  static const String webView = "/webView";

  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _materialRoute(const SplashScreen());
      case login:
        return _materialRoute(const LoginScreen());
      case main:
        return _materialRoute(MainScreen(
          permission: (settings.arguments as String),
        ));
      case projectDetails:
        return _materialRoute(ProjectDetailsScreen(
          projectId: (settings.arguments as String),
        ));
      case setting:
        return _materialRoute(const SettingsScreen());
      case risks:
        return _materialRoute(const RisksScreen());
      case issues:
        return _materialRoute(const IssuesScreen());
      case milestones:
        return _materialRoute(const MilestonesScreen());
      case warranties:
        return _materialRoute(const WarrantiesScreen());
      case payments:
        return _materialRoute(const PaymentsScreen());
      case variation:
        return _materialRoute(const VariationScreen());
      case penalties:
        return _materialRoute(const PenaltiesScreen());
      case agreement:
        return _materialRoute(const AgreementScreen());
      case projectDetailsForm:
        Map<String, dynamic> arg = settings.arguments as Map<String, dynamic>;
        return _materialRoute(ProjectFormScreen(
          id: (arg['id'] as String),
          phaseId: (arg['phaseId'] as String),
        ));
      case reportsForm:
        return _materialRoute(ReportFormScreen(
          id: settings.arguments as String,
        ));
      case packages:
        return _materialRoute(const PackageDashboardScreen());
      case analysisDashboard:
        return _materialRoute(AnalysisDashboardScreen(
          id: settings.arguments as String,
        ));
      case dashboards:
        return _materialRoute(const DashboardsScreen());
      case risksDashboard:
        return _materialRoute(const RisksDashboardScreen());
      case issuesDashboard:
        return _materialRoute(const IssuesDashboardScreen());
      case paymentsDashboard:
        return _materialRoute(const PaymentsDashboardScreen());
      case variationDashboard:
        return _materialRoute(const VariationsDashboardScreen());
      case penaltiesDashboard:
        return _materialRoute(const PenaltiesDashboardScreen());
      case agreementDashboard:
        return _materialRoute(const DesignDashboardScreen());
      case packagesDashboard:
        return _materialRoute(const PackageDashboardScreen());
      case contractsDashboard:
        return _materialRoute(const ContractDashboardScreen());
      case overviewDashboard:
        return _materialRoute(const OverviewDashboardScreen());
      case agreementForm:
        return _materialRoute(AgreementFormScreen(
          id: settings.arguments as String,
        ));
      case webView:
        Map<String, dynamic> arg = settings.arguments as Map<String, dynamic>;

        return _materialRoute(
          WebViewScreen(
            url: arg['url'] as String,
            reportId: arg['reportId'] as String,
          ),
        );
      default:
        //TODO(1) Replace With default Screen
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
