import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/theme/colors.dart';

class AppTextStyles {
  static TextStyle appBarTitle = TextStyle(
    fontSize: 10.sp,
    height: 28 / 10,
    fontWeight: FontWeight.w600,
    color: AppColors.grey700,
  );
  static TextStyle address = TextStyle(
    fontSize: 12.sp,
    height: 28 / 12,
    fontWeight: FontWeight.w600,
    color: AppColors.grey700,
  );

  static TextStyle title = TextStyle(
    fontSize: 18.sp,
    height: 24 / 18,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
  static TextStyle button = TextStyle(
    fontSize: 14.sp,
    height: 20 / 14,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );
  static TextStyle navbar = TextStyle(
    fontSize: 12.sp,
    height: 16 / 12,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
    color: AppColors.surface,
  );

  static TextStyle cardTitle = TextStyle(
    fontSize: 14.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    color: AppColors.black,
  );
  static TextStyle cardPrice = TextStyle(
    fontSize: 16.sp,
    height: 1,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle body = TextStyle(
    fontSize: 14.sp,
    height: 1.2,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
  static TextStyle cartItemTitle = TextStyle(
    fontSize: 12.sp,
    height: 20 / 12,
    fontWeight: FontWeight.w400,
    color: AppColors.grey700,
  );
  static TextStyle cartItemPrice = TextStyle(
    fontSize: 17.sp,
    height: 32 / 17,
    fontWeight: FontWeight.w600,
    color: AppColors.grey700,
  );
  static TextStyle cartOrderInfoTitle = TextStyle(
    fontSize: 14.sp,
    height: 20 / 14,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

    static TextStyle cartOrderInfo = TextStyle(
    fontSize: 12.sp,
    height: 20 / 12,
    fontWeight: FontWeight.w500,
    color: AppColors.grey700,
  );



  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withHeight(TextStyle style, double height) {
    return style.copyWith(height: height);
  }

  static TextStyle withFontWeight(TextStyle style, FontWeight fontWeight) {
    return style.copyWith(fontWeight: fontWeight);
  }
}
