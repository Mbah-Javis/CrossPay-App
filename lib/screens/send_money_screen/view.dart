import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/theme/annotated_system_ui.dart';
import 'package:crosspay/models/c_p_country_model.dart';
import 'package:crosspay/widgets/c_p_onboarding_heading.dart';
import 'package:crosspay/utils/c_p_spacer.dart';
import 'package:crosspay/theme/colors.dart';
import 'package:crosspay/widgets/buttons/cross_pay_button.dart';
import 'package:crosspay/widgets/input_fields/c_p_input_text_field.dart';
import 'package:crosspay/widgets/c_p_rounded_container.dart';
import 'package:crosspay/widgets/c_p_image.dart';
import 'package:crosspay/utils/utils.dart';

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
      backgroundColor: kLightOrangeColor,
      body: SingleChildScrollView(
        padding: CPSpacer().screenPadding(),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CPSpacer().height(40),
            CPOnboardingHeading(title: 'Send Money'),
            CPSpacer().height(20),
            _enterTransactionDetails(context),
            CPSpacer().height(100),
          ],
        ),
      ),
      floatingActionButton: _sendMoneyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }

  Widget _enterTransactionDetails(BuildContext context) {
    return CPRoundedContainer(
        child: Form(
            key: state.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Amount',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CPSpacer().heightSmall(),
                CPInputTextField(
                  hint: '1000',
                  suffixIcon: Text(
                      '${country.currency} ${getCountryFlag(country.country!)}'),
                  controller: state.amountController.value,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter amount';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    logic.updateReceiveAmount(value);
                  },
                  onFieldSubmitted: (value) {},
                ),
                CPSpacer().heightMedium(),
                Text(
                  'Receiver gets',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CPSpacer().heightSmall(),
                Obx(() {
                  return CPInputTextField(
                    hint: '1000',
                    icon: CPImage(
                      imageUrl: '${option.logo}',
                      height: 25,
                      width: 25,
                    ),
                    suffixIcon: Text(
                        '${country.currency} ${getCountryFlag(country.country!)}'),
                    controller: state.receiveAmountController.value,
                    readOnly: true,
                    onFieldSubmitted: (value) {},
                  );
                }),
                CPSpacer().heightMedium(),
                Text(
                  'Sender Number',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CPSpacer().heightSmall(),
                CPInputTextField(
                  hint: '677700000',
                  maxLength: getCountryPhoneLength('${country.country!}'),
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('+${country.countryCode}'),
                      CPSpacer().width(5),
                      CPImage(
                        imageUrl: '${country.flag}',
                        height: 20,
                        width: 20,
                      )
                    ],
                  ),
                  controller: state.senderNumberController.value,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    int maxLength =
                        getCountryPhoneLength('${country.country!}');
                    if (value != null && value!.length != maxLength) {
                      return 'Invalid phone number';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {},
                ),
                CPSpacer().heightMedium(),
                Text(
                  'Receiver Number',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CPSpacer().heightSmall(),
                CPInputTextField(
                  hint: '677700000',
                  maxLength: getCountryPhoneLength('${country.country!}'),
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('+${country.countryCode}'),
                      CPSpacer().width(5),
                      CPImage(
                        imageUrl: '${country.flag}',
                        height: 20,
                        width: 20,
                      )
                    ],
                  ),
                  controller: state.receiverNumberController.value,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    int maxLength =
                        getCountryPhoneLength('${country.country!}');
                    if (value != null && value!.length != maxLength) {
                      return 'Invalid phone number';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {},
                ),
                CPSpacer().heightMedium(),
                Text(
                  'Receiver Name',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                CPSpacer().heightSmall(),
                CPInputTextField(
                  hint: 'John Mary',
                  controller: state.receiverNameController.value,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter receiver name';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    // logic.onContinueClick(phoneNumber, countryCode, country);
                  },
                ),
              ],
            )));
  }

  Widget _sendMoneyButton() {
    return Obx(() {
      return Container(
        margin: CPSpacer().screenPadding().copyWith(bottom: 20),
        child: CrossPayButton(
            title: 'Send money',
            loading: state.sendMoneyLoading.value,
            onClick: () {
              logic.onSendMoneyClicked(country, option);
            }),
      );
    });
  }
}
