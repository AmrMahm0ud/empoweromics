import 'package:empowero/src/domain/entities/personal_information/personal_information.dart';
import 'package:empowero/src/domain/repositories/personal_information/personal_information_repository.dart';

class SavePersonalInformationIntoDataBaseUseCase {
  final PersonalInformationRepository personalInformationRepository;

  SavePersonalInformationIntoDataBaseUseCase(
      {required this.personalInformationRepository});

  Future<bool> call({required PersonalInformation personalInformation}) async {
    return personalInformationRepository.savePersonalInformation(personalInformation: personalInformation);
  }
}
