import 'package:flutter/material.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';

class CPBackButton extends StatelessWidget {
  const CPBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CrossPayNavigator().goBack();
      },
      child: Container(
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(100)),
        padding: const EdgeInsets.all(8),
        child: const Icon(Icons.arrow_back_rounded, color: kBlackColor),
      ),
    );
  }
}
