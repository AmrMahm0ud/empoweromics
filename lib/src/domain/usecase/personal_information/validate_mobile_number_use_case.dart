import 'package:empowero/src/core/utils/extensions/string_extensions.dart';

class ValidateMobileNumberUseCase {
  bool call({required String mobileNumber}) {
    return mobileNumber.isNullOrEmpty;
  }
}
