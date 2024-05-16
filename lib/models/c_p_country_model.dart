import 'package:cloud_firestore/cloud_firestore.dart';

class CPCountryModel {
  final String? country;
  final int? countryCode;
  final String? dateCreate;
  final String? flag;
  final List<PaymentOption>? paymentOptions;

  CPCountryModel(
      {this.country,
      this.countryCode,
      this.dateCreate,
      this.flag,
      this.paymentOptions});

  factory CPCountryModel.fromJson(Map<String, dynamic> json) {
    return CPCountryModel(
      country: json['country'],
      countryCode: json['country_code'],
      dateCreate: json['date_create'],
      flag: json['flag'],
      paymentOptions: PaymentOption.fromList(json['payment_options']),
    );
  }

  factory CPCountryModel.fromMap(DocumentSnapshot<Map<String, dynamic>> json) {
    return CPCountryModel(
      country: json['country'],
      countryCode: json['country_code'],
      dateCreate: json['date_create'],
      flag: json['flag'],
      paymentOptions: PaymentOption.fromList(json['payment_options']),
    );
  }

  static List<CPCountryModel> fromList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshots) {
    return snapshots
        .map((snapshot) => CPCountryModel.fromJson(snapshot.data()))
        .toList();
  }
}

class PaymentOption {
  final String logo;
  final String name;
  final String network;
  final String operator;

  PaymentOption(
      {required this.logo,
      required this.name,
      required this.network,
      required this.operator});

  factory PaymentOption.fromMap(Map<String, dynamic> json) {
    return PaymentOption(
      logo: json['logo'],
      name: json['name'],
      network: json['network'],
      operator: json['operator'],
    );
  }

  static List<PaymentOption> fromList(List<dynamic> jsonList) {
    return jsonList
        .map((json) => PaymentOption.fromMap(json as Map<String, dynamic>))
        .toList();
  }
}
