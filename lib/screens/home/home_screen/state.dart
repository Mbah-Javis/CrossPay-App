import 'package:crosspay/models/crosspay_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_page/view.dart';
import 'favorites_page/view.dart';
import 'profile_page/view.dart';
import 'package:dot_navigation_bar/src/DotNavigationBarItem.dart';

class HomeScreenState {
  HomeScreenState() {}

  List<DotNavigationBarItem> navItems = [
    DotNavigationBarItem(
      icon: Icon(Icons.home_rounded),
    ),
    DotNavigationBarItem(
      icon: Icon(Icons.favorite_rounded),
    ),
    DotNavigationBarItem(
      icon: Icon(Icons.person),
    ),
  ];

  List<Widget> pages = [HomePagePage(), FavoritesPagePage(), ProfilePagePage()];

  RxInt selectedPage = 0.obs;
}
