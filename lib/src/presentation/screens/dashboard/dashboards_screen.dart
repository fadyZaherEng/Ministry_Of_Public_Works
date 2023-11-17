// ignore_for_file: deprecated_member_use

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/routes/app_routes.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/presentation/bloc/dashboards/dashboard/dashboard_bloc.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardsScreen extends StatefulWidget {
  const DashboardsScreen({Key? key}) : super(key: key);

  @override
  State<DashboardsScreen> createState() => _DashboardsScreenState();
}

class _DashboardsScreenState extends State<DashboardsScreen> {
  DashboardBloc get _bloc => BlocProvider.of<DashboardBloc>(context);

  String _permission = "";

  @override
  void initState() {
    super.initState();
    _bloc.add(const GetUserPermissionEvent());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is GetUserPermissionState) {
          _permission = state.permission;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    AppBarWidget(
                      title: S.of(context).dashboards,
                      isHaveBackButton: true,
                      isHaveForms: false,
                      onFormsTab: () {},
                      imagePath: ImagePaths.arrowBack,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _buildDashboardContent()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Column _buildDashboardContent() {
    if (_permission.isEmpty) {
      return const Column();
    }
    if (!_validateUserPermission()) {
      return Column(
        children: [
          const SizedBox(height: 24),
          Row(
            children: [
              _buildDashboardItem(
                context: context,
                title: S.of(context).risks,
                imagePath: ImagePaths.risks,
                onTap: () {
                  _navigateToRisksDashboardScreen(context);
                },
              ),
              const SizedBox(width: 16),
              _buildDashboardItem(
                context: context,
                title: S.of(context).issues,
                imagePath: ImagePaths.issues,
                onTap: () {
                  _navigateToIssuesDashboardScreen(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildDashboardItem(
                context: context,
                title: S.of(context).payments,
                imagePath: ImagePaths.payments,
                onTap: () {
                  _navigateToPaymentsDashboardScreen(context);
                },
              ),
              const SizedBox(width: 16),
              _buildDashboardItem(
                context: context,
                title: S.of(context).variationOrdersTitle,
                imagePath: ImagePaths.variationOrders,
                onTap: () {
                  _navigateToVariationDashboardScreen(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildDashboardItem(
                context: context,
                title: S.of(context).penalties,
                imagePath: ImagePaths.penaltiesDashboard,
                onTap: () {
                  _navigateToPenaltiesDashboardScreen(context);
                },
              ),
              const SizedBox(width: 16),
              _buildDashboardItem(
                context: context,
                title: S.of(context).designProcess,
                imagePath: ImagePaths.agreements,
                onTap: () {
                  _navigateToAgreementsDashboardScreen(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildDashboardItem(
                context: context,
                title: S.of(context).completionInTheExecutionContractsTitle,
                imagePath: ImagePaths.executionContract,
                onTap: () {
                  _navigateToContractDashboardScreen(context);
                },
              ),
              const SizedBox(width: 16),
              _buildDashboardItem(
                context: context,
                title: S.of(context).finalDataPackageTitle,
                imagePath: ImagePaths.finalData,
                onTap: () {
                  _navigateToPackageDashboardScreen(context);
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildDashboardItem(
                context: context,
                title: S.of(context).overview,
                imagePath: ImagePaths.planningBudgeting,
                onTap: () {
                  _navigateToOverviewDashboardScreen(context);
                },
              ),
              const Expanded(child: const SizedBox(width: 16)),
            ],
          ),
          const SizedBox(height: 16),
        ],
      );
    }

    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            _buildDashboardItem(
              context: context,
              title: S.of(context).payments,
              imagePath: ImagePaths.payments,
              onTap: () {
                _navigateToPaymentsDashboardScreen(context);
              },
            ),
            const SizedBox(width: 16),
            _buildDashboardItem(
              context: context,
              title: S.of(context).variationOrdersTitle,
              imagePath: ImagePaths.variationOrders,
              onTap: () {
                _navigateToVariationDashboardScreen(context);
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildDashboardItem(
              context: context,
              title: S.of(context).penalties,
              imagePath: ImagePaths.penaltiesDashboard,
              onTap: () {
                _navigateToPenaltiesDashboardScreen(context);
              },
            ),
            const SizedBox(width: 16),
            _buildDashboardItem(
              context: context,
              title: S.of(context).overview,
              imagePath: ImagePaths.planningBudgeting,
              onTap: () {
                _navigateToOverviewDashboardScreen(context);
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDashboardItem({
    required BuildContext context,
    required String imagePath,
    required String title,
    required Function() onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: DashboardCardWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorSchema.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 42,
                height: 42,
                child: Center(
                  child: SvgPicture.asset(
                    imagePath,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      letterSpacing: -0.26,
                    ),
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToRisksDashboardScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.risksDashboard);
  }

  void _navigateToIssuesDashboardScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.issuesDashboard);
  }

  void _navigateToPaymentsDashboardScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.paymentsDashboard);
  }

  void _navigateToVariationDashboardScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.variationDashboard);
  }

  void _navigateToPenaltiesDashboardScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.penaltiesDashboard);
  }

  void _navigateToAgreementsDashboardScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.agreementDashboard);
  }

  void _navigateToContractDashboardScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.contractsDashboard);
  }

  void _navigateToPackageDashboardScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.packagesDashboard);
  }

  void _navigateToOverviewDashboardScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.overviewDashboard);
  }

  bool _validateUserPermission() {
    return _permission == "Financial Department" ||
        _permission == "Financial Auditors";
  }
}
