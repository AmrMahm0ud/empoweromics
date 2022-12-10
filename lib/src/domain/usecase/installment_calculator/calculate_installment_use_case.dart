import 'dart:math';

import 'package:empowero/src/domain/entities/installment_calculation/installment_calculation.dart';

class CalculateInstallmentUseCase {
  double call({required InstallmentCalculation installmentCalculation}) {
    double financeValue = double.parse(installmentCalculation.financeValue!);
    int toner = installmentCalculation.toner!;

    num firstPart = pow(1 + 0.00417, toner * 12);
    num secondPart = pow(1 + 0.00417, (toner * 12));

    return financeValue * (0.00417 * firstPart) / (secondPart - 1);
  }
}
