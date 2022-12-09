import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:hive/hive.dart';

part 'local_drop_down_button_value.g.dart';

@HiveType(typeId: 1)
class LocalDropDownButtonValue extends DropDownButtonValue {
  @HiveField(0, defaultValue: -1)
  final int id;
  @HiveField(1, defaultValue: "")
  final String title;

  const LocalDropDownButtonValue({required this.id, required this.title})
      : super(id: id, title: title);
}
