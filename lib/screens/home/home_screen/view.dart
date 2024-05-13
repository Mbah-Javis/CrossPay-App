import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/widgets/c_p_background.dart';
import 'package:crosspay/generated/assets.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:draggable_home/draggable_home.dart';

import 'logic.dart';

class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  final logic = Get.put(HomeScreenLogic());
  final state = Get.find<HomeScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedSystemUI(
        child: DraggableHome(
      leading: const Icon(Icons.person_2_rounded),
      title: const Text(
        "CrossPay",
        style: TextStyle(color: kWhiteColor),
      ),
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.notifications_rounded)),
      ],
      headerWidget: _homeHeading(context),
      alwaysShowLeadingAndAction: true,
      body: [],
      fullyStretchable: true,
      expandedBody: _homeHeading(context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBarColor: kPrimaryColor,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 0),
        child: DotNavigationBar(
          marginR: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.18),
          margin: EdgeInsets.zero,
          paddingR: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
          selectedItemColor: Colors.deepOrangeAccent,
          unselectedItemColor: kPrimaryColor,
          splashBorderRadius: 30,
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).splashColor,
                offset: Offset(0, 6),
                blurRadius: 6)
          ],
          currentIndex: 0,
          backgroundColor: kWhiteColor,
          onTap: (index) {},
          // dotIndicatorColor: Colors.black,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite_border),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _homeHeading(BuildContext context) {
    return Container(
      height: 250,
      child: CPBackground(
        assetName: Assets.imagesAfricanBg4,
        fit: BoxFit.cover,
        child: Container(
          color: kPrimaryColor.withOpacity(0.7),
          padding: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Text(
                'Javis',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: kWhiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
