import 'package:get/get.dart';
import 'package:crosspay/utils/c_p_alerts.dart';
import 'package:flutter/material.dart';
import 'package:crosspay/widgets/c_p_available_countries.dart';

import 'state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();

  void onNotificationsClicked() {}

  void onSendMoneyClicked(BuildContext context) {
    showCountriesList(context, 'Send Money To');
  }

  void onBuyAirtimeClicked(BuildContext context) {
    //CPAlerts().showInfo('Coming Soon', 'Buying airtime is not yet available');
    showCountriesList(context, 'Buy Airtime');
  }

  void showCountriesList(BuildContext context, String title) async {
    CPAlerts().showBottomSheet(
        context, title, CPAvailableCountries(isSendingMoney: true), true);
  }
}
