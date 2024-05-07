import 'package:get/get.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';
import 'package:crosspay/screens/authentication/enter_phone_number_screen/view.dart';

import 'state.dart';

class WelcomeScreenLogic extends GetxController {
  final WelcomeScreenState state = WelcomeScreenState();

  void onGetStartedClick() {
    CrossPayNavigator()
        .goTo(EnterPhoneNumberScreenPage(), Transition.rightToLeft);
  }
}
