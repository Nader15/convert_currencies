import 'package:get/get.dart';

import '../Logic/binding/currencies_symbols_binding.dart';
import '../Logic/binding/main_binding.dart';
import '../Logic/binding/two_currencies_converter_binding.dart';
import '../View/Screens/Currencies_Symbols_Screen/currencies_symbols_screen.dart';
import '../View/Screens/Main_Screen/main_screen.dart';
import '../View/Screens/Splash_Screen/splash_screen.dart';

class AppRoutes {
  //initialRoute
  static const splashScreen = Routes.splashScreen;
  static const mainScreen = Routes.mainScreen;
  static const currenciesSymbolsScreen = Routes.currenciesSymbolsScreen;

  //getPages
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        MainBinding(),
        // TwoCurrenciesConverterBinding()
      ],
    ),
    GetPage(
      name: Routes.currenciesSymbolsScreen,
      page: () => CurrenciesSymbolsScreen(),
      binding: CurrenciesSymbolsBinding(),
    ),
  ];
}

class Routes {
  static const splashScreen = '/splashScreen';
  static const mainScreen = '/mainScreen';
  static const currenciesSymbolsScreen = '/currenciesSymbolsScreen';
}
