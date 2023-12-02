import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aim/generated/l10n.dart';

class UploadFileWidget extends StatefulWidget {
  final GlobalKey globalKey;
  final String filePath;
  final Function() showUploadFileBottomSheet;
  final Function(String filePath) deleteFileAction;
  final bool isMandatory;
  final String? fileErrorMassage;

  const UploadFileWidget({
    Key? key,
    required this.deleteFileAction,
    required this.showUploadFileBottomSheet,
    required this.globalKey,
    required this.filePath,
    this.isMandatory = false,
    this.fileErrorMassage,
  }) : super(key: key);

  @override
  State<UploadFileWidget> createState() => _UploadFileWidgetState();
}

class _UploadFileWidgetState extends State<UploadFileWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      key: widget.globalKey,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.filePath.isEmpty
                ? DottedBorder(
                    color: widget.isMandatory
                        ? ColorSchema.red
                        : ColorSchema.primary,
                    borderType: BorderType.RRect,
                    strokeCap: StrokeCap.butt,
                    dashPattern: const [4, 4],
                    strokeWidth: 1.2,
                    radius: const Radius.circular(8),
                    child: Container(
                      color: ColorSchema.white,
                      height: 130,
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(height: 24.0),
                          SvgPicture.asset("ImagePaths.uploadFile",
                              fit: BoxFit.scaleDown,
                              color: ColorSchema.primary),
                          const SizedBox(height: 16.0),
                          GestureDetector(
                            onTap: () {
                              widget.filePath.isEmpty
                                  ? widget.showUploadFileBottomSheet()
                                  : null;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: ColorSchema.white),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                child: Text(
                                  "S.of(context).choseFile",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: ColorSchema.black,
                                        letterSpacing: -0.13,
                                      ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "ImagePaths.file",
                        fit: BoxFit.scaleDown,
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.filePath.split('/').last,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: ColorSchema.black,
                                    letterSpacing: -0.13,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => widget.deleteFileAction(widget.filePath),
                        child: SvgPicture.asset(
                          ImagePaths.close,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 8.0),
            Visibility(
                visible: widget.isMandatory,
                child: Text(widget.fileErrorMassage ?? "",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: ColorSchema.red,
                          letterSpacing: -.24,
                        ))),
          ],
        ),
      ],
    );
  }
}
