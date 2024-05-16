import 'package:get/get.dart';
import 'package:crosspay/controllers/mobile_money_controller.dart';
import 'package:crosspay/models/c_p_country_model.dart';
import 'package:crosspay/utils/c_p_alerts.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';

import 'state.dart';

class SendMoneyScreenLogic extends GetxController {
  final SendMoneyScreenState state = SendMoneyScreenState();

  void onSendMoneyClicked(CPCountryModel country, PaymentOption option) async {
    final form = state.formKey.currentState;
    if (form!.validate()) {
      updateLoadingState(true);
      var mobileMoneyController = Get.put(MobileMoneyController());
      var response = await mobileMoneyController.initiateTransfer(
          int.parse(state.amountController.value.text.trim()),
          int.parse(state.receiveAmountController.value.text.trim()),
          int.parse(state.senderNumberController.value.text.trim()),
          int.parse(state.receiverNumberController.value.text.trim()),
          state.receiverNameController.value.text.trim(),
          country,
          option);
      updateLoadingState(false);
      if (response.successful) {
        CPAlerts().showSuccess('Transaction initiated',
            'Proceed to enter your pin and complete the transaction');
        clear();
        CrossPayNavigator().goBack();
      } else {
        CPAlerts().showError('Transaction error', response.message);
      }
    }
  }

  void updateLoadingState(bool loading) {
    state.sendMoneyLoading.value = loading;
  }

  void updateReceiveAmount(String amount) {
    state.receiveAmountController.value.text = amount.isNotEmpty
        ? (int.parse(amount) - (int.parse(amount) * (2 / 100)))
            .floor()
            .toString()
        : amount;
  }

  void clear() {
    state.amountController.value.text = '';
    state.receiveAmountController.value.text = '';
    state.receiverNumberController.value.text = '';
    state.receiverNameController.value.text = '';
    state.senderNumberController.value.text = '';
  }
}
