import 'package:get/get.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:flutter/material.dart';

class CPAlerts {
  SnackbarController showSuccess(String title, String message) {
    return Get.snackbar(title, message,
        colorText: kWhiteColor,
        backgroundColor: kGreenColor,
        duration: const Duration(seconds: 5));
  }

  SnackbarController showError(String title, String message) {
    return Get.snackbar(title, message,
        colorText: kWhiteColor,
        backgroundColor: kErrorColor,
        duration: const Duration(seconds: 5));
  }

  SnackbarController showWarning(String title, String message) {
    return Get.snackbar(title, message,
        colorText: kWhiteColor,
        backgroundColor: kWarningColor,
        duration: const Duration(seconds: 5));
  }

  SnackbarController showInfo(String title, String message) {
    return Get.snackbar(title, message,
        colorText: kWhiteColor,
        backgroundColor: kPrimaryColor,
        duration: const Duration(seconds: 5));
  }
}
