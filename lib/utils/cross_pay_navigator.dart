import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CrossPayNavigator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  void goTo(Widget page, Transition transition) {
    Get.to(() => page,
        transition: transition, preventDuplicates: false, popGesture: true);
  }

  void goBack() {
    Get.back();
  }

  // Navigate with no option to go back
  void goOff(Widget page, Transition transition) {
    Get.off(() => page,
        transition: transition, preventDuplicates: false, popGesture: true);
  }

  // Navigate and cancel all previous routes
  void goOffAll(Widget page, Transition transition) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }
}
