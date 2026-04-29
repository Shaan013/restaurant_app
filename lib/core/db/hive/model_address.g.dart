// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelAddressAdapter extends TypeAdapter<ModelAddress> {
  @override
  final typeId = 0;

  @override
  ModelAddress read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelAddress(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelAddress obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.unitNo)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.state)
      ..writeByte(4)
      ..write(obj.zipcode)
      ..writeByte(5)
      ..write(obj.instruction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelAddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
