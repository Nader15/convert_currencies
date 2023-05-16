import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import '../controllers/two_currencies_converter_controller.dart';

class TwoCurrenciesConverterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TwoCurrenciesConverterController());
  }
}
