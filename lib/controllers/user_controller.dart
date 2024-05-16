import 'package:get/get.dart';
import 'package:crosspay/api/remote/c_p_api_repository.dart';
import 'package:crosspay/models/api_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crosspay/api/local/hive_user_service.dart';
import 'package:crosspay/models/crosspay_user.dart';
import 'package:crosspay/utils/cross_pay_navigator.dart';
import 'package:crosspay/screens/home/home_screen/view.dart';
import 'package:crosspay/screens/authentication/welcome_screen/view.dart';

class UserController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    var user = getLocalUser();
    if (user != null) {
      getUserLiveData();
    }
  }

  CPApiRepository apiRepository = CPApiRepository();
  FirebaseAuth auth = FirebaseAuth.instance;

  var crossPayUser = CrossPayUser().obs;
  Future<ApiResponse> getUser(String userId) async {
    var response = await apiRepository.getUser(userId);
    return response;
  }

  User? getCurrentUser() {
    return auth.currentUser;
  }

  Future<ApiResponse> createUser(dynamic requestData) async {
    var response = await apiRepository.createUser(requestData);
    return response;
  }

  void saveLocalUser(CrossPayUser crossPayUser) async {
    CrossPayUser user = CrossPayUser(
        countryCode: crossPayUser.countryCode,
        uid: crossPayUser.uid,
        country: crossPayUser.country,
        dateCreated: crossPayUser.dateCreated,
        notificationSettings: crossPayUser.notificationSettings,
        lastName: crossPayUser.lastName,
        phoneNumber: crossPayUser.phoneNumber,
        transactions: crossPayUser.transactions,
        firstName: crossPayUser.firstName,
        email: crossPayUser.email,
        subAccount: crossPayUser.subAccount);

    await HiveCrossPayUserService().setCrossPayUser(user);
  }

  Future<CrossPayUser?> getLocalUser() async {
    return HiveCrossPayUserService().getCrossPayUser();
  }

  Stream<CrossPayUser> getUserLiveData() {
    Stream<CrossPayUser> userStream = apiRepository.getUserLiveData();
    crossPayUser.bindStream(userStream);
    return userStream;
  }

  void checkAuth() async {
    User? user = getCurrentUser();
    CrossPayUser? userData = await getLocalUser();

    if (user != null && userData != null) {
      CrossPayNavigator()
          .goOffAll(HomeScreenPage(), Transition.rightToLeftWithFade);
    } else {
      CrossPayNavigator()
          .goOffAll(WelcomeScreenPage(), Transition.rightToLeftWithFade);
    }
  }
}
