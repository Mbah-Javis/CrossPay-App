import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/buttons/cross_pay_button.dart';

import 'logic.dart';
import 'state.dart';

class WelcomeScreenPage extends StatelessWidget {
  WelcomeScreenPage({Key? key}) : super(key: key);

  final logic = Get.put(WelcomeScreenLogic());
  final state = Get.find<WelcomeScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedSystemUI(
        child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/african_bg.png',
                ))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              padding:
                  EdgeInsets.only(left: 18, right: 18, bottom: 60, top: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Welcome to',
                          style: Theme.of(context).textTheme.titleSmall),
                      SizedBox(
                        width: 8,
                      ),
                      Text('CrossPay',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 45, color: kPrimaryColor)),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text('Worry less and send money to any mobile money account!',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: kNeutralColor50)),
                  SizedBox(
                    height: 20,
                  ),
                  CrossPayButton(
                      title: 'Get Started',
                      onClick: () {
                        logic.onGetStartedClick();
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
