// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_radio_button_values.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalRadioButtonValuesAdapter
    extends TypeAdapter<LocalRadioButtonValues> {
  @override
  final int typeId = 2;

  @override
  LocalRadioButtonValues read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalRadioButtonValues(
      id: fields[0] == null ? -1 : fields[0] as int,
      label: fields[1] == null ? '' : fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalRadioButtonValues obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.label);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalRadioButtonValuesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
