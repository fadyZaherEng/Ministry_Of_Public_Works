// ignore_for_file: deprecated_member_use

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/routes/app_routes.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/presentation/bloc/more/more_bloc.dart';
import 'package:aim/src/presentation/screens/more/widgets/more_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  MoreBloc get _bloc => BlocProvider.of<MoreBloc>(context);

  String _permission = "";

  @override
  void initState() {
    super.initState();
    _bloc.add(const GetUserPermissionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoreBloc, MoreState>(
      listener: (context, state) {
        if (state is GetUserPermissionState) {
          _permission = state.permission;
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorSchema.screenBackground,
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Expanded(child: SizedBox()),
                        Text(
                          S.of(context).more,
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    letterSpacing: -0.36,
                                  ),
                        ),
                        const Expanded(child: SizedBox()),
                        InkWell(
                          onTap: () {
                            _navigateToSettingsScreen();
                          },
                          child: SvgPicture.asset(ImagePaths.settings),
                        )
                      ],
                    ),
                    const SizedBox(height: 41),
                    if (!_validateUserPermission())
                      MoreItemWidget(
                        iconPath: ImagePaths.riskMore,
                        title: S.of(context).risks,
                        onTap: () {
                          _navigateToRisksScreen();
                        },
                      ),
                    if (!_validateUserPermission()) const SizedBox(height: 32),
                    if (!_validateUserPermission())
                      MoreItemWidget(
                        iconPath: ImagePaths.issuesMore,
                        title: S.of(context).issues,
                        onTap: () {
                          _navigateToIssueScreen();
                        },
                      ),
                    if (!_validateUserPermission()) const SizedBox(height: 32),
                    if (!_validateUserPermission())
                      MoreItemWidget(
                        iconPath: ImagePaths.milestoneMore,
                        title: S.of(context).milestone,
                        onTap: () {
                          _navigateToMilestonesScreen();
                        },
                      ),
                    if (!_validateUserPermission()) const SizedBox(height: 32),
                    MoreItemWidget(
                      iconPath: ImagePaths.warrantiesMore,
                      title: S.of(context).warranties,
                      onTap: () {
                        _navigateToWarrantiesScreen();
                      },
                    ),
                    const SizedBox(height: 32),
                    if (!_validateUserPermission())
                      MoreItemWidget(
                        iconPath: ImagePaths.paymentMore,
                        title: S.of(context).payments,
                        onTap: () {
                          _navigateToPaymentsScreen();
                        },
                      ),
                    if (!_validateUserPermission()) const SizedBox(height: 32),
                    MoreItemWidget(
                      iconPath: ImagePaths.variationMore,
                      title: S.of(context).variationOrdersTitle,
                      onTap: () {
                        _navigateToVariationScreen();
                      },
                    ),
                    const SizedBox(height: 32),
                    MoreItemWidget(
                      iconPath: ImagePaths.penaltiesMore,
                      title: S.of(context).penalties,
                      onTap: () {
                        _navigateToPenaltiesScreen();
                      },
                    ),
                    const SizedBox(height: 32),
                    if (!_validateUserPermission())
                      MoreItemWidget(
                        iconPath: ImagePaths.agreementMore,
                        title: S.of(context).consultantAgreement,
                        onTap: () {
                          _navigateToAgreementScreen();
                        },
                      ),
                    if (!_validateUserPermission()) const SizedBox(height: 32),
                    MoreItemWidget(
                      iconPath: ImagePaths.dashboards,
                      title: S.of(context).dashboards,
                      onTap: () {
                        _navigateToDashboardsScreen();
                      },
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _navigateToSettingsScreen() {
    Navigator.pushNamed(context, AppRoutes.setting);
  }

  void _navigateToRisksScreen() {
    Navigator.pushNamed(context, AppRoutes.risks);
  }

  void _navigateToIssueScreen() {
    Navigator.pushNamed(context, AppRoutes.issues);
  }

  void _navigateToMilestonesScreen() {
    Navigator.pushNamed(context, AppRoutes.milestones);
  }

  void _navigateToWarrantiesScreen() {
    Navigator.pushNamed(context, AppRoutes.warranties);
  }

  void _navigateToPaymentsScreen() {
    Navigator.pushNamed(context, AppRoutes.payments);
  }

  void _navigateToVariationScreen() {
    Navigator.pushNamed(context, AppRoutes.variation);
  }

  void _navigateToPenaltiesScreen() {
    Navigator.pushNamed(context, AppRoutes.penalties);
  }

  void _navigateToAgreementScreen() {
    Navigator.pushNamed(context, AppRoutes.agreement);
  }

  void _navigateToDashboardsScreen() {
    Navigator.pushNamed(context, AppRoutes.dashboards);
  }

  bool _validateUserPermission() {
    return _permission == "Financial Department" ||
        _permission == "Financial Auditors";
  }
}
