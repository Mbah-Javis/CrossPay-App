import 'package:hive/hive.dart';
import 'package:crosspay/models/cross_pay_user.dart';

part 'hive_crosspay_user.g.dart';

@HiveType(typeId: 1)
class HiveCrossPayUser extends HiveObject {
  @HiveField(0)
  late int countryCode;

  @HiveField(1)
  late String uid;

  @HiveField(2)
  late String country;

  @HiveField(3)
  late String? profileImage;

  @HiveField(4)
  late String dateCreated;

  @HiveField(5)
  late NotificationSettings notificationSettings;

  @HiveField(6)
  late String lastName;

  @HiveField(7)
  late int phoneNumber;

  @HiveField(8)
  late Transactions transactions;

  @HiveField(9)
  late String firstName;

  @HiveField(10)
  late String email;

  @HiveField(11)
  late SubAccount subAccount;

  HiveCrossPayUser({
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
}
