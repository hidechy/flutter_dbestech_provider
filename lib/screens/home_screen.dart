// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

import '../controllers/home_screen_provider.dart';
import 'components/bottom_nav.dart';
import 'pages/add_page.dart';
import 'pages/cart_page.dart';
import 'pages/home_page.dart';
import 'pages/person_page.dart';
import 'pages/search_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const AddPage(),
    const CartPage(),
    const PersonPage(),
  ];

  ///
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(builder: (context, homeScreenController, child) {
      return Scaffold(
        backgroundColor: const Color(0xffe2e2e2),
        body: pageList[homeScreenController.pageIndex],
        bottomNavigationBar: SafeArea(
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
                      icon: MaterialCommunityIcons.home),
                  BottomNav(
                      onTap: () {
                        homeScreenController.pageIndex = 1;
                      },
                      icon: Ionicons.search),
                  BottomNav(
                      onTap: () {
                        homeScreenController.pageIndex = 2;
                      },
                      icon: Ionicons.add),
                  BottomNav(
                      onTap: () {
                        homeScreenController.pageIndex = 3;
                      },
                      icon: Ionicons.cart),
                  BottomNav(
                      onTap: () {
                        homeScreenController.pageIndex = 4;
                      },
                      icon: Ionicons.person),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
