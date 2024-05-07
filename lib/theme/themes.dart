import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static final light = ThemeData(
      fontFamily: 'Poppins',
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kWhiteColor,
      brightness: Brightness.dark,
      shadowColor: kShadowColor,
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: kBlackColor, fontSize: 14),
        bodyMedium: TextStyle(color: kBlackColor, fontSize: 16),
        bodyLarge: TextStyle(color: kBlackColor, fontSize: 18),
        titleSmall: TextStyle(
            color: kBlackColor, fontSize: 20, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: kBlackColor, fontSize: 22, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(
            color: kBlackColor, fontSize: 24, fontWeight: FontWeight.w600),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: kWhiteColor,
        elevation: 20,
        modalElevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      ),
      dialogTheme: const DialogTheme(
          backgroundColor: kWhiteColor,
          titleTextStyle: TextStyle(
            color: kPrimaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          contentTextStyle: TextStyle(color: kBlackColor)),
      listTileTheme: const ListTileThemeData(textColor: kBlackColor),
      buttonTheme: ButtonThemeData());

  static final dark = ThemeData(
      fontFamily: 'Poppins',
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kWhiteColor,
      brightness: Brightness.light,
      shadowColor: kShadowColor,
      textTheme: const TextTheme(
        bodySmall: TextStyle(color: kBlackColor, fontSize: 14),
        bodyMedium: TextStyle(color: kBlackColor, fontSize: 16),
        bodyLarge: TextStyle(color: kBlackColor, fontSize: 18),
        titleSmall: TextStyle(
            color: kBlackColor, fontSize: 20, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: kBlackColor, fontSize: 22, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(
            color: kBlackColor, fontSize: 24, fontWeight: FontWeight.w600),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: kWhiteColor,
        elevation: 20,
        modalElevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      ),
      dialogTheme: const DialogTheme(
          backgroundColor: kWhiteColor,
          titleTextStyle: TextStyle(
            color: kPrimaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          contentTextStyle: TextStyle(color: kBlackColor)),
      listTileTheme: const ListTileThemeData(textColor: kBlackColor));
}
