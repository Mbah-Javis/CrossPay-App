import 'package:get/get.dart';
import 'package:crosspay/screens/authentication/signup_screen/view.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';

import 'state.dart';

class VerifyOTPScreenLogic extends GetxController {
  final VerifyOTPScreenState state = VerifyOTPScreenState();

  void onContinueClick() {
    verifyOTPCode(state.otpController.value.text.trim());
  }

  void onOTPComplete(String code) {
    verifyOTPCode(code);
  }

  void verifyOTPCode(String code) async {
    // state.continueLoading.value = true;
    print(code);
    CrossPayNavigator()
        .goTo(SignupScreenPage(), Transition.rightToLeftWithFade);
  }
}
