import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatefulWidget {
  final String? labelText, errorText;
  final Function? onChange;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final InputBorder? inputBorder;
  final double? height;
  final double? width;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Function? clearButtonAction;
  final Color? fillColor;
  final double? boxConstraints;

  const SearchTextFieldWidget(
      {Key? key,
      this.height = 60,
      this.width,
      required this.controller,
      required this.labelText,
      this.inputBorder,
      this.errorText,
      this.suffixWidget,
      this.prefixWidget,
      this.onSubmitted,
      this.onChange,
      this.clearButtonAction,
      this.fillColor,
      this.boxConstraints})
      : super(key: key);

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        setState(() {});
        widget.onChange!();
      },
      controller: widget.controller,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: ColorSchema.gray),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10),
        filled: true,
        fillColor: widget.fillColor ?? ColorSchema.gray,
        constraints: widget.boxConstraints != null
            ? BoxConstraints.expand(height: widget.boxConstraints)
            : null,
        hintText: widget.labelText,
        errorText: widget.errorText,
        prefixIcon: const Icon(
          Icons.search,
          size: 28,
          color: ColorSchema.gray,
        ),
        suffixIcon: widget.controller!.text.isEmpty
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  setState(() {});
                  widget.clearButtonAction!();
                },
                child: const Icon(
                  Icons.close,
                  color: ColorSchema.gray,
                  size: 20,
                ),
              ),
        border: widget.inputBorder,
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: ColorSchema.primary)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: ColorSchema.gray)),
        errorBorder: widget.errorText != ""
            ? const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: ColorSchema.red))
            : null,
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: ColorSchema.gray)),
      ),
      onFieldSubmitted: (value) => widget.onSubmitted!(value),
    );
  }
}
