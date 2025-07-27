import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_cubit.dart';
import 'package:rfaye3/generated/l10n.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:svg_flutter/svg.dart';

class CustomButtomNavBar extends StatefulWidget {
  final ValueChanged<int> onTap;
  const CustomButtomNavBar({super.key, required this.onTap});

  @override
  State<CustomButtomNavBar> createState() => _CustomButtomNavBarState();
}

class _CustomButtomNavBarState extends State<CustomButtomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Theme.of(context).navigationBarTheme.backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(29, 0, 0, 0),
            blurRadius: 7,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SalomonBottomBar(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        unselectedItemColor: const Color(0xff4E5556),
        selectedItemColor: AppColors.primaryColor,
        itemPadding:
            Localizations.localeOf(context).languageCode == 'ar'
                ? const EdgeInsets.only(top: 0, left: 15)
                : const EdgeInsets.only(top: 0, right: 15),

        currentIndex: _currentIndex,
        onTap: (i) {
          _currentIndex = i;
          widget.onTap(i);
          setState(() {});
        },
        items: [
          navBarItem(
            title: S.of(context).home,
            inActiveIcon: Assets.imagesVuesaxOutlineHome,
            activeIcon: Assets.imagesVuesaxBoldHome,
          ),
          navBarItem(
            title: S.of(context).categories,
            inActiveIcon: Assets.imagesVuesaxOutlineProducts,
            activeIcon: Assets.imagesVuesaxBoldProducts,
          ),
          navBarItem(
            title: S.of(context).cart,
            inActiveIcon: Assets.imagesVuesaxOutlineShoppingCart,
            activeIcon: Assets.imagesVuesaxBoldShoppingCart,
          ),
          navBarItem(
            title: S.of(context).profile,
            inActiveIcon: Assets.imagesVuesaxOutlineUser,
            activeIcon: Assets.imagesVuesaxBoldUser,
          ),
        ],
      ),
    );
  }

  SalomonBottomBarItem navBarItem({
    required String title,
    required String inActiveIcon,
    required String activeIcon,
  }) {
    final isCart = title == S.of(context).cart;
    final cartCount = context.watch<CartCubit>().totalCount;

    return SalomonBottomBarItem(
      icon: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width *.1,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (isCart && cartCount > 0)
              Positioned(
                right: 0,
                top: 5,
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 9,
                  child: Text(
                    cartCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            Center(child: SvgPicture.asset(inActiveIcon, height: 22)),
          ],
        ),
      ),
      activeIcon: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        radius: 20,
        child: SvgPicture.asset(activeIcon, height: 22),
      ),
      title: Text("   $title"),
    );
  }
}
