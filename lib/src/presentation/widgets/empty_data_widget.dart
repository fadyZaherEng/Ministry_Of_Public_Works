import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagePaths.noRecord,
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 24),
          Text(
            S.of(context).noRecordText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3?.copyWith(
                  letterSpacing: -0.32,
                  fontWeight: regular,
                ),
          )
        ],
      ),
    );
  }
}
