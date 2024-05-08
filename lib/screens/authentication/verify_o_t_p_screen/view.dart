import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/widgets/c_p_background.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/widgets/c_p_rounded_container.dart';
import 'package:crosspay/widgets/buttons/cross_pay_button.dart';
import 'package:crosspay/widgets/buttons/c_p_back_button.dart';
import 'package:crosspay/widgets/c_p_loading_widget.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/input_fields/c_pin_input_field.dart';
import 'package:crosspay/widgets/c_p_onboarding_heading.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:crosspay/generated/assets.dart';

import 'logic.dart';

class VerifyOTPScreenPage extends StatelessWidget {
  VerifyOTPScreenPage({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  final logic = Get.put(VerifyOTPScreenLogic());
  final state = Get.find<VerifyOTPScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedSystemUI(
        child: Scaffold(
      body: CPBackground(
        assetName: Assets.imagesAfricanBg3,
        child: Padding(
          padding: CPSpacer().screenPadding().copyWith(top: 50, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heading(context),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: CPRoundedContainer(
                  child: Column(
                    children: [_enterOTPWidget(context)],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: _continueButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }

  Widget _heading(BuildContext context) {
    return CPOnboardingHeading(title: 'Verify OTP Code');
  }

  Widget _enterOTPWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter the OTP sent to ${phoneNumber}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CPSpacer().heightMedium(),
        CPPinInputField(
            controller: state.otpController.value,
            focusNode: state.focusNode.value,
            showError: state.showOTPError.value,
            onComplete: (pin) {
              logic.onOTPComplete(pin);
            })
      ],
    );
  }

  Widget _continueButton() {
    return Obx(() {
      return Container(
        margin: CPSpacer().screenPadding().copyWith(bottom: 20),
        child: CrossPayButton(
            title: 'Continue',
            loading: state.continueLoading.value,
            onClick: () {
              logic.onContinueClick();
            }),
      );
    });
  }
}
