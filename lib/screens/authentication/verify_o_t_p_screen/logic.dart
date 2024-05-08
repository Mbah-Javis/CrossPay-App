import 'package:get/get.dart';

import 'state.dart';

class VerifyOTPScreenLogic extends GetxController {
  final VerifyOTPScreenState state = VerifyOTPScreenState();

  void onContinueClick() {
    verifyOTPCode(state.otpController.value.text.trim());
    /*CrossPayNavigator().goTo(
        SignupScreenPage(),
        Transition.rightToLeftWithFade);*/
  }

  void onOTPComplete(String code) {
    verifyOTPCode(code);
  }

  void verifyOTPCode(String code) async {
    // state.continueLoading.value = true;
    print(code);
  }
}
