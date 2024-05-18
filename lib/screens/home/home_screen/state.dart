import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page/view.dart';
import 'favorites_page/view.dart';
import 'profile_page/view.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class HomeScreenState {
  HomeScreenState() {}

  List<DotNavigationBarItem> navItems = [
    DotNavigationBarItem(
      icon: const Icon(Icons.home_rounded),
    ),
    DotNavigationBarItem(
      icon: const Icon(Icons.favorite_rounded),
    ),
    DotNavigationBarItem(
      icon: const Icon(Icons.person),
    ),
  ];

  List<Widget> pages = [HomePagePage(), FavoritesPagePage(), ProfilePagePage()];

  RxInt selectedPage = 0.obs;
}
