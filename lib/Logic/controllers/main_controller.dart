import 'package:convert_currencies/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../View/Screens/Currencies_Fluctuation_Screen/currencies_fluctuation_screen.dart';
import '../../View/Screens/Two_Currencies_Converter_Screen/two_currencies_converter_screen.dart';

class MainController extends GetxController {
  late PageController pageController;
  RxInt currentIndex = 0.obs;
  var appBarTitle = ''.obs;
  final tabs = [
    TwoCurrenciesConverterScreen(),
    CurrenciesFluctuationScreen(),
  ].obs;

  @override
  void onInit() async {
    super.onInit();
    pageController = PageController();
  }
  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
