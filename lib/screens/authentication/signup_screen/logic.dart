import 'package:get/get.dart';
import 'package:crosspay/screens/home/home_screen/view.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';

import 'state.dart';

class SignupScreenLogic extends GetxController {
  final SignupScreenState state = SignupScreenState();

  void onContinueClick() {
    CrossPayNavigator()
        .goOffAll(HomeScreenPage(), Transition.rightToLeftWithFade);
  }
}
