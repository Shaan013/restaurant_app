// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'white_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WhiteListAdapter extends TypeAdapter<WhiteList> {
  @override
  final typeId = 0;

  @override
  WhiteList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WhiteList(
      id: (fields[0] as num?)?.toInt(),
      title: fields[1] as String?,
      imageUrl: fields[6] as String?,
      distance: fields[5] as String?,
      rating: (fields[3] as num?)?.toDouble(),
      price: (fields[2] as num?)?.toInt(),
      reviewsCount: (fields[4] as num?)?.toInt(),
    )..count = (fields[7] as num).toInt();
  }

  @override
  void write(BinaryWriter writer, WhiteList obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.reviewsCount)
      ..writeByte(5)
      ..write(obj.distance)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WhiteListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
