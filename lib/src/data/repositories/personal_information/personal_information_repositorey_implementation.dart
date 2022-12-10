import 'package:empowero/src/data/sources/local/empoweromics/database/personal_information_database_services/models/local_drop_down_button_value.dart';
import 'package:empowero/src/data/sources/local/empoweromics/database/personal_information_database_services/models/local_personal_information.dart';
import 'package:empowero/src/data/sources/local/empoweromics/database/personal_information_database_services/models/local_radio_button_values.dart';
import 'package:empowero/src/data/sources/local/empoweromics/database/personal_information_database_services/personal_information_database_services.dart';
import 'package:empowero/src/domain/entities/personal_information/personal_information.dart';
import 'package:empowero/src/domain/repositories/personal_information/personal_information_repository.dart';

class PersonalInformationRepositoryImplementation
    extends PersonalInformationRepository {
  final PersonalInformationDatabaseServices personalInformationDatabaseServices;

  PersonalInformationRepositoryImplementation(
      {required this.personalInformationDatabaseServices});

  @override
  Future<bool> savePersonalInformation(
      {required PersonalInformation personalInformation}) async {
   bool result =  await personalInformationDatabaseServices.save(LocalPersonalInformation(
        name: personalInformation.name!,
        governorate: LocalDropDownButtonValue(
            title: personalInformation.governorate!.title,
            id: personalInformation.governorate!.id),
        mobile: personalInformation.mobile!,
        employType: LocalRadioButtonValues(
            label: personalInformation.employType!.label,
            id: personalInformation.employType!.id),
        bankingObligations: LocalRadioButtonValues(
            label: personalInformation.bankingObligations!.label,
            id: personalInformation.bankingObligations!.id),
        companyName: personalInformation.companyName!,
        monthlyIncome: LocalDropDownButtonValue(
            title: personalInformation.monthlyIncome!.title,
            id: personalInformation.monthlyIncome!.id),
        email: personalInformation.email!,
        whereDidYouHearAboutUs: LocalDropDownButtonValue(
            title: personalInformation.whereDidYouHearAboutUs!.title,
            id: personalInformation.whereDidYouHearAboutUs!.id),
        id: "1"));
    return result;
  }
}
