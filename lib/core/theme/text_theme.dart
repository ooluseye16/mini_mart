import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/theme/colors.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle appBarTitle;
  final TextStyle address;
  final TextStyle title;
  final TextStyle button;
  final TextStyle navbar;
  final TextStyle cardTitle;
  final TextStyle cardPrice;
  final TextStyle body;
  final TextStyle cartItemTitle;
  final TextStyle cartItemPrice;
  final TextStyle cartOrderInfoTitle;
  final TextStyle cartOrderInfo;

  const AppTextTheme({
    required this.appBarTitle,
    required this.address,
    required this.title,
    required this.button,
    required this.navbar,
    required this.cardTitle,
    required this.cardPrice,
    required this.body,
    required this.cartItemTitle,
    required this.cartItemPrice,
    required this.cartOrderInfoTitle,
    required this.cartOrderInfo,
  });

  AppTextTheme.fallback()
    : appBarTitle = TextStyle(
        fontSize: 10.sp,
        height: 28 / 10,
        fontWeight: FontWeight.w600,
        color: AppColors.grey700,
      ),
      address = TextStyle(
        fontSize: 12.sp,
        height: 28 / 12,
        fontWeight: FontWeight.w600,
        color: AppColors.grey700,
      ),
      title = TextStyle(
        fontSize: 18.sp,
        height: 24 / 18,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
      button = TextStyle(
        fontSize: 14.sp,
        height: 20 / 14,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      ),
      navbar = TextStyle(
        fontSize: 12.sp,
        height: 16 / 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w500,
        color: AppColors.surface,
      ),
      cardTitle = TextStyle(
        fontSize: 14.sp,
        height: 1.2,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: AppColors.black,
      ),
      cardPrice = TextStyle(
        fontSize: 16.sp,
        height: 1,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
      body = TextStyle(
        fontSize: 14.sp,
        height: 1.2,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      cartItemTitle = TextStyle(
        fontSize: 12.sp,
        height: 20 / 12,
        fontWeight: FontWeight.w400,
        color: AppColors.grey700,
      ),
      cartItemPrice = TextStyle(
        fontSize: 17.sp,
        height: 32 / 17,
        fontWeight: FontWeight.w600,
        color: AppColors.grey700,
      ),
      cartOrderInfoTitle = TextStyle(
        fontSize: 14.sp,
        height: 20 / 14,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      ),
      cartOrderInfo = TextStyle(
        fontSize: 12.sp,
        height: 20 / 12,
        fontWeight: FontWeight.w500,
        color: AppColors.grey700,
      );

  @override
  AppTextTheme copyWith({
    TextStyle? appBarTitle,
    TextStyle? address,
    TextStyle? title,
    TextStyle? button,
    TextStyle? navbar,
    TextStyle? cardTitle,
    TextStyle? cardPrice,
    TextStyle? body,
    TextStyle? cartItemTitle,
    TextStyle? cartItemPrice,
    TextStyle? cartOrderInfoTitle,
    TextStyle? cartOrderInfo,
  }) {
    return AppTextTheme(
      appBarTitle: appBarTitle ?? this.appBarTitle,
      address: address ?? this.address,
      title: title ?? this.title,
      button: button ?? this.button,
      navbar: navbar ?? this.navbar,
      cardTitle: cardTitle ?? this.cardTitle,
      cardPrice: cardPrice ?? this.cardPrice,
      body: body ?? this.body,
      cartItemTitle: cartItemTitle ?? this.cartItemTitle,
      cartItemPrice: cartItemPrice ?? this.cartItemPrice,
      cartOrderInfoTitle: cartOrderInfoTitle ?? this.cartOrderInfoTitle,
      cartOrderInfo: cartOrderInfo ?? this.cartOrderInfo,
    );
  }

  @override
  AppTextTheme lerp(ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) return this;

    return AppTextTheme(
      appBarTitle: TextStyle.lerp(appBarTitle, other.appBarTitle, t)!,
      address: TextStyle.lerp(address, other.address, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      button: TextStyle.lerp(button, other.button, t)!,

      navbar: TextStyle.lerp(navbar, other.navbar, t)!,

      cardTitle: TextStyle.lerp(cardTitle, other.cardTitle, t)!,
      cardPrice: TextStyle.lerp(cardPrice, other.cardPrice, t)!,

      body: TextStyle.lerp(body, other.body, t)!,
      cartItemTitle: TextStyle.lerp(cartItemTitle, other.cartItemTitle, t)!,
      cartItemPrice: TextStyle.lerp(cartItemPrice, other.cartItemPrice, t)!,
      cartOrderInfoTitle:
          TextStyle.lerp(cartOrderInfoTitle, other.cartOrderInfoTitle, t)!,
      cartOrderInfo: TextStyle.lerp(cartOrderInfo, other.cartOrderInfo, t)!,
    );
  }
}
