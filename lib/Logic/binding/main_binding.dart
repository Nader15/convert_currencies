import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import '../controllers/two_currencies_converter_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TwoCurrenciesConverterController());
    Get.put(MainController());

  }
}
