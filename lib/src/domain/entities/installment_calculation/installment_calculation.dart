import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';

class InstallmentCalculation {
  DropDownButtonValue? unitType;
  int? age, toner;
  String? financeValue, unitValue;

  InstallmentCalculation(
      {this.financeValue, this.unitType, this.age, this.toner, this.unitValue});
}
