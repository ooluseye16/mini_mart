import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/utilities/extensions.dart';
import 'package:mini_mart/models/product.dart';
import 'package:mini_mart/views/screens/products/product_details.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.herotag});
  final Product product;
  final String herotag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to product details screen
        Navigator.pushNamed(
          context,
          ProductDetailsScreen.routeName,
          arguments: {'product': product, 'heroTag': herotag},
        );
      },
      child: Hero(
        tag: herotag,
        flightShuttleBuilder: (
          BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext,
        ) {
          return SingleChildScrollView(child: fromHeroContext.widget);
        },

        transitionOnUserGestures: true,
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 162.h,
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(product.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              4.height,
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.cardTitle,
              ),
              // Spacer(),
              4.height,
              Text("\$${product.price}", style: context.cardPrice),
            ],
          ),
        ),
      ),
    );
  }
}
