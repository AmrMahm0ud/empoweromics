import 'package:empowero/src/core/resources/image_paths.dart';
import 'package:empowero/src/presentation/screen/main/installment_calculator/installment_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Image.asset(
                  ImagePaths.bannerImage,
                  fit: BoxFit.fill,
                  height: 200,
                ),
                propertyType(
                    imagePath: ImagePaths.residentialIcon,
                    label: "Residential"),
                propertyType(
                    imagePath: ImagePaths.nonResidentialIcon,
                    label: "Non Residential"),
                propertyType(
                    imagePath: ImagePaths.secondHomeIcon, label: "Second Home"),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      navigateInstallmentCalculationScreen();
                    },
                    child: const Text("Installment calculator"))
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget propertyType({required String imagePath, required String label}) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            width: 40,
            height: 50,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          )
        ],
      ),
    );
  }

  Future<void> navigateInstallmentCalculationScreen() async {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const InstallmentCalculatorScreen()),
    );
  }
}
