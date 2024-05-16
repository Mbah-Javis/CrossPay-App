import 'package:get/get.dart';
import 'package:crosspay/utils/c_p_alerts.dart';
import 'package:flutter/material.dart';
import 'package:crosspay/widgets/c_p_available_countries.dart';

import 'state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();

  void onNotificationsClicked() {}

  void onSendMoneyClicked(BuildContext context) {
    CPAlerts().showBottomSheet(context, 'Send Money To',
        CPAvailableCountries(isSendingMoney: true), true);
  }

  void onBuyAirtimeClicked(BuildContext context) {
    //CPAlerts().showInfo('Coming Soon', 'Buying airtime is not yet available');

    CPAlerts().showBottomSheet(context, 'Buy Airtime',
        CPAvailableCountries(isSendingMoney: false), true);
  }
}
