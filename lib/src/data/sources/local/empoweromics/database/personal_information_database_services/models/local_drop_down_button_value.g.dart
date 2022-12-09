// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_drop_down_button_value.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalDropDownButtonValueAdapter
    extends TypeAdapter<LocalDropDownButtonValue> {
  @override
  final int typeId = 1;

  @override
  LocalDropDownButtonValue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalDropDownButtonValue(
      id: fields[0] == null ? -1 : fields[0] as int,
      title: fields[1] == null ? '' : fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalDropDownButtonValue obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalDropDownButtonValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
