import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/buttons/cross_pay_button.dart';
import 'package:crosspay/widgets/c_p_onboarding_heading.dart';
import 'package:crosspay/widgets/c_p_rounded_container.dart';
import 'package:crosspay/widgets/c_p_background.dart';
import 'package:crosspay/generated/assets.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:crosspay/widgets/input_fields/c_p_input_text_field.dart';

import 'logic.dart';

class SignupScreenPage extends StatelessWidget {
  SignupScreenPage(
      {Key? key,
      required this.phoneNumber,
      required this.countryCode,
      required this.country})
      : super(key: key);

  final int phoneNumber;
  final int countryCode;
  final String country;

  final logic = Get.put(SignupScreenLogic());
  final state = Get.find<SignupScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedSystemUI(
        child: Scaffold(
      body: CPBackground(
        assetName: Assets.imagesAfricanBg2,
        child: Container(
          padding: CPSpacer().screenPadding().copyWith(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _heading(),
              CPSpacer().height(40),
              _enterAccountDetails(context)
            ],
          ),
        ),
      ),
      floatingActionButton: _continueButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }

  Widget _heading() {
    return CPOnboardingHeading(title: 'Account Details');
  }

  Widget _enterAccountDetails(BuildContext context) {
    return CPRoundedContainer(
        child: Form(
            key: state.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'First name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CPSpacer().heightSmall(),
                CPInputTextField(
                  hint: 'Your first name',
                  controller: state.firstNameController.value,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {},
                ),
                CPSpacer().heightMedium(),
                Text(
                  'Last name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CPSpacer().heightSmall(),
                CPInputTextField(
                  hint: 'Your last name',
                  controller: state.lastNameController.value,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    logic.onContinueClick(phoneNumber, countryCode, country);
                  },
                ),
                CPSpacer().heightMedium(),
                Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                CPSpacer().heightSmall(),
                CPInputTextField(
                  hint: 'Your email',
                  controller: state.emailController.value,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    logic.onContinueClick(phoneNumber, countryCode, country);
                  },
                ),
              ],
            )));
  }

  Widget _continueButton() {
    return Obx(() {
      return Container(
        margin: CPSpacer().screenPadding().copyWith(bottom: 20),
        child: CrossPayButton(
            title: 'Continue',
            loading: state.continueLoading.value,
            onClick: () {
              logic.onContinueClick(phoneNumber, countryCode, country);
            }),
      );
    });
  }
}
