import 'dart:io';

import 'package:aim/generated/l10n.dart';
import 'package:aim/injector.dart';
import 'package:aim/src/config/routes/app_routes.dart';
import 'package:aim/src/config/themes/app_theme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/my_http_overrides.dart';
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
import 'package:aim/src/presentation/widgets/restart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    const RestartWidget(
      MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (context) => injector()),
        BlocProvider<ProjectsBloc>(create: (context) => injector()),
        BlocProvider<SettingsBloc>(create: (context) => injector()),
        BlocProvider<AgreementBloc>(create: (context) => injector()),
        BlocProvider<IssuesBloc>(create: (context) => injector()),
        BlocProvider<MilestonesBloc>(create: (context) => injector()),
        BlocProvider<ReportsBloc>(create: (context) => injector()),
        BlocProvider<RisksBloc>(create: (context) => injector()),
        BlocProvider<VariationBloc>(create: (context) => injector()),
        BlocProvider<WarrantiesBloc>(create: (context) => injector()),
        BlocProvider<PaymentsBloc>(create: (context) => injector()),
        BlocProvider<PenaltiesBloc>(create: (context) => injector()),
        BlocProvider<ProjectDetailsBloc>(create: (context) => injector()),
        BlocProvider<ReportsFormsBloc>(create: (context) => injector()),
        BlocProvider<HomeBloc>(create: (context) => injector()),
        BlocProvider<ProjectsFormsBloc>(create: (context) => injector()),
        BlocProvider<RisksDashboardBloc>(create: (context) => injector()),
        BlocProvider<IssuesDashboardBloc>(create: (context) => injector()),
        BlocProvider<PaymentsDashboardBloc>(create: (context) => injector()),
        BlocProvider<PenaltiesDashboardBloc>(create: (context) => injector()),
        BlocProvider<VariationsDashboardBloc>(create: (context) => injector()),
        BlocProvider<OverviewDashboardBloc>(create: (context) => injector()),
        BlocProvider<PackageDashboardBloc>(create: (context) => injector()),
        BlocProvider<DesignDashboardBloc>(create: (context) => injector()),
        BlocProvider<ContractDashboardBloc>(create: (context) => injector()),
        BlocProvider<AgreementFormBloc>(create: (context) => injector()),
        BlocProvider<AnalysisDashboardBloc>(create: (context) => injector()),
        BlocProvider<MoreBloc>(create: (context) => injector()),
        BlocProvider<DashboardBloc>(create: (context) => injector()),
      ],
      child: BlocBuilder<SplashCubit, Locale>(
        buildWhen: (previousState, currentState) {
          return previousState != currentState;
        },
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            title: appTitle,
            theme: AppTheme(state.languageCode).light,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRoutes.onGenerateRoutes,
            supportedLocales: S.delegate.supportedLocales,
            locale: state,
          );
        },
      ),
    );
  }
}
