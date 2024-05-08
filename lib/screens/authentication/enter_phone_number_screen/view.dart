import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/widgets/buttons/c_p_back_button.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/c_p_rounded_container.dart';
import 'package:crosspay/widgets/buttons/cross_pay_button.dart';
import 'package:crosspay/widgets/c_p_onboarding_heading.dart';
import 'package:crosspay/widgets/input_fields/c_p_phone_input_field.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:crosspay/generated/assets.dart';

import 'logic.dart';
import 'state.dart';

class EnterPhoneNumberScreenPage extends StatelessWidget {
  EnterPhoneNumberScreenPage({Key? key}) : super(key: key);

  final logic = Get.put(EnterPhoneNumberScreenLogic());
  final state = Get.find<EnterPhoneNumberScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AnnotatedSystemUI(
        child: Scaffold(
      body: Container(
        padding: CPSpacer().screenPadding().copyWith(top: 50, bottom: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(Assets.imagesAfricanBg2))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _heading(context),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: CPRoundedContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CPSpacer().heightSmall(),
                    _enterPhoneNumber(context),
                    CPSpacer().heightSmall(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: _continueButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }

  Widget _heading(BuildContext context) {
    return CPOnboardingHeading(title: 'Phone Number');
  }

  Widget _enterPhoneNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your phone number',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CPSpacer().heightMedium(),
        CPPhoneInputField(
            countryList: state.cList,
            phoneController: state.phoneNumberController.value,
            onChanged: (phone) {
              logic.updateCountryCode(phone.countryISOCode);
              logic.updatePhoneCode(phone.countryCode);
            },
            onCountryChanged: (country) {}),
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
