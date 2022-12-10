import 'package:empowero/src/core/utils/extensions/string_extensions.dart';

class ValidateFinanceValueUseCase {
  bool call({required String fianceValue}) {
    return fianceValue.isNullOrEmpty;
  }
}
