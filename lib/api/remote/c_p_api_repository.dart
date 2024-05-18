import 'package:crosspay/models/api_response.dart';
import 'package:crosspay/api/remote/api_repository.dart';
import 'package:crosspay/api/remote/c_p_api_client.dart';
import 'package:crosspay/models/crosspay_user.dart';
import 'package:crosspay/models/c_p_country_model.dart';
import 'package:crosspay/models/c_p_transaction.dart';

class CPApiRepository implements ApiRepository {
  final CPApiClient _apiClient = CPApiClient();

  CPApiRepository();

  @override
  Future<String> getIdToken() {
    return _apiClient.getIdToken();
  }

  @override
  Future<ApiResponse> getUser(String userId) {
    return _apiClient.getUser(userId);
  }

  @override
  Stream<CrossPayUser> getUserLiveData() {
    return _apiClient.getUserLiveData();
  }

  @override
  Future<ApiResponse> createUser(dynamic requestData) {
    return _apiClient.createUser(requestData);
  }

  @override
  Future<ApiResponse> initiateTransfer(dynamic requestData) {
    return _apiClient.initiateTransfer(requestData);
  }

  @override
  Future<List<CPCountryModel>> getAvailableCountries() {
    return _apiClient.getAvailableCountries();
  }

  @override
  Stream<List<CPTransaction>> getUserTransactions() {
    return _apiClient.getUserTransactions();
  }
}
