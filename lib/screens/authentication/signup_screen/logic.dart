import 'package:get/get.dart';
import 'package:crosspay/screens/home/home_screen/view.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';
import 'package:crosspay/models/cross_pay_user.dart';
import 'package:crosspay/api/local/hive_crosspay_user.dart';
import 'package:crosspay/api/local/hive_user_service.dart';

import 'state.dart';

class SignupScreenLogic extends GetxController {
  final SignupScreenState state = SignupScreenState();

  void onContinueClick(int phoneNumber, int countryCode, String country) {
    final form = state.formKey.currentState;
    if (form!.validate()) {
      print('form validated');
    }
    /*CrossPayNavigator()
        .goOffAll(HomeScreenPage(), Transition.rightToLeftWithFade);*/
  }
}
