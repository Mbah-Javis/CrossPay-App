import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/widgets/c_p_background.dart';
import 'package:crosspay/generated/assets.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:crosspay/controllers/user_controller.dart';
import 'package:crosspay/generated/assets.dart';
import 'package:crosspay/widgets/buttons/c_p_send_button.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:crosspay/widgets/text/c_p_money_widget.dart';
import 'package:crosspay/widgets/c_p_transaction_widget.dart';
import 'package:crosspay/controllers/mobile_money_controller.dart';

import 'logic.dart';

class HomePagePage extends StatelessWidget {
  HomePagePage({Key? key}) : super(key: key);

  final logic = Get.put(HomePageLogic());
  final state = Get.find<HomePageLogic>().state;
  var userController = Get.put(UserController());
  var mobileMoneyController = Get.put(MobileMoneyController());

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
              onTap: () {
                logic.onNotificationsClicked();
              },
              child: const Icon(
                Icons.notifications_rounded,
                color: kPrimaryColor,
              ),
            )),
      ],
      headerWidget: _homeHeading(context),
      alwaysShowLeadingAndAction: true,
      body: [_buildTransactions(context), CPSpacer().height(100)],
      fullyStretchable: true,
      expandedBody: _homeHeading(context),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBarColor: kPrimaryColor,
    ));
  }

  Widget _homeHeading(BuildContext context) {
    return Container(
      child: CPBackground(
        assetName: Assets.imagesAfricanBg4,
        fit: BoxFit.cover,
        child: StreamBuilder(
            stream: userController.getUserLiveData(),
            builder: (context, snapshot) {
              var user = snapshot.data;
              return Container(
                color: kPrimaryColor.withOpacity(0.8),
                padding: EdgeInsets.only(top: 45),
                child: Column(
                  children: [
                    Text(
                      '${user?.firstName} ${user?.lastName}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: kWhiteColor),
                    ),
                    CPSpacer().height(40),
                    CPMoneyWidget(
                        amount: user?.transactions?.totalAmount!,
                        currency: user?.subAccount?.defaultCurrency!,
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(
                                color: kWhiteColor,
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                    CPSpacer().heightSmall(),
                    Text(
                      'Total money sent',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kInputBgColor.withOpacity(0.6)),
                    ),
                    CPSpacer().height(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CPSendButton(
                            title: 'Send money',
                            backgroundColor: kLightOrangeColor,
                            icon: Icon(
                              CupertinoIcons.arrow_up_right_circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            onClick: () {
                              logic.onSendMoneyClicked(context);
                            }),
                        CPSendButton(
                            title: 'Buy airtime',
                            backgroundColor: kLightOrangeColor,
                            icon: Icon(CupertinoIcons.arrow_2_circlepath_circle,
                                color: Theme.of(context).primaryColor),
                            onClick: () {
                              logic.onBuyAirtimeClicked(context);
                            })
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget _buildTransactions(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Transactions',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Text(
                  'See all',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            CPSpacer().heightSmall(),
            StreamBuilder(
                stream: mobileMoneyController.getUserTransactions(),
                builder: (context, snapshot) {
                  return snapshot.data != null
                      ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return CPTransactionWidget(
                                transaction: snapshot.data![index]);
                          })
                      : Container();
                }),
          ],
        ));
  }
}
