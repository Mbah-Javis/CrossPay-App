import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class FavoritesPagePage extends StatelessWidget {
  FavoritesPagePage({super.key});

  final logic = Get.put(FavoritesPageLogic());
  final state = Get.find<FavoritesPageLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
