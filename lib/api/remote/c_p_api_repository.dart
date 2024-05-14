import 'package:crosspay/models/api_response.dart';
import 'package:crosspay/api/remote/api_repository.dart';
import 'package:crosspay/api/remote/c_p_api_client.dart';

class CPApiRepository implements ApiRepository {
  CPApiClient _apiClient = CPApiClient();

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
  Future<ApiResponse> createUser(dynamic requestData) {
    return _apiClient.createUser(requestData);
  }
}
