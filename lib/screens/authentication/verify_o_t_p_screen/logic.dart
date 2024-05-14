import 'package:get/get.dart';
import 'package:crosspay/screens/authentication/signup_screen/view.dart';
import 'package:crosspay/screens/home/home_screen/view.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';
import 'package:crosspay/api/remote/firebase_auth_service.dart';
import 'package:crosspay/controllers/user_controller.dart';
import 'package:flutter/material.dart';

import 'state.dart';

class VerifyOTPScreenLogic extends GetxController {
  final VerifyOTPScreenState state = VerifyOTPScreenState();

  void setResendOtpToken(String verificationId, int? token) {
    stopLoading();
    state.verificationId.value = verificationId;
    state.forceResendOtpToken.value = token!;
  }

  void setUserInfo(String phoneNumber, String countryCode, String country) {
    state.phoneNumber.value = int.parse(phoneNumber);
    state.countryCode.value = int.parse(countryCode);
    state.country.value = country;
  }

  void onContinueClick() {
    verifyOTPCode(state.otpController.value.text.trim());
  }

  void onOTPComplete(String code) {
    verifyOTPCode(code);
  }

  void verifyOTPCode(String code) {
    updateLoadingState(true);
    FirebaseAuthService().verifyOTPCode(code, state.verificationId.value);
  }

  void resendOTP(String phoneNumber) {
    updateLoadingState(true);
    FirebaseAuthService().getVerificationCode(
        phoneNumber, state.forceResendOtpToken.value, true);
  }

  void updateLoadingState(bool loading) {
    state.continueLoading.value = loading;
  }

  void stopLoading() {
    state.continueLoading.value = false;
  }

  void showSuccessMessage(String message) {
    Get.snackbar('Verification', message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white);
  }

  Future<bool> checkExistingUser(String userId) async {
    var userController = Get.put(UserController());
    var response = await userController.getUser(userId);
    return response.statusCode == 404 ? true : false;
  }

  void gotoHome() {
    stopLoading();
    CrossPayNavigator().goOffAll(HomeScreenPage(), Transition.rightToLeft);
  }

  void gotoSignup() {
    stopLoading();
    CrossPayNavigator().goTo(
        SignupScreenPage(
          phoneNumber: state.phoneNumber.value,
          countryCode: state.countryCode.value,
          country: state.country.value,
        ),
        Transition.rightToLeft);
  }
}
