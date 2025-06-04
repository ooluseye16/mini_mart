import 'package:flutter/material.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/theme/text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'IBMPlexSans',
    scaffoldBackgroundColor: const Color(0xFFFBFBFB),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    splashColor: AppColors.lightBlue.withOpacity(0.2),
    textTheme: TextTheme(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedLabelStyle: AppTextStyles.navbar,

      selectedLabelStyle: AppTextStyles.navbar,
      unselectedItemColor: AppColors.surface,
    ),
  );
}
