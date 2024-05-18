import 'package:hive/hive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'crosspay_user.g.dart';

@HiveType(typeId: 1)
class CrossPayUser extends HiveObject {
  @HiveField(0)
  late int? countryCode;

  @HiveField(1)
  late String? uid;

  @HiveField(2)
  late String? country;

  @HiveField(3)
  late String? profileImage;

  @HiveField(4)
  late String? dateCreated;

  @HiveField(5)
  late NotificationSettings? notificationSettings;

  @HiveField(6)
  late String? lastName;

  @HiveField(7)
  late int? phoneNumber;

  @HiveField(8)
  late Transactions? transactions;

  @HiveField(9)
  late String? firstName;

  @HiveField(10)
  late String? email;

  @HiveField(11)
  late SubAccount? subAccount;

  CrossPayUser({
    this.countryCode,
    this.uid,
    this.country,
    this.profileImage,
    this.dateCreated,
    this.notificationSettings,
    this.lastName,
    this.phoneNumber,
    this.transactions,
    this.firstName,
    this.email,
    this.subAccount,
  });

  factory CrossPayUser.fromJson(Map<String, dynamic> json) {
    return CrossPayUser(
      countryCode: json['contry_code'],
      uid: json['uid'],
      country: json['country'],
      profileImage: json['profile_image'],
      dateCreated: json['date_created'],
      notificationSettings:
          NotificationSettings.fromJson(json['notification_settings']),
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      transactions: Transactions.fromJson(json['transactions']),
      firstName: json['first_name'],
      email: json['email'],
      subAccount: SubAccount.fromJson(json['sub_account']),
    );
  }

  factory CrossPayUser.fromMap(DocumentSnapshot<Map<String, dynamic>> json) {
    return CrossPayUser(
      countryCode: json['contry_code'],
      uid: json['uid'],
      country: json['country'],
      profileImage: json['profile_image'],
      dateCreated: json['date_created'],
      notificationSettings:
          NotificationSettings.fromJson(json['notification_settings']),
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      transactions: Transactions.fromJson(json['transactions']),
      firstName: json['first_name'],
      email: json['email'],
      subAccount: SubAccount.fromJson(json['sub_account']),
    );
  }
}

@HiveType(typeId: 2)
class NotificationSettings extends HiveObject {
  @HiveField(0)
  final dynamic deviceInfo;

  @HiveField(1)
  final dynamic playerId;

  @HiveField(2)
  final String language;

  NotificationSettings({
    required this.deviceInfo,
    required this.playerId,
    required this.language,
  });

  factory NotificationSettings.fromJson(Map<String, dynamic> json) {
    return NotificationSettings(
      deviceInfo: json['device_info'],
      playerId: json['player_id'],
      language: json['language'],
    );
  }
}

@HiveType(typeId: 3)
class Transactions extends HiveObject {
  @HiveField(0)
  final double totalAmount;

  @HiveField(1)
  final int totalTransactions;

  Transactions({
    required this.totalAmount,
    required this.totalTransactions,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      totalAmount: json['total_amount'].toDouble(),
      totalTransactions: json['total_transactions'],
    );
  }
}

@HiveType(typeId: 4)
class SubAccount extends HiveObject {
  @HiveField(0)
  final dynamic accountReference;

  @HiveField(1)
  final dynamic id;

  @HiveField(2)
  final String defaultCurrency;

  @HiveField(3)
  final Map<String, dynamic>? walletBalance;

  @HiveField(4)
  final Map<String, dynamic>? walletDetails;

  SubAccount({
    required this.accountReference,
    required this.id,
    required this.defaultCurrency,
    required this.walletBalance,
    required this.walletDetails,
  });

  factory SubAccount.fromJson(Map<String, dynamic> json) {
    return SubAccount(
      accountReference: json['account_reference'],
      id: json['id'],
      defaultCurrency: json['default_currency'],
      walletBalance: json['wallet_balance'],
      walletDetails: json['wallet_details'],
    );
  }
}
