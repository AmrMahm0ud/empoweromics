import 'package:empowero/src/core/utils/dummy_data.dart';
import 'package:empowero/src/domain/entities/installment_calculation/installment_calculation.dart';
import 'package:empowero/src/domain/entities/personal_information/drop_down_button_value.dart';
import 'package:empowero/src/presentation/bloc/installment_calculator/installment_calculator_bloc.dart';
import 'package:empowero/src/presentation/bloc/installment_calculator/installment_calculator_event.dart';
import 'package:empowero/src/presentation/bloc/installment_calculator/installment_calculator_state.dart';
import 'package:empowero/src/presentation/screen/main/installment_calculator/widgets/slider_widget.dart';
import 'package:empowero/src/presentation/screen/main/installment_calculator/widgets/text_filed_with_header_widget.dart';
import 'package:empowero/src/presentation/screen/main/installment_calculator/widgets/unit_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InstallmentCalculatorScreen extends StatefulWidget {
  const InstallmentCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<InstallmentCalculatorScreen> createState() =>
      _InstallmentCalculatorScreenState();
}

class _InstallmentCalculatorScreenState
    extends State<InstallmentCalculatorScreen> {
  TextEditingController unitTypeController = TextEditingController();
  TextEditingController financeValueController = TextEditingController();
  TextEditingController unitValueController = TextEditingController();

  InstallmentCalculation installmentCalculation =
      InstallmentCalculation(unitType: unitType.first, age: 21, toner: 1);
  String? unitTypeErrorMessage, financeValueErrorMessage, installmentAnswer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            BlocConsumer<InstallmentCalculatorBloc, InstallmentCalculatorState>(
          listener: (context, state) {
            if (state is InstallmentCalculatorValidationState) {
              unitTypeErrorMessage = state.unitTypeErrorMessage;
              financeValueErrorMessage = state.financeValueErrorMessage;
            } else if (state is InstallmentCalculationAnswerState) {
              installmentAnswer = state.installmentCalculationAnswer;
            }
          },
          builder: (context, state) {
            return _buildScreen();
          },
        ),
      ),
    );
  }

  Widget _buildScreen() {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Calculate your installments",
                    style: TextStyle(fontSize: 24, color: Colors.blue)),
                const SizedBox(height: 10),
                const Text("Monthly installment as per finance amount value ",
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                const SizedBox(height: 10),
                UnitTypeWidget(
                    title: "Unit type (type of product)",
                    values: unitType,
                    onChange: (value) {
                      installmentCalculation.unitType = value;
                      checkUnitTypeValidationEvent(unitType: value);
                    },
                    selectedValue: installmentCalculation.unitType!,
                    errorMessage: unitTypeErrorMessage),
                const SizedBox(height: 10),
                SliderWidget(
                    title: "age *",
                    maxRange: 65,
                    minRange: 21,
                    sliderValue: installmentCalculation.age! .toDouble(),
                    onChange: (value) {
                      installmentCalculation.age = value;
                    }),
                const SizedBox(height: 10),
                SliderWidget(
                    title: "Tenor in year *",
                    maxRange: 15,
                    minRange: 1,
                    sliderValue: installmentCalculation.toner!.toDouble(),
                    onChange: (value) {
                      installmentCalculation.toner = value;
                    }),
                const SizedBox(height: 10),
                TextFiledWithHeaderWidget(
                  onChange: (value) {
                    installmentCalculation.financeValue = value;
                    checkFinanceValueValidationEvent(financeValue: value);
                  },
                  controller: financeValueController,
                  headerText: "Finance value *",
                  errorMessage: financeValueErrorMessage,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextFiledWithHeaderWidget(
                    onChange: (value) {
                      installmentCalculation.unitValue = value;
                    },
                    controller: unitValueController,
                    headerText: "Unit value"),
                const SizedBox(height: 10),
                installmentAnswer == null
                    ? const SizedBox()
                    : installmentCalculateAnswerQuestion(),
                const Spacer(),
                Center(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      calculateInstallmentEvent(
                          installmentCalculation: installmentCalculation);
                    },
                    child: const Text(
                      "Calculate",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget installmentCalculateAnswerQuestion() {
    return SizedBox(
        child: Text(
      installmentAnswer ?? "",
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ));
  }

  void checkUnitTypeValidationEvent({required DropDownButtonValue unitType}) {
    BlocProvider.of<InstallmentCalculatorBloc>(context)
        .add(CheckInstallmentUnitTypeValidationEvent(unitType: unitType));
  }

  void checkFinanceValueValidationEvent({required String financeValue}) {
    BlocProvider.of<InstallmentCalculatorBloc>(context).add(
        CheckInstallmentFinanceValueValidationEvent(
            financeValue: financeValue));
  }

  void calculateInstallmentEvent(
      {required InstallmentCalculation installmentCalculation}) {
    BlocProvider.of<InstallmentCalculatorBloc>(context).add(
        CalculateInstallmentEvent(
            installmentCalculation: installmentCalculation));
  }
}
