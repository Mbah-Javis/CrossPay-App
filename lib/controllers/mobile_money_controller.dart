import 'package:get/get.dart';
import 'package:crosspay/api/remote/c_p_api_repository.dart';
import 'package:crosspay/models/api_response.dart';
import 'package:crosspay/models/c_p_country_model.dart';

class MobileMoneyController extends GetxController {
  CPApiRepository apiRepository = CPApiRepository();

  Future<List<CPCountryModel>> getAvailableCountries() async {
    return await apiRepository.getAvailableCountries();
  }

  void onOptionSelected(CPCountryModel country, PaymentOption option) {
    print(option.name);
  }
}
