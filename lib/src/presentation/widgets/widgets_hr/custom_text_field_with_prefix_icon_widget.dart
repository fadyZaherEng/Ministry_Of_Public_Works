import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldWithPrefixIconWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelTitle;
  final String? errorMessage;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value) onChanged;
  final Widget prefixIcon;

  const CustomTextFieldWithPrefixIconWidget({
    Key? key,
    required this.controller,
    required this.labelTitle,
    this.errorMessage,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    required this.prefixIcon,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextFieldWithPrefixIconWidget> createState() =>
      _CustomTextFieldWithPrefixIconWidgetState();
}

class _CustomTextFieldWithPrefixIconWidgetState
    extends State<CustomTextFieldWithPrefixIconWidget> {
  final FocusNode _focus = FocusNode();
  bool _textFieldHasFocus = false;

  @override
  void initState() {
    _focus.addListener(() {
      setState(() {
        _textFieldHasFocus = _focus.hasFocus;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focus,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      onChanged: (value) => widget.onChanged(value),
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: ColorSchema.black,
          letterSpacing: -0.13),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorSchema.black),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorSchema.black),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorSchema.red),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorSchema.black),
            borderRadius: BorderRadius.circular(10)),
        errorText: widget.errorMessage,
        labelText: widget.labelTitle,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: _labelStyle(context, _textFieldHasFocus),
        errorMaxLines: 2,
        prefixIcon: widget.prefixIcon,
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }

  TextStyle _labelStyle(BuildContext context, bool hasFocus) {
    if (hasFocus || widget.controller.text.isNotEmpty) {
      return Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
            color: widget.errorMessage == null
                ? ColorSchema.gray
                : ColorSchema.red,
            letterSpacing: -0.13,
          );
    } else {
      return Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.normal,
            color: widget.errorMessage == null
                ? ColorSchema.gray
                : ColorSchema.red,
            letterSpacing: -0.13,
          );
    }
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }
}
