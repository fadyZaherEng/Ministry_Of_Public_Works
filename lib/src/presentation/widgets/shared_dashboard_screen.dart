// ignore_for_file: deprecated_member_use

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/widgets/button_with_icon_widget.dart';
import 'package:aim/src/presentation/widgets/search_text_field_widget.dart';
import 'package:flutter/material.dart';

class SharedDashboardScreen extends StatefulWidget {
  final String title;
  final String searchLabel;
  final TextEditingController searchTextEditingController;
  Function(String)? onChange;
  Function(String)? onSubmit;
  Function()? clearActionButton;
  final Function() onFilterTab;
  final Function() onSortTab;
  final Widget content;
  final bool isHaveBackButton;
  final bool isFilterSelected;
  bool? isDashboard;
  Widget? dashboard;
  Function()? onDashboardTap;
  Function()? onListTab;
  bool isHaveSearch;

  SharedDashboardScreen({
    Key? key,
    required this.title,
    required this.searchLabel,
    required this.searchTextEditingController,
    this.onChange,
    this.onSubmit,
    this.clearActionButton,
    required this.onFilterTab,
    required this.onSortTab,
    required this.content,
    this.isHaveBackButton = false,
    this.isFilterSelected = true,
    this.isDashboard = false,
    this.dashboard,
    this.onDashboardTap,
    this.onListTab,
    this.isHaveSearch = true,
  }) : super(key: key);

  @override
  State<SharedDashboardScreen> createState() => _SharedDashboardScreenState();
}

class _SharedDashboardScreenState extends State<SharedDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorSchema.screenBackground,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              AppBarWidget(
                title: widget.title,
                isHaveBackButton: widget.isHaveBackButton,
                imagePath: ImagePaths.arrowBack,
                isHaveForms: false,
                onTap: () {
                  Navigator.pop(context);
                },
                isHaveFilter: widget.isDashboard ?? false,
                onFilterTab: widget.onFilterTab,
                onFormsTab: () {},
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildScreenTab(
                        title: S.of(context).dashboard,
                        onTap: widget.onDashboardTap ?? () {},
                        color: widget.isDashboard == true
                            ? ColorSchema.orange
                            : ColorSchema.primary.withOpacity(0.08),
                      ),
                      buildScreenTab(
                        title: S.of(context).list,
                        onTap: widget.onListTab ?? () {},
                        color: widget.isDashboard == false
                            ? ColorSchema.orange
                            : ColorSchema.primary.withOpacity(0.08),
                      ),
                    ],
                  ),
                  if (!(widget.isDashboard ?? false) && widget.isHaveSearch)
                    const SizedBox(height: 24),
                  if (!(widget.isDashboard ?? false) && widget.isHaveSearch)
                    SearchTextFieldWidget(
                      clearButtonAction: widget.clearActionButton!,
                      onSubmitted: widget.onSubmit!,
                      onChange: widget.onChange!,
                      controller: widget.searchTextEditingController,
                      labelText: widget.searchLabel,
                      iconPath: ImagePaths.search,
                    ),
                  if (!(widget.isDashboard ?? false))
                    const SizedBox(height: 16),
                  if (!(widget.isDashboard ?? false))
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ButtonWithIconWidget(
                            onTap: widget.onFilterTab,
                            buttonTitle: S.of(context).filter,
                            icon: ImagePaths.filter,
                            iconColor: _returnSelectedIconColor(
                                widget.isFilterSelected),
                            titleColor: _returnSelectedTitleColor(
                                widget.isFilterSelected),
                            backgroundColor: _returnSelectedBackgroundColor(
                                widget.isFilterSelected),
                          ),
                        ),
                        const SizedBox(width: 17),
                        Expanded(
                          child: ButtonWithIconWidget(
                            onTap: widget.onSortTab,
                            buttonTitle: S.of(context).sort,
                            icon: ImagePaths.sort,
                            iconColor: _returnSelectedIconColor(
                                !widget.isFilterSelected),
                            titleColor: _returnSelectedTitleColor(
                                !widget.isFilterSelected),
                            backgroundColor: _returnSelectedBackgroundColor(
                              !widget.isFilterSelected,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                ],
              ),
              buildScreenContent(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildScreenTab({
    required String title,
    required Function() onTap,
    required Color color,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    fontWeight: medium,
                    letterSpacing: -0.28,
                  ),
            ),
            const SizedBox(height: 4),
            Container(
              height: 2,
              color: color,
            )
          ],
        ),
      ),
    );
  }

  Widget buildScreenContent() {
    if (widget.isDashboard ?? false) return widget.dashboard ?? Container();
    return widget.content;
  }

  Color _returnSelectedIconColor(bool isFilteredSelected) {
    return isFilteredSelected == true ? ColorSchema.white : ColorSchema.primary;
  }

  Color _returnSelectedTitleColor(bool isFilteredSelected) {
    return isFilteredSelected == true ? ColorSchema.white : ColorSchema.primary;
  }

  Color _returnSelectedBackgroundColor(bool isFilteredSelected) {
    return isFilteredSelected == true ? ColorSchema.primary : ColorSchema.white;
  }
}
