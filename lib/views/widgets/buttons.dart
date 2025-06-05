import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/utilities/extensions.dart';

class AppDefaultButton extends StatelessWidget {
  const AppDefaultButton({
    super.key,
    required this.onTap,
    required this.text,
    this.isActive = true,
    this.color = AppColors.primary,
  });

  final bool isActive;
  final Function() onTap;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? color : AppColors.grey200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,

            style:
                isActive
                    ? context.button
                    : context.button.copyWith(color: AppColors.grey500),
          ),
        ),
      ),
    );
  }
}
