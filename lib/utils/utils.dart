import 'dart:io';

import 'package:crosspay/models/device_info.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:get/get.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl_phone_field/countries.dart';

Future<String?> getPlayerID() async {
  String? playerId = OneSignal.User.pushSubscription.id;
  print(OneSignal.User.pushSubscription.id);
  return playerId;
}

Future<DeviceInfo> getDeviceInfo() async {
  String? lang = Get.deviceLocale!.toLanguageTag();
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  DeviceInfo deviceInfoModel = DeviceInfo();
  deviceInfoModel.playerId = await getPlayerID();
  deviceInfoModel.language = lang == "en"
      ? lang
      : lang == "fr"
          ? lang
          : 'en';
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceInfoModel.deviceName = androidInfo.brand;
    deviceInfoModel.deviceModel = androidInfo.model;
    deviceInfoModel.deviceVersion = androidInfo.version.toMap();
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    deviceInfoModel.deviceName = iosInfo.name;
    deviceInfoModel.deviceModel = iosInfo.model;
    deviceInfoModel.deviceVersion = iosInfo.toMap();
  } else {
    deviceInfoModel.deviceName = Platform.localeName;
    deviceInfoModel.deviceModel = Platform.operatingSystem;
    deviceInfoModel.deviceVersion = Platform.environment;
  }

  return deviceInfoModel;
}

String getCountry(String countryCode) {
  String? country = '';
  countries.forEach((element) {
    if (element.code == countryCode) {
      country = element.nameTranslations['en'];
    }
  });
  return country!;
}

String getCountryFlag(String countryCode) {
  String? flag = '';
  countries.forEach((element) {
    if (element.code == countryCode) {
      flag = element.flag;
    }
  });
  return flag!;
}

int getCountryPhoneLength(String countryCode) {
  int length = 0;
  countries.forEach((element) {
    if (element.code == countryCode) {
      length = element.maxLength;
    }
  });
  return length;
}
