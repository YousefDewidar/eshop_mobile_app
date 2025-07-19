import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/utils/app_colors.dart';
import 'package:rfaye3/core/utils/app_images.dart';
import 'package:rfaye3/features/main/presentation/manager/cart_cubit/cart_cubit.dart';
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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
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
            title: S.of(context).products,
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
    return SalomonBottomBarItem(
      icon: SizedBox(
        height: 40,
        width: 60,
        child: Stack(
          children: [
            if (context.watch<CartCubit>().cartList.isNotEmpty &&
                title == S.of(context).cart)
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 10,
                  child: Text(
                    context.watch<CartCubit>().totalCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            Center(child: SvgPicture.asset(inActiveIcon, height: 25)),
          ],
        ),
      ),
      activeIcon: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        child: SvgPicture.asset(activeIcon),
      ),
      title: Text("   $title"),
    );
  }
}
