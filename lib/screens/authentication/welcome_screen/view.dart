import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/buttons/cross_pay_button.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:crosspay/generated/assets.dart';

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
                  Assets.imagesAfricanBg,
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
              padding: CPSpacer().screenPadding().copyWith(bottom: 40, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Welcome to',
                          style: Theme.of(context).textTheme.titleMedium),
                      CPSpacer().width(8),
                      Text('CrossPay',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.11,
                                  color: kPrimaryColor)),
                    ],
                  ),
                  CPSpacer().height(8),
                  Text('Worry less, send money to any mobile money account!',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: kNeutralColor50)),
                  CPSpacer().height(20),
                  CrossPayButton(
                      title: 'Get Started',
                      loading: false,
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
