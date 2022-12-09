import 'package:empowero/src/data/sources/local/empoweromics/database/personal_information_database_services/models/local_personal_information.dart';
import 'package:hive/hive.dart';

abstract class PersonalInformationDatabaseServices {
  Future<void> save(LocalPersonalInformation localPersonalInformation);
}

class PersonalInformationDatabaseServicesImplementation
    extends PersonalInformationDatabaseServices {
  @override
  Future<void> save(LocalPersonalInformation localPersonalInformation) async {
    final personalInformationBox = await Hive.openBox('personal_information_table');
    await personalInformationBox.put(localPersonalInformation.id, localPersonalInformation);
  }
}
