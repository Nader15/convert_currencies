import 'package:get/get.dart';

import '../controllers/currencies_fluctuation_controller.dart';
import '../controllers/main_controller.dart';
import '../controllers/two_currencies_converter_controller.dart';

class CurrenciesFluctuationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CurrenciesFluctuationController());
  }
}
