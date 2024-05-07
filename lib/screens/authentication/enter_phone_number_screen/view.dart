import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/widgets/buttons/c_p_back_button.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/c_p_rounded_container.dart';
import 'package:crosspay/widgets/buttons/cross_pay_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';

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
        padding: EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/african_bg_2.png'))),
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
                    SizedBox(
                      height: 10,
                    ),
                    _enterPhoneNumber(context),
                    SizedBox(
                      height: 10,
                    ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CPBackButton(),
        SizedBox(
          height: 30,
        ),
        Text(
          'Phone Number',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
      ],
    );
  }

  Widget _enterPhoneNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter your phone number',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: IntlPhoneField(
            disableAutoFillHints: true,
            style: _defaultTextStyle(context, kNeutralColor),
            countries: state.cList,
            dropdownTextStyle: _defaultTextStyle(context, kNeutralColor),
            pickerDialogStyle: PickerDialogStyle(
              backgroundColor: kWhiteColor,
              countryCodeStyle: _defaultTextStyle(context, kNeutralColor50),
              listTilePadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              listTileDivider: Container(),
              countryNameStyle: _defaultTextStyle(context, kNeutralColor),
            ),
            dropdownIcon: const Icon(
              Icons.arrow_drop_down_rounded,
              size: 26,
              color: kNeutralColor50,
            ),
            cursorColor: kPrimaryColor,
            controller: state.phoneNumberController.value,
            onChanged: (phone) {
              logic.updateCountryCode(phone.countryISOCode);
              logic.updatePhoneCode(phone.countryCode);
            },
            onCountryChanged: (country) {},
            decoration: InputDecoration(
                hintText: 'Phone number',
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(16)),
                fillColor: kInputBgColor,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                helperStyle: _defaultTextStyle(context, kNeutralColor50),
                hintStyle: _defaultTextStyle(context, kNeutralColor50)),
          ),
        )
      ],
    );
  }

  Widget _continueButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: CrossPayButton(
          title: 'Continue',
          onClick: () {
            logic.onContinueClick();
          }),
    );
  }

  TextStyle _defaultTextStyle(BuildContext context, Color color) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(color: color);
  }
}
