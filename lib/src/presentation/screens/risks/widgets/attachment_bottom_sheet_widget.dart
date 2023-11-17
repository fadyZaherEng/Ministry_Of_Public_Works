import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:aim/src/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AttachmentBottomSheetWidget extends StatefulWidget {
  final List<Attachment> attachments;

  const AttachmentBottomSheetWidget({
    Key? key,
    required this.attachments,
  }) : super(key: key);

  @override
  State<AttachmentBottomSheetWidget> createState() =>
      _AttachmentBottomSheetWidgetState();
}

class _AttachmentBottomSheetWidgetState
    extends State<AttachmentBottomSheetWidget> {
  List<Attachment> selectedAttachment = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.attachments.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  onTap: () {
                    selectedAttachment.clear();
                    selectedAttachment.add(widget.attachments[index]);
                    navigateBackWithValue(selectedAttachment);
                  },
                  child: Row(
                    children: [
                      Text(
                        widget.attachments[index].name ?? "",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const Expanded(
                          child: SizedBox(
                        width: 8,
                      )),
                      SvgPicture.asset(ImagePaths.sortAscending),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ButtonWidget(
          onTap: () {
            navigateBackWithValue(widget.attachments);
          },
          buttonTitle: S.of(context).downloadAll,
        )
      ],
    );
  }

  void navigateBackWithValue(List<Attachment> attachment) {
    Navigator.pop(context, attachment);
  }
}
