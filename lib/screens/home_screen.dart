// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/home_screen_provider.dart';
import 'components/bottom_nav_bar.dart';
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
        bottomNavigationBar: BottomNavBar(),
      );
    });
  }
}
