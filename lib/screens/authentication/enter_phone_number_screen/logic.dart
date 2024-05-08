import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:crosspay/screens/authentication/verify_o_t_p_screen/view.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';

import 'state.dart';

class EnterPhoneNumberScreenLogic extends GetxController {
  final EnterPhoneNumberScreenState state = EnterPhoneNumberScreenState();

  void onContinueClick() {
    CrossPayNavigator().goTo(
        VerifyOTPScreenPage(
            phoneNumber:
                '${state.phoneCode.value} ${state.phoneNumberController.value.text}'),
        Transition.rightToLeftWithFade);
  }

  void updateCountryCode(String code) {
    state.countryCode.value = code;
  }

  void updatePhoneCode(String code) {
    state.phoneCode.value = code;
  }

  @override
  void dispose() {
    super.dispose();
    clearData();
  }

  void clearData() {
    state.continueLoading.value = false;
  }
}
