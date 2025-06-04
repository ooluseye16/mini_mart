
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/utilities/extensions.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key, required this.onSearch});

  // final TextEditingController searchController;
  final ValueChanged<String> onSearch;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  Timer? _debounce;
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearch(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      cursorColor: AppColors.primary,
      onChanged: _onChanged,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: 'Search...',
        prefixIcon: UnconstrainedBox(
          child: SvgPicture.asset(
            "search".toSvgIcon,
            height: 20.h,
            width: 20.h,
          ),
        ),
        hintStyle: TextStyle(color: AppColors.grey300, fontSize: 14.sp),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(color: AppColors.grey200, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(color: AppColors.primary, width: 1.w),
        ),
      ),
    );
  }
}

