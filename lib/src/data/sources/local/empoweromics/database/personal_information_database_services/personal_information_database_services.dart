import 'package:empowero/src/data/sources/local/empoweromics/database/personal_information_database_services/models/local_personal_information.dart';
import 'package:hive/hive.dart';

abstract class PersonalInformationDatabaseServices {
  Future<bool> save(LocalPersonalInformation localPersonalInformation);
}

class PersonalInformationDatabaseServicesImplementation
    extends PersonalInformationDatabaseServices {
  @override
  Future<bool> save(LocalPersonalInformation localPersonalInformation) async {
    final personalInformationBox = await Hive.openBox<LocalPersonalInformation>(
        'personal_information_table');
    await personalInformationBox.put(
        localPersonalInformation.id, localPersonalInformation);

    if (personalInformationBox.getAt(0)!.email != "") {
      return true;
    } else {
      return false;
    }
  }
}
