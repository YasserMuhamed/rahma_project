// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasbeeh_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasbeehEntityAdapter extends TypeAdapter<TasbeehEntity> {
  @override
  final int typeId = 5;

  @override
  TasbeehEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TasbeehEntity(
      category: fields[0] as String,
      count: fields[1] as String,
      description: fields[2] as String,
      content: fields[3] as String,
      clicks: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TasbeehEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.clicks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasbeehEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
