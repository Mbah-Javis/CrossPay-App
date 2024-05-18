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
        const CPAvailableCountries(isSendingMoney: true), true);
  }

  void onBuyAirtimeClicked(BuildContext context) {
    CPAlerts().showBottomSheet(context, 'Buy Airtime',
        const CPAvailableCountries(isSendingMoney: false), true);
  }

  void showCountriesList(BuildContext context, String title) {
    CPAlerts().showBottomSheet(
        context, title, const CPAvailableCountries(isSendingMoney: true), true);
  }
}
