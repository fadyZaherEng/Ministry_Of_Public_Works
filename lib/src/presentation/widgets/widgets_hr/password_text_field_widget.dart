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
import 'package:flutter_svg/flutter_svg.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelTitle;
  final String? errorMessage;
  final Function(String) onChange;

  const PasswordTextFieldWidget({
    Key? key,
    required this.controller,
    required this.labelTitle,
    required this.onChange,
    this.errorMessage,
  }) : super(key: key);

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _showPassword = true;
  String _passwordIcon = ImagePaths.impactRisk; //ImagePaths.showPassword;
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
      controller: widget.controller,
      onChanged: widget.onChange,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.bold,
          color: ColorSchema.black,
          letterSpacing: -0.13),
      obscureText: _showPassword,
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
          suffixIcon: IconButton(
            icon: SvgPicture.asset(
              _passwordIcon,
              fit: BoxFit.scaleDown,
              matchTextDirection: true,
            ),
            onPressed: _toggleVisibilityIcon,
          ),
          prefixIcon: SvgPicture.asset(
            "", //ImagePaths.lock,
            fit: BoxFit.scaleDown,
            matchTextDirection: true,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          labelStyle: _labelStyle(context, _textFieldHasFocus),
          errorMaxLines: 2),
    );
  }

  void _toggleVisibilityIcon() {
    setState(() {
      _showPassword = !_showPassword;
      if (_showPassword) {
        _passwordIcon = ""; // ImagePaths.showPassword;
      } else {
        _passwordIcon = ""; // ImagePaths.hidePassword;
      }
    });
  }

  TextStyle _labelStyle(BuildContext context, bool hasFocus) {
    if (hasFocus || widget.controller.text.isNotEmpty) {
      return Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
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
  void deactivate() {
    _focus.dispose();
    super.deactivate();
  }
}
