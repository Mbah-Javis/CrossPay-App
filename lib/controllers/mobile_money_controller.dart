import 'package:get/get.dart';
import 'package:crosspay/api/remote/c_p_api_repository.dart';
import 'package:crosspay/models/api_response.dart';
import 'package:crosspay/models/c_p_country_model.dart';
import 'package:crosspay/utils/c_p_alerts.dart';
import 'package:crosspay/models/c_p_transaction.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';
import 'package:crosspay/screens/send_money_screen/view.dart';
import 'user_controller.dart';

class MobileMoneyController extends GetxController {
  CPApiRepository apiRepository = CPApiRepository();

  var userController = Get.put(UserController());

  Future<List<CPCountryModel>> getAvailableCountries() async {
    return await apiRepository.getAvailableCountries();
  }

  void onOptionSelected(
      CPCountryModel country, PaymentOption option, bool sendingMoney) {
    if (sendingMoney) {
      gotoSendMoney(country, option);
    } else {
      gotoBuyAirtime(country, option);
    }
  }

  void gotoSendMoney(CPCountryModel country, PaymentOption option) {
    CrossPayNavigator().goBack();
    CrossPayNavigator().goTo(
        SendMoneyScreenPage(country: country, option: option),
        Transition.downToUp);
  }

  void gotoBuyAirtime(CPCountryModel country, PaymentOption option) {
    CPAlerts().showInfo('Coming Soon', 'Buying airtime is not yet available');
  }

  Future<ApiResponse> initiateTransfer(
      int amount,
      int receiveAmount,
      int senderNumber,
      int receiverNumber,
      String receiverName,
      CPCountryModel country,
      PaymentOption option) async {
    var user = await userController.getLocalUser();
    Map<String, dynamic> requestData = {
      "amount": amount,
      "receive_amount": receiveAmount,
      "currency": user?.subAccount?.defaultCurrency,
      "country_code": user?.countryCode,
      "country": user?.country,
      "network": option.network,
      "operator": option.operator,
      "network_name": option.name,
      "sender_number": senderNumber,
      "receiver_currency": country.currency,
      "receiver_country": country.country,
      "receiver_country_code": country.countryCode,
      "receiver_number": receiverNumber,
      "receiver_name": receiverName
    };

    ApiResponse response = await apiRepository.initiateTransfer(requestData);
    return response;
  }

  Stream<List<CPTransaction>> getUserTransactions() {
    var stream = apiRepository.getUserTransactions();
    return stream;
  }
}
