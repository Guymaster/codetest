// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApplicationUserAdapter extends TypeAdapter<ApplicationUser> {
  @override
  final int typeId = 2;

  @override
  ApplicationUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApplicationUser(
      fields[0] as String?,
      fields[1] as bool,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ApplicationUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.saveConnect)
      ..writeByte(2)
      ..write(obj.fName)
      ..writeByte(3)
      ..write(obj.lName)
      ..writeByte(4)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
