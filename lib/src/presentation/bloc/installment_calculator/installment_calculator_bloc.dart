import 'package:empowero/src/domain/usecase/installment_calculator/calculate_installment_use_case.dart';
import 'package:empowero/src/domain/usecase/installment_calculator/validate_finance_value_use_case.dart';
import 'package:empowero/src/domain/usecase/installment_calculator/validate_unit_type_use_case.dart';
import 'package:empowero/src/presentation/bloc/installment_calculator/installment_calculator_event.dart';
import 'package:empowero/src/presentation/bloc/installment_calculator/installment_calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstallmentCalculatorBloc
    extends Bloc<InstallmentCalculatorEvent, InstallmentCalculatorState> {
  final ValidateFinanceValueUseCase validateFinanceValueUseCase;
  final ValidateUnitTypeUseCase validateUnitTypeUseCase;
  final CalculateInstallmentUseCase calculateInstallmentUseCase;

  String? unitTypeErrorMessage, financeValueErrorMessage;

  InstallmentCalculatorBloc(
      {required this.validateUnitTypeUseCase,
      required this.validateFinanceValueUseCase,
      required this.calculateInstallmentUseCase})
      : super(InitialInstallmentCalculatorState()) {
    on<CheckInstallmentUnitTypeValidationEvent>(
        _onCheckInstallmentUnitTypeValidationEvent);

    on<CheckInstallmentFinanceValueValidationEvent>(
        _onCheckInstallmentFinanceValueValidationEvent);
  }

  void _onCheckInstallmentUnitTypeValidationEvent(
      CheckInstallmentUnitTypeValidationEvent event,
      Emitter<InstallmentCalculatorState> emit) {
    if (validateUnitTypeUseCase(unitType: event.unitType) == true) {
      unitTypeErrorMessage = "Unit type is required";
    } else {
      unitTypeErrorMessage = null;
    }
    emit(InstallmentCalculatorValidationState(
        financeValueErrorMessage: financeValueErrorMessage,
        unitTypeErrorMessage: unitTypeErrorMessage));
  }

  void _onCheckInstallmentFinanceValueValidationEvent(
      CheckInstallmentFinanceValueValidationEvent event,
      Emitter<InstallmentCalculatorState> emit) {
    if (validateFinanceValueUseCase(fianceValue: event.financeValue) == true) {
      financeValueErrorMessage = "Finance value type is required";
    } else {
      financeValueErrorMessage = null;
    }
    emit(InstallmentCalculatorValidationState(
        financeValueErrorMessage: financeValueErrorMessage,
        unitTypeErrorMessage: unitTypeErrorMessage));
  }
}
