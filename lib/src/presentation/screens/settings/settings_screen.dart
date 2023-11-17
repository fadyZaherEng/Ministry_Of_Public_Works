import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/routes/app_routes.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/config/utils/login.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/presentation/bloc/settings/settings_bloc.dart';
import 'package:aim/src/presentation/screens/more/widgets/more_item_widget.dart';
import 'package:aim/src/presentation/screens/settings/widgets/language_widget.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/widgets/restart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SupportLanguage languageCode = SupportLanguage.en;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SettingsBloc>(context).add(GetDefaultLanguageEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initSorts(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchema.screenBackground,
      body: SafeArea(
        child: BlocConsumer<SettingsBloc, SettingsState>(
          listener: (context, state) {
            if (state is GetDefaultLanguageState) {
              if (state.languageCode == "en") {
                languageCode = SupportLanguage.en;
              } else {
                languageCode = SupportLanguage.ar;
              }
            } else if (state is ChangeLanguageState) {
              if (state.languageCode == "en") {
                languageCode = SupportLanguage.en;
              } else {
                languageCode = SupportLanguage.ar;
              }
              RestartWidget.restartApp(context);
            }
          },
          builder: (context, state) {
            print("TEST $languageCode");
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  AppBarWidget(
                    title: S.of(context).settings,
                    isHaveBackButton: true,
                    isHaveForms: false,
                    onFormsTab: () {},
                    imagePath: ImagePaths.arrowBack,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      MoreItemWidget(
                          iconPath: ImagePaths.language,
                          title: S.of(context).language,
                          onTap: () {}),
                      const Expanded(child: SizedBox()),
                      LanguageWidget(
                        groupValue: languageCode,
                      ),
                    ],
                  ),
                  // const SizedBox(height: 32),
                  // Row(
                  //   children: [
                  //     MoreItemWidget(
                  //         iconPath: ImagePaths.notification,
                  //         title: S.of(context).notification,
                  //         onTap: () {}),
                  //     const Expanded(child: SizedBox()),
                  //     NotificationsSwitchWidget(
                  //         value: true, onChange: (value) {}),
                  //   ],
                  // ),
                  const SizedBox(height: 32),
                  MoreItemWidget(
                    iconPath: ImagePaths.logout,
                    title: S.of(context).logout,
                    textColor: ColorSchema.red,
                    onTap: () async {
                      await Login.logout();
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.login, (route) => false);
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void initSorts(BuildContext context) {
    sorts = [
      Sort(
        0,
        S.of(context).sortAscending,
        "projectName",
        "asc",
        ImagePaths.sortAscending,
      ),
      Sort(
        1,
        S.of(context).sortDescending,
        "projectName",
        "desc",
        ImagePaths.sortDescending,
      ),
      Sort(
        2,
        S.of(context).recentlyAdded,
        "creationDate",
        "asc",
        ImagePaths.recentlyAdded,
      ),
      Sort(
        3,
        S.of(context).oldDate,
        "creationDate",
        "desc",
        ImagePaths.oldDate,
      ),
    ];
  }

}
