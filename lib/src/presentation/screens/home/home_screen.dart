import 'package:aim/generated/l10n.dart';
import 'package:aim/injector.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/base/widget/base_stateful_widget.dart';
import 'package:aim/src/domain/entities/home/home.dart';
import 'package:aim/src/domain/entities/home/user.dart';
import 'package:aim/src/domain/usecases/get_permission_use_case.dart';
import 'package:aim/src/presentation/bloc/home/home_bloc.dart';
import 'package:aim/src/presentation/screens/home/widgets/monthly_report_summary_section.dart';
import 'package:aim/src/presentation/screens/home/widgets/monthly_report_summary_widget.dart';
import 'package:aim/src/presentation/screens/home/widgets/projects_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends BaseStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends BaseState<HomeScreen> {
  HomeBloc get _homeBloc => BlocProvider.of<HomeBloc>(context);

  Home _home = const Home();
  User _user = const User();
  String _permisssion = "";

  @override
  void initState() {
    super.initState();
    _homeBloc.add(GetHomeCountsEvent());
    _homeBloc.add(GetHomeUserEvent());
    initSorts();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _permisssion = await GetLocalPermissionUserCase(injector())();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetHomeCountsSuccessState) {
          _home = state.home;
        } else if (state is GetHomeCountsFailState) {
        } else if (state is GetHomeUserSuccessState) {
          _user = state.user;
        } else if (state is GetHomeUserFailState) {
        } else if (state is GetUserPermissionSuccessState) {
        } else if (state is GetUserPermissionFailState) {}
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: ColorSchema.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _user.name ?? "",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      color: ColorSchema.gray,
                                      letterSpacing: -0.26,
                                    ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            S.of(context).welcomeBack,
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      letterSpacing: -0.36,
                                    ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorSchema.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, -3),
                          spreadRadius: 0,
                          blurRadius: 24,
                          color: ColorSchema.black.withOpacity(0.08),
                        ),
                      ],
                    ),
                    child: _buildHomeContent(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Column _buildHomeContent() {
    if (_permisssion.isEmpty) {
      return const Column();
    }
    if (_permisssion == "Financial Auditors" ||
        _permisssion == "Financial Department") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MonthlyReportSummaryWidget(
            home: _home,
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectsSection(
          home: _home,
        ),
        const SizedBox(height: 24),
        MonthlyReportSummarySection(
          home: _home,
        ),
      ],
    );
  }

  void initSorts() {
    sorts = [
      Sort(
        0,
        S.current.sortAscending,
        "projectName",
        "asc",
        ImagePaths.sortAscending,
      ),
      Sort(
        1,
        S.current.sortDescending,
        "projectName",
        "desc",
        ImagePaths.sortDescending,
      ),
      Sort(
        2,
        S.current.recentlyAdded,
        "creationDate",
        "asc",
        ImagePaths.recentlyAdded,
      ),
      Sort(
        3,
        S.current.oldDate,
        "creationDate",
        "desc",
        ImagePaths.oldDate,
      ),
    ];
  }
}
