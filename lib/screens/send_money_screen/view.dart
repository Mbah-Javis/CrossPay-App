import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/models/c_p_country_model.dart';
import 'package:crosspay/widgets/c_p_onboarding_heading.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:crosspay/theme/colors.dart';

import 'logic.dart';

class SendMoneyScreenPage extends StatelessWidget {
  SendMoneyScreenPage({Key? key, required this.country, required this.option})
      : super(key: key);

  final CPCountryModel country;
  final PaymentOption option;

  final logic = Get.put(SendMoneyScreenLogic());
  final state = Get.find<SendMoneyScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedSystemUI(
        child: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        padding: CPSpacer().screenPadding(),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CPSpacer().height(40),
            CPOnboardingHeading(title: 'Send Money'),
          ],
        ),
      ),
    ));
  }
}
