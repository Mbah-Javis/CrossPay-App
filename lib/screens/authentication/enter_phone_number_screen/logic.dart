import 'package:get/get.dart';

import 'state.dart';

class EnterPhoneNumberScreenLogic extends GetxController {
  final EnterPhoneNumberScreenState state = EnterPhoneNumberScreenState();

  void onContinueClick() {
    print(state.phoneNumberController.value.text);
    print(state.countryCode.value);
    print(state.phoneCode.value);
  }

  void updateCountryCode(String code) {
    state.countryCode.value = code;
  }

  void updatePhoneCode(String code) {
    state.phoneCode.value = code;
  }
}
