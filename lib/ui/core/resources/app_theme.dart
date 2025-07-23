import 'package:flutter/material.dart';

import 'app_assets.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    dividerColor: AppColors.blue,
    primaryColor: AppColors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.blue,
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.darkBlue,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.fontFamilyFredoka,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkBlue,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.fontFamilyFredoka,
      ),
      bodySmall: TextStyle(
        color: AppColors.darkBlue,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: AppFonts.fontFamilyFredoka,
      ),
      titleLarge: TextStyle(
        color: AppColors.darkBlue,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.fontFamilyFredoka,
      ),
      labelLarge: TextStyle(
        color: AppColors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.fontFamilyFredoka,
      ),
      labelMedium: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: AppFonts.fontFamilyFredoka,
      ),
      labelSmall: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight:   FontWeight.bold,
        fontFamily: AppFonts.fontFamilyFredoka,
      ),
    ),
    dividerTheme: const DividerThemeData(color: AppColors.blue),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.blue,
      shape: const CircularNotchedRectangle(),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.blue,
        alignment: Alignment.center,
        textStyle: const TextStyle(
          color: AppColors.blue,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.fontFamilyFredoka,
          fontSize: 20,),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.blue,
        textStyle: const TextStyle(
          color: AppColors.blue,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.gray,
      suffixIconColor: AppColors.gray,
      hintStyle: const TextStyle(
        fontSize: 16,
        color: AppColors.gray,
        fontWeight: FontWeight.w500,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.gray, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.gray, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.gray, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.red, width: 1),
      ),
    ),
  );
}
