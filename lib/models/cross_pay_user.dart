class CrossPayUser {
  final int countryCode;
  final String uid;
  final String country;
  final String? profileImage;
  final String dateCreated;
  final NotificationSettings notificationSettings;
  final String lastName;
  final int phoneNumber;
  final Transactions transactions;
  final String firstName;
  final String email;
  final SubAccount subAccount;

  CrossPayUser({
    required this.countryCode,
    required this.uid,
    required this.country,
    this.profileImage,
    required this.dateCreated,
    required this.notificationSettings,
    required this.lastName,
    required this.phoneNumber,
    required this.transactions,
    required this.firstName,
    required this.email,
    required this.subAccount,
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
}

class NotificationSettings {
  final dynamic deviceInfo;
  final dynamic playerId;
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

class Transactions {
  final double totalAmount;
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

class SubAccount {
  final dynamic accountReference;
  final dynamic id;
  final String defaultCurrency;
  final Map<String, dynamic>? walletBalance;
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
