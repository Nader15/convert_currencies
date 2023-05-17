import 'package:convert_currencies/Models/currencies_symbols_model.dart';
import 'package:convert_currencies/Services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'currencies_fluctuation_controller.dart';

class TwoCurrenciesConverterController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    fromCurrency.value.text = "1.0";
    converterBase.value = "1.0";
    getCurrenciesConverter();
  }

  var fromCurrency = TextEditingController().obs;
  var isLoadingCurrenciesConverter = false.obs;
  var converterBase = "".obs;
  var converterResult = 0.0.obs;
  var selectedDate = "".obs;
  var fromCurrencyName = "USD".obs;
  var toCurrencyName = "EGP".obs;
  var fromCurrencyNameSelected = false.obs;
  var toCurrencyNameSelected = false.obs;

  void selectCurrency(String value) {
    final currenciesFluctuationController = Get.find<CurrenciesFluctuationController>();
    if (fromCurrencyNameSelected.value) fromCurrencyName.value = value;
    if (toCurrencyNameSelected.value) toCurrencyName.value = value;
    Get.back();
    getCurrenciesConverter();
    currenciesFluctuationController.pageNumber = 1;
    currenciesFluctuationController.paginatedCurrenciesFluctuation.clear();
    currenciesFluctuationController.getCurrenciesFluctuation();
  }

  getCurrenciesConverter() async {
    try {
      isLoadingCurrenciesConverter(true);
      var response = await AppServices().getCurrenciesConverter(
        date: selectedDate.value,
        fromCurrencyName: fromCurrencyName.value,
        toCurrencyName: toCurrencyName.value,
        amount: double.parse(converterBase.value),
      );
      if (response.success) {
        if (response.result == null || response.info.rate == null) {
          converterResult.value = 0.0;
        } else {
          converterResult.value = response.result!;
          // converterBase.value = "${response.query.amount}";
          // fromCurrency.value.text = "${response.query.amount}";
          fromCurrency.value.selection = TextSelection.fromPosition(
            TextPosition(offset: fromCurrency.value.text.length),
          );
        }
      } else {
        converterResult.value = 0.0;
      }
    } finally {
      isLoadingCurrenciesConverter(false);
    }
  }
}
