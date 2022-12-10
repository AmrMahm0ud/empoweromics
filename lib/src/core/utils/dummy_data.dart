import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';

List<RadioButtonValue> bankingObligations = [
  const RadioButtonValue(label: "Yes", id: 0),
  const RadioButtonValue(label: "No", id: 1)
];
List<RadioButtonValue> employType = [
  const RadioButtonValue(label: "Employed", id: 0),
  const RadioButtonValue(label: "Self-employed", id: 1)
];

List<DropDownButtonValue> governorates = [
  const DropDownButtonValue(title: "Select Governorate", id: -1),
  const DropDownButtonValue(title: "Cairo", id: 0),
  const DropDownButtonValue(title: "Aswan", id: 1)
];

List<DropDownButtonValue> monthlyIncome = [
  const DropDownButtonValue(title: "Please Choose", id: -1),
  const DropDownButtonValue(title: "1000", id: 0),
  const DropDownButtonValue(title: "2000", id: 1)
];

List<DropDownButtonValue> whereDidYouHearAboutUs = [
  const DropDownButtonValue(title: "Please Choose", id: -1),
  const DropDownButtonValue(title: "Facebook", id: 0),
  const DropDownButtonValue(title: "Twitter", id: 1)
];

List<DropDownButtonValue> unitType = [
  const DropDownButtonValue(title: "", id: -1),
  const DropDownButtonValue(title: "Residential", id: 0),
  const DropDownButtonValue(title: "Non-Residential", id: 1),
  const DropDownButtonValue(title: "Second home", id: 2)
];
