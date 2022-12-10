import 'package:equatable/equatable.dart';

abstract class InstallmentCalculatorState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class InitialInstallmentCalculatorState extends InstallmentCalculatorState {}

class InstallmentCalculatorValidationState extends InstallmentCalculatorState {
  final String? unitTypeErrorMessage, financeValueErrorMessage;

  InstallmentCalculatorValidationState(
      {this.financeValueErrorMessage, this.unitTypeErrorMessage});
}

class InstallmentCalculationAnswerState extends InstallmentCalculatorState {
  final String installmentCalculationAnswer;

  InstallmentCalculationAnswerState(
      {required this.installmentCalculationAnswer});
}
