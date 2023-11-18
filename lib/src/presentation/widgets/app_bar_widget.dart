import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/presentation/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool isHaveBackButton;
  final bool isHaveForms;
  final String imagePath;
  final Function() onTap;
  final Function() onFormsTab;
  final bool isHaveFilter;
  final Function() onFilterTab;
  final bool isHaveDownloadButton;
  final Function()? onDownloadButton;

  const AppBarWidget({
    Key? key,
    required this.title,
    required this.isHaveBackButton,
    required this.isHaveForms,
    this.imagePath = "",
    this.onTap = _onTap,
    this.isHaveFilter = false,
    this.onFilterTab = _onFilterTab,
    required this.onFormsTab,
    this.isHaveDownloadButton = false,
    this.onDownloadButton,
  }) : super(key: key);

  static _onTap() {}

  static _onFilterTab() {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 250,
            child: Text(
              title,
              maxLines: 3,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    letterSpacing: -0.36,
                    fontSize: 17,
                  ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (isHaveFilter)
          Row(
            children: [
              const Expanded(child: SizedBox()),
              InkWell(
                onTap: onFilterTab,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorSchema.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: 35,
                  height: 35,
                  child: SvgPicture.asset(
                    ImagePaths.filterIcon,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
        if (isHaveForms)
          InkWell(
            onTap: onFormsTab,
            child: SizedBox(
              width: double.infinity,
              child: Text(
                S.of(context).form,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    letterSpacing: -0.26,
                    color: const Color.fromRGBO(0, 103, 183, 1)),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        if (isHaveBackButton)
          BackButtonWidget(
            imagePath: imagePath,
            onTap: onTap,
          ),
        Visibility(
          visible: isHaveDownloadButton,
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: onDownloadButton,
                icon: const Icon(
                  Icons.arrow_circle_down_rounded,
                  color: ColorSchema.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
