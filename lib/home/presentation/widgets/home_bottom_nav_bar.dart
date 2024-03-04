import 'package:drink_shop/core/ui/theme/light_library_theme.dart';
import 'package:drink_shop/core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottomNavBar extends StatefulWidget {

  final Function(int) onChanged;
  int currentIndex;

  HomeBottomNavBar({super.key, required this.onChanged, required this.currentIndex});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: BottomNavigationBar(
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: lightLibraryColors.colorBackgroundBottomNavBar,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/bottom_nav_bar/home.svg"),
            activeIcon: SvgPicture.asset(
              "assets/icons/bottom_nav_bar/home.svg",
              colorFilter: ColorFilter.mode(
                lightLibraryColors.colorAccent,
                BlendMode.srcIn
              )
            ),
            label: labelHome
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/bottom_nav_bar/heart.svg"),
              activeIcon: SvgPicture.asset(
                  "assets/icons/bottom_nav_bar/heart.svg",
                  colorFilter: ColorFilter.mode(
                      lightLibraryColors.colorAccent,
                      BlendMode.srcIn
                  )
              ),
              label: labelFavorite
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/bottom_nav_bar/bag.svg"),
              activeIcon: SvgPicture.asset(
                  "assets/icons/bottom_nav_bar/bag.svg",
                  colorFilter: ColorFilter.mode(
                      lightLibraryColors.colorAccent,
                      BlendMode.srcIn
                  )
              ),
              label: labelBag
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/bottom_nav_bar/profile.svg"),
              activeIcon: SvgPicture.asset(
                  "assets/icons/bottom_nav_bar/profile.svg",
                  colorFilter: ColorFilter.mode(
                      lightLibraryColors.colorAccent,
                      BlendMode.srcIn
                  )
              ),
              label: labelProfile
          ),
        ],
        onTap: widget.onChanged,
      ),
    );
  }
}