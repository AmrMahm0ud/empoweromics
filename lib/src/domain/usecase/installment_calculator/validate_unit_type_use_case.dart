import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';

class ValidateUnitTypeUseCase {
  bool call({required DropDownButtonValue unitType}) {
    return unitType.id != -1 ? false : true;
  }
}
