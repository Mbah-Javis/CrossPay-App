// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_crosspay_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCrossPayUserAdapter extends TypeAdapter<HiveCrossPayUser> {
  @override
  final int typeId = 1;

  @override
  HiveCrossPayUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCrossPayUser(
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
  void write(BinaryWriter writer, HiveCrossPayUser obj) {
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
      other is HiveCrossPayUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
