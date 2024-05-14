import 'package:crosspay/models/api_response.dart';

abstract class ApiRepository {
  Future<String> getIdToken();
  Future<ApiResponse> getUser(String userId);
}
