import 'package:empowero/src/presentation/screen/main/installment_calculator/widgets/slider_widget.dart';
import 'package:empowero/src/presentation/screen/main/installment_calculator/widgets/text_filed_with_header_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildScreen(),
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
                TextFiledWithHeaderWidget(
                  onChange: (value) {},
                  controller: unitTypeController,
                  headerText: "Unit type(type of products) *",
                ),
                const SizedBox(height: 10),
                SliderWidget(
                    title: "age *",
                    maxRange: 65,
                    minRange: 21,
                    sliderValue: 21),
                const SizedBox(height: 10),
                SliderWidget(
                    title: "Tenor in year *",
                    maxRange: 100,
                    minRange: 1,
                    sliderValue: 1),
                const SizedBox(height: 10),
                TextFiledWithHeaderWidget(
                  onChange: (value) {},
                  controller: financeValueController,
                  headerText: "Finance value *",
                ),
                const SizedBox(height: 10),
                TextFiledWithHeaderWidget(
                    onChange: (value) {},
                    controller: unitValueController,
                    headerText: "Unit value"),
                const SizedBox(height: 10),
                const Spacer(),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {},
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
}
