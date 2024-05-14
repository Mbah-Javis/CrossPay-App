import 'package:get/get.dart';
import 'package:crosspay/api/remote/c_p_api_repository.dart';
import 'package:crosspay/models/api_response.dart';

class UserController extends GetxController {
  CPApiRepository apiRepository = CPApiRepository();

  Future<ApiResponse> getUser(String userId) async {
    var response = await apiRepository.getUser(userId);
    return response;
  }
}
