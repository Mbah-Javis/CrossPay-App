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

class HomePagePage extends StatelessWidget {
  HomePagePage({Key? key}) : super(key: key);

  final logic = Get.put(HomePageLogic());
  final state = Get.find<HomePageLogic>().state;
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
