import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/utilities/extensions.dart';
import 'package:mini_mart/viewmodels/product_provider.dart';
import 'package:mini_mart/views/screens/products/widgets/product_card.dart'
    show ProductCard;
import 'package:mini_mart/views/widgets/app_bar.dart';
import 'package:mini_mart/views/widgets/title.dart';

class ProductsScreen extends ConsumerWidget {
  static const String routeName = '/products';
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productListData = ref.watch(productListProvider);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MinitMartAppBar(
            includeSearch: true,
            onSearch: (value) {
              ref.read(productSearchQueryProvider.notifier).state = value;
            },
          ),
          TitleWidget(label: "Technology"),
          Expanded(
            child: SingleChildScrollView(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Smartphones, Laptops & Accessories",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "IBMPlexMono",
                      fontWeight: FontWeight.w500,
                      height: 1,
                      color: AppColors.black,
                    ),
                  ),
                  12.height,
                  productListData.when(
                    data: (products) {
                      if (products.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              120.height,
                              Text(
                                "No products found",
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
                        children: List.generate(products.length, (index) {
                          return ProductCard(
                            product: products[index],
                            herotag: "product_${products[index].id}",
                          );
                        }),
                      );
                    },
                    error: (e, st) {
                      return Center(
                        child: Column(
                          children: [
                            120.height,
                            Text(
                              "Error loading products: $e",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.grey700,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    loading:
                        () => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
