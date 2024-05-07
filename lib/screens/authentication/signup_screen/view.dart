import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SignupScreenPage extends StatelessWidget {
  SignupScreenPage({Key? key}) : super(key: key);

  final logic = Get.put(SignupScreenLogic());
  final state = Get.find<SignupScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
