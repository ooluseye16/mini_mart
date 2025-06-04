import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/theme/text_styles.dart';
import 'package:mini_mart/core/utilities/extensions.dart';
import 'package:mini_mart/models/cart_item.dart';
import 'package:mini_mart/viewmodels/cart_provider.dart';

class CartItemCard extends ConsumerStatefulWidget {
  const CartItemCard({super.key, required this.item});
  final CartItem item;

  @override
  ConsumerState<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends ConsumerState<CartItemCard> {
  late int quantity;
  void incrementQuantity() {
    setState(() {
      quantity++;
    });
    ref.read(cartProvider.notifier).increaseQty(widget.item.product.id);
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
    ref.read(cartProvider.notifier).decreaseQty(widget.item.product.id);
  }

  void deleteItem() {
    // Handle item deletion logic here

    ref.read(cartProvider.notifier).removeFromCart(widget.item.product.id);
  }

  @override
  void initState() {
    super.initState();
    quantity = widget.item.quantity;
  }

  @override
  void didUpdateWidget(covariant CartItemCard oldWidget) {
    quantity = widget.item.quantity;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.grey100,
      ),
      margin: REdgeInsets.only(bottom: 15),
      padding: REdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            height: 100.w,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.lightBlue,

              image: DecorationImage(
                image: CachedNetworkImageProvider(widget.item.product.image),
                fit: BoxFit.cover,
              ),

              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
          10.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cartItemTitle,
                ),

                Text(
                  "\$${widget.item.product.price}",
                  style: AppTextStyles.cartItemPrice,
                ),
                Text(
                  "In Stock",
                  style: AppTextStyles.cartItemTitle.copyWith(
                    color: AppColors.success,
                  ),
                ),
                8.height,
                Row(
                  children: [
                    CartIconButton(
                      color: AppColors.grey200,
                      iconName: "minus",
                      onTap: () {
                        decrementQuantity();
                      },
                    ),
                    16.width,
                    Text("$quantity", style: AppTextStyles.cartItemTitle),
                    16.width,
                    CartIconButton(
                      color: AppColors.white,
                      iconName: "add",
                      hasBorder: true,
                      onTap: () {
                        // Handle increment action
                        incrementQuantity();
                      },
                    ),
                    Spacer(),
                    CartIconButton(
                      color: AppColors.white,
                      iconName: "delete",
                      onTap: () {
                        // Handle delete action
                        deleteItem();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    super.key,
    required this.iconName,
    this.onTap,
    required this.color,
    this.hasBorder = false,
  });
  final String iconName;
  final VoidCallback? onTap;
  final Color color;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border:
              hasBorder
                  ? Border.all(color: AppColors.grey200, width: 1.w)
                  : null,
        ),
        child: SvgPicture.asset(iconName.toSvgIcon),
      ),
    );
  }
}
