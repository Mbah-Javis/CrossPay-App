import 'package:get/get.dart';

import 'state.dart';

class HomeScreenLogic extends GetxController {
  final HomeScreenState state = HomeScreenState();

  void selectPage(int page) {
    state.selectedPage.value = page;
  }
}
