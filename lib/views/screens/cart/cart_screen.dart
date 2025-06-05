import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/utilities/extensions.dart';
import 'package:mini_mart/viewmodels/cart_provider.dart';
import 'package:mini_mart/views/screens/cart/widgets/item_card.dart';
import 'package:mini_mart/views/screens/navigation.dart';
import 'package:mini_mart/views/widgets/app_bar.dart';
import 'package:mini_mart/views/widgets/buttons.dart';
import 'package:mini_mart/views/widgets/title.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartList = ref.watch(cartProvider);

    double subTotal = cartList.fold(
      0.0,
      (previousValue, item) =>
          previousValue + (item.product.price * item.quantity),
    );
    double shipping = 50.0; // Fixed shipping cost
    double total = subTotal + shipping;
    return SafeArea(
      child: Column(
        children: [
          MinitMartAppBar(),
          TitleWidget(label: "Your Cart", isBackButtonVisible: true),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:
                  cartList.isNotEmpty
                      ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              cartList.length,
                              (index) => CartItemCard(item: cartList[index]),
                            ),
                          ),
                          Text("Order Info", style: context.cartOrderInfoTitle),

                          CartInfoTile(
                            label: "Subtotal",
                            value: subTotal.toCurrencyString(),
                          ),
                          CartInfoTile(
                            label: "Shipping",
                            value: shipping.toCurrencyString(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total", style: context.cartOrderInfo),
                              Text(
                                total.toCurrencyString(),
                                style: context.cartOrderInfoTitle,
                              ),
                            ],
                          ),
                        ],
                      )
                      : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            120.height,
                            Text(
                              "Your cart is empty",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: "IBMPlexMono",
                                fontWeight: FontWeight.w500,
                                height: 1,
                                color: AppColors.black,
                              ),
                            ),
                            20.height,

                            AppDefaultButton(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Navigation.routeName,
                                );
                              },
                              text: "Start Shopping",
                              color: AppColors.lightBlue,
                            ),
                          ],
                        ),
                      ),
            ),
          ),
          if (cartList.isNotEmpty)
            Padding(
              padding: REdgeInsets.fromLTRB(16, 12, 16, 14),
              child: AppDefaultButton(
                onTap: () {
                  // context.showAddToCartToast();
                },
                text: "Checkout (${total.toCurrencyString()})",
                color: AppColors.lightBlue,
              ),
            ),
        ],
      ),
    );
  }
}

class CartInfoTile extends StatelessWidget {
  const CartInfoTile({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: context.cartOrderInfo),
        Text(value, style: context.cartOrderInfo),
      ],
    );
  }
}
