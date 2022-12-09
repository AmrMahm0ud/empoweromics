import 'package:empowero/src/core/utils/extensions/string_extensions.dart';

class ValidateEmailUseCase {
  bool call({required String email}) {
    return email.isNullOrEmpty;
  }
}
