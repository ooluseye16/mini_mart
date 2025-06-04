import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/theme/text_styles.dart';
import 'package:mini_mart/core/utilities/extensions.dart';
import 'package:mini_mart/models/product.dart';
import 'package:mini_mart/viewmodels/cart_provider.dart';
import 'package:mini_mart/viewmodels/favorite_provider.dart';
import 'package:mini_mart/views/widgets/app_bar.dart';
import 'package:mini_mart/views/widgets/buttons.dart';
import 'package:mini_mart/views/widgets/favourite_icon.dart';
import 'package:mini_mart/views/widgets/title.dart';

class ProductDetailsScreen extends ConsumerWidget {
  static const String routeName = '/product-details';
  const ProductDetailsScreen( {super.key, required this.product, required this.heroTag,});

  final Product product;
  final String heroTag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(isFavoriteProvider(product.id));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MinitMartAppBar(),
            TitleWidget(
              label: "Go back",

              onTap: () {
                Navigator.pop(context);
              },
              isBackButtonVisible: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: heroTag,
                      transitionOnUserGestures: true,
                      flightShuttleBuilder: (
                        BuildContext flightContext,
                        Animation<double> animation,
                        HeroFlightDirection flightDirection,
                        BuildContext fromHeroContext,
                        BuildContext toHeroContext,
                      ) {
                        return SingleChildScrollView(
                          child: toHeroContext.widget,
                        );
                      },
                      child: Material(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 331.6.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBlue,
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        product.image,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                                Positioned(
                                  right: 14.w,
                                  top: 11.h,
                                  child: FavoriteIcon(
                                    isFavorite: isFavorite,
                                    onTap: (value) {
                                      if (value) {
                                        ref
                                            .read(favoritesProvider.notifier)
                                            .addToFavorites(product);
                                      } else {
                                        ref
                                            .read(favoritesProvider.notifier)
                                            .removeFromFavorites(product.id);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),

                            10.height,
                            Text(
                              product.name,
                              maxLines: null,
                              //overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.cardTitle.copyWith(
                                fontSize: 17.sp,
                              ),
                            ),
                            10.height,
                            Text(
                              "\$${product.price}",
                              maxLines: 1,
                              style: AppTextStyles.cardPrice.copyWith(
                                fontSize: 32.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    15.height,
                    Text(
                      "About this item \n ${product.description}",
                      style: AppTextStyles.body.copyWith(
                        color: Color(0xff999999),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.fromLTRB(16, 12, 16, 0),
              child: AppDefaultButton(
                onTap: () {
                  ref.read(cartProvider.notifier).addToCart(product);
                  context.showAddToCartToast();
                },
                text: "Add to cart",
                color: AppColors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
