import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class EnterPhoneNumberScreenPage extends StatelessWidget {
  EnterPhoneNumberScreenPage({Key? key}) : super(key: key);

  final logic = Get.put(EnterPhoneNumberScreenLogic());
  final state = Get.find<EnterPhoneNumberScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
