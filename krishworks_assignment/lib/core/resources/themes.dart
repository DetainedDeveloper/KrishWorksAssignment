import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimensions.dart';
import 'strings.dart';

abstract class AppThemes {
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    fontFamily: AppStrings.poppins,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.background,
    ),
    backgroundColor: AppColors.background,
    textTheme: _TextTheme.textTheme,
    elevatedButtonTheme: _ElevatedButtonTheme.elevatedButtonTheme,
    textButtonTheme: _TextButtonTheme.textButtonTheme,
    snackBarTheme: _SnackBarTheme.snackBarTheme,
    inputDecorationTheme: _InputDecorationTheme.inputDecorationTheme,
  );
}

abstract class _TextTheme {
  static const TextStyle _primary = TextStyle(
    color: AppColors.textPrimary,
  );

  static const TextStyle _secondary = TextStyle(
    color: AppColors.textSecondary,
  );

  static const TextStyle _button = TextStyle(
    fontSize: AppDimensions.d16,
    color: AppColors.textButton,
  );

  static const TextTheme textTheme = TextTheme(
    headline1: _primary,
    headline2: _primary,
    headline3: _primary,
    headline4: _primary,
    headline5: _primary,
    headline6: _primary,
    subtitle1: _primary,
    subtitle2: _secondary,
    bodyText1: _primary,
    bodyText2: _secondary,
    button: _button,
    caption: _primary,
    overline: _primary,
  );
}

abstract class _ElevatedButtonTheme {
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0.0),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: AppDimensions.d32, vertical: AppDimensions.d8),
      ),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppDimensions.d32)),
        ),
      ),
    ),
  );
}

abstract class _TextButtonTheme {
  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.all(0.0),
      ),
    ),
  );
}

abstract class _SnackBarTheme {
  static const TextStyle _snackbar = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: AppDimensions.d16,
    color: AppColors.textSnackbar,
  );

  static const SnackBarThemeData snackBarTheme = SnackBarThemeData(
    contentTextStyle: _snackbar,
  );
}

abstract class _InputDecorationTheme {
  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppDimensions.d8),
      ),
      borderSide: BorderSide(
        color: AppColors.inactive,
        width: AppDimensions.d05,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppDimensions.d8),
      ),
      borderSide: BorderSide(
        color: AppColors.active,
        width: AppDimensions.d2,
      ),
    ),
    contentPadding: EdgeInsets.all(AppDimensions.d16),
    labelStyle: TextStyle(color: AppColors.inactive),
    alignLabelWithHint: true,
  );
}
