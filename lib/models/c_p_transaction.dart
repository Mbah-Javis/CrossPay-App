import 'package:cloud_firestore/cloud_firestore.dart';

enum TransactionStatus { pending, completed, failed, inprogress }

class CPTransaction {
  final String? status;
  final int? amount;
  final String? uuid;
  final String? userId;
  final String? deliveredStatus;
  final String? email;
  final int? txId;
  final String? txRef;
  final Meta? meta;

  CPTransaction({
    this.status,
    this.amount,
    this.uuid,
    this.userId,
    this.deliveredStatus,
    this.email,
    this.txId,
    this.txRef,
    this.meta,
  });

  factory CPTransaction.fromJson(Map<String, dynamic> json) {
    return CPTransaction(
      status: json['status'],
      amount: json['amount'],
      uuid: json['uuid'],
      userId: json['user_id'],
      deliveredStatus: json['delivered_status'],
      email: json['email'],
      txId: json['tx_id'],
      txRef: json['tx_ref'],
      meta: Meta.fromMap(json['meta']),
    );
  }

  factory CPTransaction.fromMap(DocumentSnapshot<Map<String, dynamic>> json) {
    return CPTransaction(
      status: json['status'],
      amount: json['amount'],
      uuid: json['uuid'],
      userId: json['user_id'],
      deliveredStatus: json['delivered_status'],
      email: json['email'],
      txId: json['tx_id'],
      txRef: json['tx_ref'],
      meta: Meta.fromMap(json['meta']),
    );
  }

  static List<CPTransaction> fromList(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshots) {
    return snapshots
        .map((snapshot) => CPTransaction.fromJson(snapshot.data()!))
        .toList();
  }
}

class Meta {
  final int amount;
  final String uuid;
  final String userId;
  final String sender;
  final int mobileNumber;
  final String senderCountry;
  final String currency;
  final int countryCode;
  final String network;
  final String networkName;
  final String operator;
  final int receiveAmount;
  final String receiverCurrency;
  final String receiverCountry;
  final int receiverCountryCode;
  final int receiverNumber;
  final String receiverName;
  final String dateCreated;
  final String txRef;

  Meta({
    required this.amount,
    required this.uuid,
    required this.userId,
    required this.sender,
    required this.mobileNumber,
    required this.senderCountry,
    required this.currency,
    required this.countryCode,
    required this.network,
    required this.networkName,
    required this.operator,
    required this.receiveAmount,
    required this.receiverCurrency,
    required this.receiverCountry,
    required this.receiverCountryCode,
    required this.receiverNumber,
    required this.receiverName,
    required this.dateCreated,
    required this.txRef,
  });

  factory Meta.fromMap(Map<String, dynamic> json) {
    return Meta(
      amount: json['amount'],
      uuid: json['uuid'],
      userId: json['user_id'],
      sender: json['sender'],
      mobileNumber: json['mobile_number'],
      senderCountry: json['sender_country'],
      currency: json['currency'],
      countryCode: json['country_code'],
      network: json['network'],
      networkName: json['network_name'],
      operator: json['operator'],
      receiveAmount: json['receive_amount'],
      receiverCurrency: json['receiver_currency'],
      receiverCountry: json['receiver_country'],
      receiverCountryCode: json['receiver_country_code'],
      receiverNumber: json['receiver_number'],
      receiverName: json['receiver_name'],
      dateCreated: json['date_created'],
      txRef: json['tx_ref'],
    );
  }
}
