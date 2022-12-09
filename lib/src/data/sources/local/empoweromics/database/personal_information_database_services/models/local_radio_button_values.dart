import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';
import 'package:hive/hive.dart';

part 'local_radio_button_values.g.dart';

@HiveType(typeId: 2)
class LocalRadioButtonValues extends RadioButtonValue {
  @HiveField(0, defaultValue: -1)
  final int id;
  @HiveField(1, defaultValue: "")
  final String label;

 const LocalRadioButtonValues({required this.id, required this.label})
      : super(id: id, label: label);
}
