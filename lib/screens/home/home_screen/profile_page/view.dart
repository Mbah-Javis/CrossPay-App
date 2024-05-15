import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crosspay/controllers/user_controller.dart';

import 'logic.dart';

class ProfilePagePage extends StatelessWidget {
  ProfilePagePage({Key? key}) : super(key: key);

  final logic = Get.put(ProfilePageLogic());
  final state = Get.find<ProfilePageLogic>().state;
  var userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
