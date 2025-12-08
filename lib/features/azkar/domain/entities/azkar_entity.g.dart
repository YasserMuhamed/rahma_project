// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AzkarEntityAdapter extends TypeAdapter<AzkarEntity> {
  @override
  final int typeId = 4;

  @override
  AzkarEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AzkarEntity(
      category: fields[0] as String,
      count: fields[1] as String,
      description: fields[2] as String,
      content: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AzkarEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AzkarEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
