import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/theme/text_styles.dart';
import 'package:mini_mart/core/utilities/extensions.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.label,
    this.onTap,
    this.isBackButtonVisible = true,
  });
  final String label;
  final VoidCallback? onTap;
  final bool isBackButtonVisible;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            bottom: BorderSide(color: Color(0xfff5f5f5), width: 1.w),
          ),
        ),
        padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            if (isBackButtonVisible)
              SvgPicture.asset('left'.toSvgIcon, width: 24.h),
      
            8.width,
            Text(label, style: AppTextStyles.title),
          ],
        ),
      ),
    );
  }
}
