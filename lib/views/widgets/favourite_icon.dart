
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/utilities/extensions.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });
  final bool isFavorite;
  final Function(bool) onTap;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        widget.onTap(isFavorite);
      },
      child: Container(
        padding: REdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child:
            isFavorite
                ? SvgPicture.asset("favourite_filled".toSvgIcon)
                : SvgPicture.asset("favourite".toSvgIcon),
      ),
    );
  }
}
