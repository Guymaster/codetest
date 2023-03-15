// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_security.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JWTSecureAdapter extends TypeAdapter<JWTSecure> {
  @override
  final int typeId = 13;

  @override
  JWTSecure read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JWTSecure(
      token: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JWTSecure obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JWTSecureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
