import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOTPScreenState {
  VerifyOTPScreenState() {}

  RxBool continueLoading = false.obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;
  Rx<FocusNode> focusNode = FocusNode().obs;
  RxBool showOTPError = false.obs;
  RxInt phoneNumber = 0.obs;
  RxInt countryCode = 0.obs;
  RxString country = ''.obs;
  RxString verificationId = ''.obs;
  RxInt forceResendOtpToken = 0.obs;
}
