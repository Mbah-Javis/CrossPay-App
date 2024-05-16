import 'package:get/get.dart';
import 'package:crosspay/utils/c_p_alerts.dart';

import 'state.dart';

class HomePageLogic extends GetxController {
  final HomePageState state = HomePageState();

  void onNotificationsClicked() {}

  void onSendMoneyClicked() {}

  void onBuyAirtimeClicked() {
    CPAlerts().showInfo('Coming Soon', 'Buying airtime is not yet available');
  }
}
