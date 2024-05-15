import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/widgets/c_p_background.dart';
import 'package:crosspay/generated/assets.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:crosspay/controllers/user_controller.dart';
import 'package:crosspay/generated/assets.dart';

import 'logic.dart';

class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);

  final logic = Get.put(HomeScreenLogic());
  final state = Get.find<HomeScreenLogic>().state;

  var userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedSystemUI(
        child: DraggableHome(
      leading: Container(
          margin: EdgeInsets.only(left: 10, bottom: 5, top: 3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              Assets.imagesAfricanFaceMasks,
              fit: BoxFit.cover,
            ),
          )),
      title: const Text(
        "CrossPay",
        style: TextStyle(color: kWhiteColor),
      ),
      actions: [
        Container(
            padding: EdgeInsets.all(11),
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                color: kLightOrangeColor,
                borderRadius: BorderRadius.circular(18)),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.notifications_rounded,
                color: kPrimaryColor,
              ),
            )),
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
        child: FutureBuilder(
            future: userController.getLocalUser(),
            builder: (context, snapshot) {
              var user = snapshot.data;
              return Container(
                color: kPrimaryColor.withOpacity(0.7),
                padding: EdgeInsets.only(top: 45),
                child: Column(
                  children: [
                    Text(
                      '${user?.firstName} ${user?.lastName}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: kWhiteColor),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
