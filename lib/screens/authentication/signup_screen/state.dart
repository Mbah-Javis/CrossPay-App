import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreenState {
  SignupScreenState() {}

  final formKey = GlobalKey<FormState>();
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxBool continueLoading = false.obs;
}
