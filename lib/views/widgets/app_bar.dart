import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/utilities/extensions.dart';
import 'package:mini_mart/views/widgets/search_bar.dart';

class MinitMartAppBar extends StatelessWidget {
  const MinitMartAppBar({super.key, this.includeSearch = false, this.onSearch});

  final bool includeSearch;
  final ValueChanged<String>? onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.grey200, width: 1.w),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset("logo".toSvgIcon),
              Spacer(),
              Text("DELIVERY ADDRESS", style: context.appBarTitle),
              Spacer(),
              SvgPicture.asset("notification".toSvgIcon),
            ],
          ),
          Text("Umuezike Road, Oyo State", style: context.address),
          8.height,

          if (includeSearch)
            AppSearchBar(
              onSearch:
                  onSearch ??
                  (value) {
                    // Handle search action
                    print("Searching for: $value");
                  },
            ),
        ],
      ),
    );
  }
}
