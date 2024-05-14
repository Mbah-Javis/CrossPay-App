import 'package:intl_phone_field/countries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterPhoneNumberScreenState {
  EnterPhoneNumberScreenState() {}

  // Get Cameroon from countries list
  List<Country> cList = [countries[37]];

  Rx<TextEditingController> phoneNumberController = TextEditingController().obs;
  RxString countryCode = '+237'.obs;
  RxString country = 'CM'.obs;
  RxBool continueLoading = false.obs;
}
