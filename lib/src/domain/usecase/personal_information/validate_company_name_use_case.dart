import 'package:empowero/src/core/utils/extensions/string_extensions.dart';

class ValidateCompanyNameUseCase {
  bool call({required String companyName}) {
    return companyName.isNullOrEmpty;
  }
}
