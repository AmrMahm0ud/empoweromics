import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';

class ValidateGovernorateUseCase {
  bool call({required DropDownButtonValue governorate}) {
    return governorate.id == -1 ? true : false;
  }
}
