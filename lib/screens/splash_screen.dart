import 'package:flutter/material.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/theme/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedSystemUI(
        child: Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text('CrossPay',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: kWhiteColor, fontSize: 28)),
      ),
    ));
  }
}
