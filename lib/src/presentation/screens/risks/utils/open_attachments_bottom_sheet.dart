import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:aim/src/presentation/screens/risks/widgets/attachment_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openAttachmentsBottomSheet({
  required BuildContext context,
  required double height,
  required List<Attachment> attachments,
  required void Function(List<Attachment> attachments) selectedAttachments,
}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: AttachmentBottomSheetWidget(
      attachments: attachments,
    ),
  ).then((value) {
    if(value != null) {
      selectedAttachments(value as List<Attachment>);
    }
  });
}
