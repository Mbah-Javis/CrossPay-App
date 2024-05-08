import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreenState {
  SignupScreenState() {}

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  RxBool continueLoading = false.obs;
}
