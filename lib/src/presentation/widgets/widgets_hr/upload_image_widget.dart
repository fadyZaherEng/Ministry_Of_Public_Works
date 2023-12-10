import 'dart:io';

import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aim/generated/l10n.dart';

class UploadImageWidget extends StatefulWidget {
  final Question question;
  final Function() showUploadImageBottomSheet;
  final Function() showDialogToDeleteImage;

  final double verticalPadding;
  final double horizontalPadding;

  const UploadImageWidget(
      {Key? key,
      required this.question,
      required this.showDialogToDeleteImage,
      required this.showUploadImageBottomSheet,
      this.horizontalPadding = 16,
      this.verticalPadding = 16})
      : super(key: key);

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class Question {}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key("value"), //widget.question.key,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: widget.verticalPadding,
              horizontal: widget.horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              false||true //  widget.question.answer == null
                  ? DottedBorder(
                      color: true // widget.question.notAnswered ?? false
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
                                fit: BoxFit.scaleDown),
                            const SizedBox(height: 16.0),
                            GestureDetector(
                              onTap: () {
                                true //  widget.question.answer != null
                                    ? widget.showUploadImageBottomSheet()
                                    : null;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: ColorSchema.gray),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 16),
                                  child: Text(
                                    "S.of(context).uploadImage",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: ColorSchema.black,
                                            letterSpacing: -0.13),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Stack(
                      children: [
                        SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                    File("path"), //widget.question.answer,
                                    fit: BoxFit.fill))),
                        Positioned.directional(
                          textDirection: Directionality.of(context),
                          end: 6,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  widget.showDialogToDeleteImage();
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: ColorSchema.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    ImagePaths.close,
                                    fit: BoxFit.scaleDown,
                                    color: ColorSchema.gray,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () {
                                  widget.showUploadImageBottomSheet();
                                },
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: ColorSchema.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    "ImagePaths.edit",
                                    fit: BoxFit.scaleDown,
                                    color: ColorSchema.gray,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
              const SizedBox(height: 8.0),
              Visibility(
                  visible: false, // widget.question.notAnswered ?? false,
                  child: Text("S.of(context).thisFieldIsRequired",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: ColorSchema.red, letterSpacing: -.24))),
            ],
          ),
        ),
      ],
    );
  }
}
