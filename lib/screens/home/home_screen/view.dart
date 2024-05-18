import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:crosspay/theme/colors.dart';

import 'logic.dart';

class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({super.key});

  final logic = Get.put(HomeScreenLogic());
  final state = Get.find<HomeScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedSystemUI(
        child: Scaffold(
            body: Obx(() {
              return IndexedStack(
                index: state.selectedPage.value,
                children: state.pages,
              );
            }),
            extendBody: true,
            bottomNavigationBar: Obx(() {
              return Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: DotNavigationBar(
                  marginR: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.18),
                  margin: EdgeInsets.zero,
                  paddingR:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                  selectedItemColor: Colors.deepOrangeAccent,
                  unselectedItemColor: kPrimaryColor,
                  splashBorderRadius: 30,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).splashColor,
                        offset: const Offset(0, 8),
                        spreadRadius: 8,
                        blurRadius: 6)
                  ],
                  currentIndex: state.selectedPage.value,
                  backgroundColor: kLightWhiteColor,
                  onTap: (index) {
                    logic.selectPage(index);
                  },
                  // dotIndicatorColor: Colors.black,
                  items: state.navItems,
                ),
              );
            })));
  }
}
