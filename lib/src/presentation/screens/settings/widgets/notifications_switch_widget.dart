import 'dart:io' show Platform;

import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsSwitchWidget extends StatelessWidget {
  final bool value;
  final Function(bool) onChange;

  const NotificationsSwitchWidget({
    Key? key,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? SizedBox(
            width: 40,
            height: 0,
            child: Switch(
              value: value,
              onChanged: onChange,
            ),
          )
        : SizedBox(
            width: 40,
            height: 0,
            child: Transform.scale(
              scale: 0.6,
              child: CupertinoSwitch(
                activeColor: ColorSchema.primary,
                value: value,
                onChanged: onChange,
              ),
            ),
          );
  }
}
