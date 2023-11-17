import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  String language;

  AppTheme(this.language);

  ThemeData get light {
    return ThemeData(
      fontFamily: getFontFamily(),
      toggleableActiveColor: ColorSchema.primary,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: ColorSchema.white,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: ColorSchema.primary,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(8),
        hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(),
            color: ColorSchema.gray,
            letterSpacing: 0.26,
            fontWeight: regular),
        labelStyle: TextStyle(
            fontSize: 14,
            fontFamily: getFontFamily(), //todo handle font family
            color: ColorSchema.gray,
            fontWeight: regular),
        errorStyle: TextStyle(
            fontSize: 12,
            fontFamily: getFontFamily(), //todo handle font family
            color: ColorSchema.red,
            fontWeight: regular),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchema.gray, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchema.primary, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchema.red, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorSchema.red, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignLabelWithHint: true,
      ),
      textTheme: TextTheme(
        headline6: getTextStyle(fontFamily: getFontFamily()),
        headline4: getTextStyle(fontSize: 18, fontFamily: getFontFamily()),
        headline3: getTextStyle(fontSize: 16, fontFamily: getFontFamily()),
        headline2: getTextStyle(fontSize: 14, fontFamily: getFontFamily()),
        headline1: getTextStyle(fontSize: 13, fontFamily: getFontFamily()),
        subtitle1: getTextStyle(
            fontSize: 13, fontFamily: getFontFamily(), fontWeight: medium),
        bodyText1: getTextStyle(
            fontSize: 13, fontFamily: getFontFamily(), fontWeight: regular),
        caption: getTextStyle(
            fontSize: 12, fontFamily: getFontFamily(), fontWeight: regular),
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorSchema.primary,
      splashColor: Colors.transparent,
    );
  }

  String getFontFamily() =>
      language == "en" ? englishFontFamily : arabicFontFamily;

  static TextStyle getTextStyle({
    double fontSize = 24,
    FontWeight fontWeight = bold,
    String fontFamily = englishFontFamily,
    Color color = ColorSchema.primary,
  }) {
    return TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color);
  }
}
