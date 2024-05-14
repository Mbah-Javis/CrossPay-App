import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:crosspay/screens/authentication/verify_o_t_p_screen/view.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';
import 'package:crosspay/api/remote/c_p_api_repository.dart';
import 'package:crosspay/api/remote/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'state.dart';

class EnterPhoneNumberScreenLogic extends GetxController {
  final EnterPhoneNumberScreenState state = EnterPhoneNumberScreenState();

  void onContinueClick() {
    updateLoadingState(true);
    String phoneNumber =
        '${state.countryCode.value} ${state.phoneNumberController.value.text}';
    FirebaseAuthService().getVerificationCode(phoneNumber, null, false);
  }

  void updateLoadingState(bool loading) {
    state.continueLoading.value = loading;
  }

  void stopLoading() {
    state.continueLoading.value = false;
  }

  void updateCountry(String code) {
    state.country.value = code;
  }

  void updateCountryCode(String code) {
    state.countryCode.value = code;
  }

  void verificationCodeSent(String verificationId, int? forceResendingToken) {
    updateLoadingState(false);
    gotoVerifyOTP(verificationId, forceResendingToken);
  }

  void verificationCompleted(PhoneAuthCredential credential) {
    FirebaseAuthService().signIn(credential, false);
  }

  void verificationFailed(FirebaseAuthException e) {
    showErrorMessage(e.code);
  }

  void showErrorMessage(String message) {
    updateLoadingState(false);
    Get.snackbar('Verification Error', message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.deepOrange,
        colorText: Colors.white);
  }

  void gotoVerifyOTP(String verificationId, int? forceResendingToken) {
    String phoneNumber = '${state.phoneNumberController.value.text}';
    String countryCode = '${state.countryCode.value}';
    CrossPayNavigator().goTo(
        VerifyOTPScreenPage(
          phoneNumber: phoneNumber,
          countryCode: countryCode,
          verificationId: verificationId,
          resendOtpToken: forceResendingToken,
        ),
        Transition.rightToLeft);
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
