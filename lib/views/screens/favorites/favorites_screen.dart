import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/utilities/extensions.dart';
import 'package:mini_mart/viewmodels/favorite_provider.dart';
import 'package:mini_mart/views/screens/products/widgets/product_card.dart';
import 'package:mini_mart/views/widgets/app_bar.dart';
import 'package:mini_mart/views/widgets/title.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MinitMartAppBar(),
          TitleWidget(label: "Favorites"),
          Expanded(
            child: SingleChildScrollView(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  () {
                    if (favorites.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            120.height,
                            Text(
                              "You have no favorites yet",
                              style: TextStyle(
                                color: AppColors.grey700,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15.h,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: (162.h / 220.h),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: REdgeInsets.symmetric(horizontal: 4),
                      children: List.generate(favorites.length, (index) {
                        return ProductCard(
                          product: favorites[index],
                          herotag: 'favorite-${favorites[index].id}',
                        );
                      }),
                    );
                  }(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
