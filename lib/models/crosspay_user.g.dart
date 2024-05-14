// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crosspay_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CrossPayUserAdapter extends TypeAdapter<CrossPayUser> {
  @override
  final int typeId = 1;

  @override
  CrossPayUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CrossPayUser(
      countryCode: fields[0] as int,
      uid: fields[1] as String,
      country: fields[2] as String,
      profileImage: fields[3] as String?,
      dateCreated: fields[4] as String,
      notificationSettings: fields[5] as NotificationSettings,
      lastName: fields[6] as String,
      phoneNumber: fields[7] as int,
      transactions: fields[8] as Transactions,
      firstName: fields[9] as String,
      email: fields[10] as String,
      subAccount: fields[11] as SubAccount,
    );
  }

  @override
  void write(BinaryWriter writer, CrossPayUser obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.countryCode)
      ..writeByte(1)
      ..write(obj.uid)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.profileImage)
      ..writeByte(4)
      ..write(obj.dateCreated)
      ..writeByte(5)
      ..write(obj.notificationSettings)
      ..writeByte(6)
      ..write(obj.lastName)
      ..writeByte(7)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.transactions)
      ..writeByte(9)
      ..write(obj.firstName)
      ..writeByte(10)
      ..write(obj.email)
      ..writeByte(11)
      ..write(obj.subAccount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CrossPayUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NotificationSettingsAdapter extends TypeAdapter<NotificationSettings> {
  @override
  final int typeId = 2;

  @override
  NotificationSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationSettings(
      deviceInfo: fields[0] as dynamic,
      playerId: fields[1] as dynamic,
      language: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationSettings obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.deviceInfo)
      ..writeByte(1)
      ..write(obj.playerId)
      ..writeByte(2)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TransactionsAdapter extends TypeAdapter<Transactions> {
  @override
  final int typeId = 3;

  @override
  Transactions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transactions(
      totalAmount: fields[0] as double,
      totalTransactions: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Transactions obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.totalAmount)
      ..writeByte(1)
      ..write(obj.totalTransactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubAccountAdapter extends TypeAdapter<SubAccount> {
  @override
  final int typeId = 4;

  @override
  SubAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubAccount(
      accountReference: fields[0] as dynamic,
      id: fields[1] as dynamic,
      defaultCurrency: fields[2] as String,
      walletBalance: (fields[3] as Map?)?.cast<String, dynamic>(),
      walletDetails: (fields[4] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, SubAccount obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.accountReference)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.defaultCurrency)
      ..writeByte(3)
      ..write(obj.walletBalance)
      ..writeByte(4)
      ..write(obj.walletDetails);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
