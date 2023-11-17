import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final String labelText;
  final String iconPath;
  final Function(String) onChange;
  final ValueChanged<String> onSubmitted;
  final TextEditingController controller;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Function clearButtonAction;
  final Color? fillColor;

  const SearchTextFieldWidget(
      {Key? key,
      required this.controller,
      required this.labelText,
      required this.iconPath,
      this.suffixWidget,
      this.prefixWidget,
      required this.onSubmitted,
      required this.onChange,
      required this.clearButtonAction,
      this.fillColor = ColorSchema.white})
      : super(key: key);

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 16,
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: (value) {
          setState(() {});
          widget.onChange(value);
        },
        controller: widget.controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 40),
          filled: true,
          fillColor: widget.fillColor,
          hintText: widget.labelText,
          prefixIcon: SvgPicture.asset(
            widget.iconPath,
            width: 24,
            height: 24,
            fit: BoxFit.scaleDown,
          ),
          suffixIcon: widget.controller.text.isEmpty
              ? const SizedBox()
              : InkWell(
                  onTap: () {
                    setState(() {});
                    widget.clearButtonAction();
                  },
                  child: SvgPicture.asset(
                    ImagePaths.close,
                    fit: BoxFit.scaleDown,
                    color: ColorSchema.gray,
                  ),
                ),
          enabledBorder: buildBorderTheme(context),
          focusedBorder: buildBorderTheme(context),
        ),
        onFieldSubmitted: (value) => widget.onSubmitted(value),
      ),
    );
  }

  InputBorder? buildBorderTheme(BuildContext context) => Theme.of(context)
      .inputDecorationTheme
      .enabledBorder
      ?.copyWith(borderSide: const BorderSide(color: ColorSchema.white));
}
