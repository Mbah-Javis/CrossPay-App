import 'package:get/get.dart';
import 'package:crosspay/api/remote/c_p_api_repository.dart';
import 'package:crosspay/models/api_response.dart';
import 'package:crosspay/models/c_p_country_model.dart';
import 'package:crosspay/utils/c_p_alerts.dart';

class MobileMoneyController extends GetxController {
  CPApiRepository apiRepository = CPApiRepository();

  Future<List<CPCountryModel>> getAvailableCountries() async {
    return await apiRepository.getAvailableCountries();
  }

  void onOptionSelected(
      CPCountryModel country, PaymentOption option, bool sendingMoney) {
    if (sendingMoney) {
      moneyTransfer(country, option);
    } else {
      buyAirtime(country, option);
    }
  }

  void moneyTransfer(CPCountryModel country, PaymentOption option) {
    print('Sending money');
  }

  void buyAirtime(CPCountryModel country, PaymentOption option) {
    CPAlerts().showInfo('Coming Soon', 'Buying airtime is not yet available');
  }
}
