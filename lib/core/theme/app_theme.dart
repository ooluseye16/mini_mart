import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/theme/text_theme.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'IBMPlexSans',
    scaffoldBackgroundColor: const Color(0xFFFBFBFB),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    splashColor: AppColors.lightBlue.withOpacity(0.2),
    extensions: [AppTextTheme.fallback()],
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        height: 16 / 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w500,
        color: AppColors.grey500,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        height: 16 / 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w500,
        color: AppColors.primary,
      ),
      unselectedItemColor: AppColors.surface,
    ),
  );
}
