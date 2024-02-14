import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemeData {
  ThemeData theme(Brightness brightness) =>
      brightness == Brightness.light ? lightTheme() : darkTheme();

  ThemeData lightTheme() {
    return ThemeData();
  }

  ThemeData darkTheme() {
    return ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
      scaffoldBackgroundColor: AppColors.primaryBackgroundDark,
      dialogBackgroundColor: AppColors.primaryBackgroundDark,
      brightness: Brightness.dark,
      disabledColor: AppColors.grey,
      splashColor: AppColors.primary.withOpacity(0.2),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        background: AppColors.primaryBackgroundDark,
        seedColor: AppColors.primary,
        primary: AppColors.primary,
      ),
      extensions: const [],
    );
  }
}
