import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../../controllers/home_screen_provider.dart';

import 'bottom_nav.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  ///
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(builder: (context, homeScreenController, child) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNav(
                  onTap: () {
                    homeScreenController.pageIndex = 0;
                  },
                  icon: (homeScreenController.pageIndex == 0)
                      ? MaterialCommunityIcons.home
                      : MaterialCommunityIcons.home_circle_outline,
                ),
                BottomNav(
                  onTap: () {
                    homeScreenController.pageIndex = 1;
                  },
                  icon: (homeScreenController.pageIndex == 1) ? Ionicons.search : Ionicons.search_circle_outline,
                ),
                BottomNav(
                  onTap: () {
                    homeScreenController.pageIndex = 2;
                  },
                  icon: (homeScreenController.pageIndex == 2) ? Ionicons.add : Ionicons.add_circle_outline,
                ),
                BottomNav(
                  onTap: () {
                    homeScreenController.pageIndex = 3;
                  },
                  icon: (homeScreenController.pageIndex == 3) ? Ionicons.cart : Ionicons.cart_outline,
                ),
                BottomNav(
                  onTap: () {
                    homeScreenController.pageIndex = 4;
                  },
                  icon: (homeScreenController.pageIndex == 4) ? Ionicons.person : Ionicons.person_circle_outline,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
