import 'package:get/get.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:crosspay/utils/c_p_spacer.dart';

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
        backgroundColor: kLightBlueColor,
        duration: const Duration(seconds: 5));
  }

  showBottomSheet(
      BuildContext context, String title, Widget content, bool isDismissible) {
    return showModalBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        isScrollControlled: true,
        showDragHandle: true,
        isDismissible: isDismissible,
        elevation: 4,
        context: context,
        builder: (ctx) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleSmall),
                CPSpacer().heightMedium(),
                content
              ],
            ),
          );
        });
  }
}
