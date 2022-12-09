import 'package:empowero/src/domain/entities/personal_information/personal_information.dart';
import 'package:empowero/src/domain/repositories/personal_information/personal_information_repository.dart';

class PersonalInformationRepositoryImplementation
    extends PersonalInformationRepository {
  @override
  Future<bool> savePersonalInformation(
      {required PersonalInformation personalInformation}) async {
    return false;
  }
}
