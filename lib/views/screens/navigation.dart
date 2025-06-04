import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    show REdgeInsets, SizeExtension;
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:mini_mart/core/theme/colors.dart';
import 'package:mini_mart/core/utilities/extensions.dart';
import 'package:mini_mart/viewmodels/cart_provider.dart';
import 'package:mini_mart/views/screens/cart/cart_screen.dart';
import 'package:mini_mart/views/screens/favorites/favorites_screen.dart';
import 'package:mini_mart/views/screens/products/products_screen.dart';

class Navigation extends ConsumerStatefulWidget {
  static const String routeName = '/navigation';
  const Navigation({super.key});

  @override
  ConsumerState<Navigation> createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final cartCount = ref.watch(cartCountProvider);
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          ProductsScreen(),
          CartScreen(),
          FavoritesScreen(),
          Container(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarIcon(icon: "home", selected: currentIndex == 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(
              icon: "cart",
              selected: currentIndex == 1,
              count: cartCount,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(icon: "favourite", selected: currentIndex == 2),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(icon: "user", selected: currentIndex == 3),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  final String icon;
  final bool selected;
  final int? count;

  const NavBarIcon({
    super.key,
    required this.icon,
    required this.selected,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? AppColors.lightBlue : null,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Stack(
        //alignment: Alignment.topRight,
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            icon.toSvgIcon,

            colorFilter:
                selected
                    ? ColorFilter.mode(AppColors.white, BlendMode.srcIn)
                    : null,
          ),
          if (count != null && count != 0)
            Positioned(
              top: -10,
              right: -10,
              child: Badge.count(
                count: count!,
                padding: REdgeInsets.all(4),
                backgroundColor:
                    selected ? AppColors.primary : Color(0xff3C4856),
              ),
            ),
        ],
      ),
    );
  }
}
