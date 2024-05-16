import 'package:crosspay/models/api_response.dart';
import 'package:crosspay/models/crosspay_user.dart';
import 'package:crosspay/models/c_p_country_model.dart';

abstract class ApiRepository {
  Future<String> getIdToken();
  Future<ApiResponse> getUser(String userId);
  Stream<CrossPayUser> getUserLiveData();
  Future<ApiResponse> createUser(dynamic requestData);
  Future<List<CPCountryModel>> getAvailableCountries();
}
