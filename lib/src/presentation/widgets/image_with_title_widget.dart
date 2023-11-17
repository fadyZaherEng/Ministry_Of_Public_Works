import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWithTitleWidget extends StatelessWidget {
  final String image;
  final String title;
  final String value;
  EdgeInsets padding;

  ImageWithTitleWidget({
    Key? key,
    required this.image,
    required this.title,
    required this.value,
    this.padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardCardWidget(
      padding: padding,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorSchema.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            width: 42,
            height: 42,
            child: Center(
                child: SvgPicture.asset(
              image,
              width: 24,
              height: 24,
              color: Colors.white,
            )),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  letterSpacing: -0.26,
                ),
          ),
          const Expanded(child: SizedBox()),
          Text(
            value,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  letterSpacing: -0.36,
                ),
          ),
        ],
      ),
    );
  }
}
