import 'package:aim/src/presentation/widgets/yes_no_dialog_widget.dart';
import 'package:flutter/material.dart';

Future showYesNoDialog({
  required BuildContext context,
  required String dialogMessage,
  required Function() actionButtonOnTap,
  required Function() cancelButtonOnTap,
  required String cancelButtonText,
  required String actionButtonText,
}) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: YesNoDialogWidget(
          actionButtonOnTap: actionButtonOnTap,
          cancelButtonOnTap: cancelButtonOnTap,
          dialogMessage: dialogMessage,
          actionButtonText: actionButtonText,
          cancelButtonText: cancelButtonText,
        ),
      ),
    );

/*
Future showLogoutConfirmDialog(context) => showYesNoDialog(
      context: context,
      dialogMessage: S.of(context).areYouSureYouWantToLogout,
      actionButtonOnTap: () {
        Navigator.pop(context);
      },
      cancelButtonOnTap: () {
        Navigator.pop(context);
      },
      cancelButtonText: S.of(context).logout,
      actionButtonText: S.of(context).cancel,
    );
 */
