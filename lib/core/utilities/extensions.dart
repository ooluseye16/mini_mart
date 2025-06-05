import 'package:flashy_flushbar/flashy_flushbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/theme/text_theme.dart';

extension Gap on num {
  SizedBox get height => SizedBox(height: toDouble().h);
  SizedBox get width => SizedBox(width: toDouble().w);
}

extension ImagePath on String {
  String get toPngIcon => 'assets/images/icons/$this.png';
  String get toSvgIcon => 'assets/images/icons/$this.svg';
}

extension ContextToastExtension on BuildContext {
  // This would be updated to general toast in the full app, if it uses the same design
  void showAddToCartToast() {
    FlashyFlushbar(
      margin: REdgeInsets.all(20),
      horizontalPadding: EdgeInsets.zero,
      animationDuration: Duration(seconds: 1),
      height: 56.h,
      customWidget: Container(
        // margin: REdgeInsets.all(20),
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border(
            left: BorderSide(color: AppColors.success, width: 4.w),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              "check-circle".toSvgIcon,
              width: 24.w,
              height: 24.w,
            ),
            16.width,
            Expanded(
              child: Text(
                "Item has been added to cart",
                style: body.copyWith(
                  color: AppColors.grey700,
                  fontSize: 14.sp,
                  height: 20 / 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              child: SvgPicture.asset(
                "close".toSvgIcon,
                width: 24.w,
                height: 24.w,
              ),
              onTap: () {
                // dismisses flushbar manually
                Navigator.of(this, rootNavigator: true).pop();
              },
            ),
          ],
        ),
      ),
    ).show();
  }
}

extension NumberFormatExtension on num {
  String toCurrencyString({String symbol = '\$'}) {
    return '$symbol${toStringAsFixed(2)}';
  }

  String toFormattedString() {
    return toStringAsFixed(2);
  }
}

extension TextTheming on BuildContext {
  TextStyle get appBarTitle =>
      Theme.of(this).extension<AppTextTheme>()!.appBarTitle;
  TextStyle get address => Theme.of(this).extension<AppTextTheme>()!.address;
  TextStyle get title => Theme.of(this).extension<AppTextTheme>()!.title;
  TextStyle get button => Theme.of(this).extension<AppTextTheme>()!.button;
  TextStyle get navbar => Theme.of(this).extension<AppTextTheme>()!.navbar;
  TextStyle get cardTitle =>
      Theme.of(this).extension<AppTextTheme>()!.cardTitle;
  TextStyle get cardPrice =>
      Theme.of(this).extension<AppTextTheme>()!.cardPrice;
  TextStyle get body => Theme.of(this).extension<AppTextTheme>()!.body;
  TextStyle get cartItemTitle =>
      Theme.of(this).extension<AppTextTheme>()!.cartItemTitle;
  TextStyle get cartItemPrice =>
      Theme.of(this).extension<AppTextTheme>()!.cartItemPrice;
  TextStyle get cartOrderInfoTitle =>
      Theme.of(this).extension<AppTextTheme>()!.cartOrderInfoTitle;
  TextStyle get cartOrderInfo =>
      Theme.of(this).extension<AppTextTheme>()!.cartOrderInfo;
}
