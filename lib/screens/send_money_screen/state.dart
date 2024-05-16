import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SendMoneyScreenState {
  SendMoneyScreenState() {}

  final formKey = GlobalKey<FormState>();
  Rx<TextEditingController> amountController = TextEditingController().obs;
  Rx<TextEditingController> receiveAmountController =
      TextEditingController().obs;
  Rx<TextEditingController> senderNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> receiverNumberController =
      TextEditingController().obs;
  Rx<TextEditingController> receiverNameController =
      TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxBool sendMoneyLoading = false.obs;
}
