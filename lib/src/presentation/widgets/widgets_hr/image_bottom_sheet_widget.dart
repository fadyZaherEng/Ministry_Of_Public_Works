import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aim/generated/l10n.dart';

class ImageBottomSheetWidget extends StatefulWidget {
  final Function() onTapCamera;
  final Function() onTapGallery;

  const ImageBottomSheetWidget({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
  });

  @override
  State<ImageBottomSheetWidget> createState() => _ImageBottomSheetWidgetState();
}

class _ImageBottomSheetWidgetState extends State<ImageBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: widget.onTapCamera,
          child: Row(
            children: [
              SvgPicture.asset(
                ImagePaths.gallery,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 10),
              Text(
                "camera",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorSchema.black,
                    ),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Divider(height: 1, color: ColorSchema.black),
        const SizedBox(height: 15),
        InkWell(
          onTap: widget.onTapGallery,
          child: Row(
            children: [
              SvgPicture.asset(
                ImagePaths.gallery,
                fit: BoxFit.scaleDown,
              ),
              const SizedBox(width: 10),
              Text(
                "gallery",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: ColorSchema.black,
                    ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
