import 'package:get/get.dart';
import 'package:crosspay/screens/home/home_screen/view.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';
import 'package:crosspay/models/crosspay_user.dart';
import 'package:crosspay/api/local/hive_user_service.dart';
import 'package:crosspay/utils/utils.dart';
import 'package:crosspay/controllers/user_controller.dart';
import 'package:crosspay/models/crosspay_user.dart';
import 'package:flutter/material.dart';
import 'package:crosspay/utils/c_p_alerts.dart';

import 'state.dart';

class SignupScreenLogic extends GetxController {
  final SignupScreenState state = SignupScreenState();

  var userController = Get.put(UserController());

  void updateLoadingState(bool loading) {
    state.continueLoading.value = loading;
  }

  void onContinueClick(int phoneNumber, int countryCode, String country) async {
    final form = state.formKey.currentState;
    final deviceInfo = await getDeviceInfo();
    var user = userController.getCurrentUser();
    if (form!.validate()) {
      updateLoadingState(true);
      Map<String, dynamic> requestData = {
        "uid": user!.uid,
        "first_name": state.firstNameController.value.text.trim(),
        "last_name": state.lastNameController.value.text.trim(),
        "phone_number": phoneNumber,
        "email": state.emailController.value.text.toString(),
        "profile_image": null,
        "country": country,
        "contry_code": countryCode,
        "notification_settings": {
          "language": deviceInfo.language,
          "device_info": deviceInfo.toJsonMap(),
          "player_id": deviceInfo.playerId
        }
      };

      var response = await userController.createUser(requestData);
      updateLoadingState(false);
      if (response.successful) {
        CrossPayUser user =
            CrossPayUser.fromJson(response.data['data']['user']);
        form.reset();
        saveUserData(user);
      } else {
        print(response.error);
        CPAlerts().showError('Signup Failed', response.message);
      }
    }
  }

  void saveUserData(CrossPayUser crossPayUser) {
    userController.saveLocalUser(crossPayUser);
    gotoHome();
  }

  void gotoHome() {
    CrossPayNavigator()
        .goOffAll(HomeScreenPage(), Transition.rightToLeftWithFade);
  }
}
