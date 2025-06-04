import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_mart/core/theme/colors.dart';

extension Gap on num {
  SizedBox get height => SizedBox(height: toDouble().h);
  SizedBox get width => SizedBox(width: toDouble().w);
}

extension ImagePath on String {
  String get toPngIcon => 'assets/images/icons/$this.png';
  String get toSvgIcon => 'assets/images/icons/$this.svg';
}

extension ContextToastExtension on BuildContext {
  void showAddToCartToast() {
    Flushbar(
      margin: REdgeInsets.all(20),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: Colors.white,
      leftBarIndicatorColor: AppColors.success,

      boxShadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
      duration: const Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      icon: SvgPicture.asset(
        "check-circle".toSvgIcon,
        width: 24.w,
        height: 24.h,
      ),
      messageText: const Text(
        'Item has been added to cart',
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      mainButton: IconButton(
        icon: SvgPicture.asset("close".toSvgIcon, width: 24.w, height: 24.h),
        onPressed: () {
          // dismisses flushbar manually
          Navigator.of(this, rootNavigator: true).pop();
        },
      ),
    ).show(this);
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