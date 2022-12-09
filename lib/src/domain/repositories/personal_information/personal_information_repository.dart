import 'package:empowero/src/domain/entities/personal_information/personal_information.dart';

abstract class PersonalInformationRepository {
  Future<bool> savePersonalInformation(
      {required PersonalInformation personalInformation});
}
