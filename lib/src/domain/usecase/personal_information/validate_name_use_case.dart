import 'package:empowero/src/core/utils/extensions/string_extensions.dart';

class ValidateNameUseCase {
  bool call({required String name}) {
    return name.isNullOrEmpty;
  }
}
