import 'package:get/get.dart';

import '../controllers/currencies_symbols_controller.dart';
import '../controllers/main_controller.dart';
import '../controllers/two_currencies_converter_controller.dart';

class CurrenciesSymbolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CurrenciesSymbolsController());
  }
}
