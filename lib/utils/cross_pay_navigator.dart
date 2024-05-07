import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CrossPayNavigator {
  void goTo(Widget page, Transition transition) {
    Get.to(() => page, transition: transition);
  }

  void goBack() {
    Get.back();
  }

  // Navigate with no option to go back
  void goOff(Widget page, Transition transition) {
    Get.off(() => page, transition: transition);
  }

  // Navigate and cancel all previous routes
  void goOffAll(Widget page, Transition transition) {
    Get.offAll(() => page, transition: transition);
  }
}
