// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_personal_information.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalPersonalInformationAdapter
    extends TypeAdapter<LocalPersonalInformation> {
  @override
  final int typeId = 0;

  @override
  LocalPersonalInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalPersonalInformation(
      name: fields[0] == null ? '' : fields[0] as String,
      governorate: fields[1] == null
          ? const LocalDropDownButtonValue(id: -1, title: '')
          : fields[1] as LocalDropDownButtonValue,
      mobile: fields[2] == null ? '' : fields[2] as String,
      employType: fields[3] == null
          ? const LocalRadioButtonValues(label: '', id: -1)
          : fields[3] as LocalRadioButtonValues,
      bankingObligations: fields[4] == null
          ? const LocalRadioButtonValues(label: '', id: -1)
          : fields[4] as LocalRadioButtonValues,
      companyName: fields[5] == null ? '' : fields[5] as String,
      monthlyIncome: fields[6] == null
          ? const LocalDropDownButtonValue(id: -1, title: '')
          : fields[6] as LocalDropDownButtonValue,
      email: fields[7] == null ? '' : fields[7] as String,
      whereDidYouHearAboutUs: fields[8] == null
          ? const LocalDropDownButtonValue(id: -1, title: '')
          : fields[8] as LocalDropDownButtonValue,
      id: fields[9] == null ? '-1' : fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalPersonalInformation obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.governorate)
      ..writeByte(2)
      ..write(obj.mobile)
      ..writeByte(3)
      ..write(obj.employType)
      ..writeByte(4)
      ..write(obj.bankingObligations)
      ..writeByte(5)
      ..write(obj.companyName)
      ..writeByte(6)
      ..write(obj.monthlyIncome)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.whereDidYouHearAboutUs)
      ..writeByte(9)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalPersonalInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
