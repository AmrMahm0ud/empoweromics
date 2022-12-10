import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:equatable/equatable.dart';

abstract class InstallmentCalculatorEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class CheckInstallmentUnitTypeValidationEvent
    extends InstallmentCalculatorEvent {
  final DropDownButtonValue unitType;

  CheckInstallmentUnitTypeValidationEvent({required this.unitType});
}

class CheckInstallmentFinanceValueValidationEvent
    extends InstallmentCalculatorEvent {
  final String financeValue;

  CheckInstallmentFinanceValueValidationEvent({required this.financeValue});
}
