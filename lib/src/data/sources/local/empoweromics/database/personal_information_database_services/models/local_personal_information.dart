import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:empowero/src/domain/entities/personal_information/personal_information.dart';
import 'package:empowero/src/domain/entities/personal_information/radio_button_value.dart';
import 'package:hive/hive.dart';

part 'local_personal_information.g.dart';

@HiveType(typeId: 0)
class LocalPersonalInformation extends PersonalInformation {
  @HiveField(0, defaultValue: "")
  final String name;

  @HiveField(1, defaultValue: DropDownButtonValue(id: -1, title: ""))
  final DropDownButtonValue governorate;

  @HiveField(2, defaultValue: "")
  final String mobile;

  @HiveField(3, defaultValue: RadioButtonValue(label: "", id: -1))
  final RadioButtonValue employType;

  @HiveField(4, defaultValue: RadioButtonValue(label: "", id: -1))
  final RadioButtonValue bankingObligations;

  @HiveField(5, defaultValue: "")
  final String companyName;

  @HiveField(6, defaultValue: DropDownButtonValue(id: -1, title: ""))
  final DropDownButtonValue monthlyIncome;

  @HiveField(7, defaultValue: "")
  final String email;

  @HiveField(8, defaultValue: DropDownButtonValue(id: -1, title: ""))
  final DropDownButtonValue whereDidYouHearAboutUs;

  @HiveField(9, defaultValue: "-1")
  final String id;

  LocalPersonalInformation(
      {required this.name,
      required this.governorate,
      required this.mobile,
      required this.employType,
      required this.bankingObligations,
      required this.companyName,
      required this.monthlyIncome,
      required this.email,
      required this.whereDidYouHearAboutUs,
      required this.id})
      : super(
            email: email,
            name: name,
            mobile: mobile,
            bankingObligations: bankingObligations,
            companyName: companyName,
            employType: employType,
            governorate: governorate,
            monthlyIncome: monthlyIncome,
            whereDidYouHearAboutUs: whereDidYouHearAboutUs,
            id: id);
}
