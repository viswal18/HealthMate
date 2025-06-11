// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class modelAdapter extends TypeAdapter<model> {
  @override
  final int typeId = 1;

  @override
  model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return model(
      medicationname: fields[0] as String,
      quantity: fields[1] as String,
      frequency: fields[2] as String,
      time: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, model obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.medicationname)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.frequency)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is modelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
