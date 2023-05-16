import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Models/currencies_symbols_model.dart';
import '../Models/two_currencies_converter_model.dart';
import '../Utils/app_constants.dart';

class AppServices {
  Future<TwoCurrenciesConverterModel> getCurrenciesConverter({
    required double amount,
    required String date,
    required String fromCurrencyName,
    required String toCurrencyName,
  }) async {
    var response = await http.get(
      Uri.parse(
          "${AppConstants.BASE_URL}/convert?date=$date&from=$fromCurrencyName&to=$toCurrencyName&amount=$amount"),
    );
    var jsonData = response.body;
    var decodedData = jsonDecode(jsonData);
    if (decodedData['success']) {
      log("Currencies Converter Success --> $decodedData");
      return twoCurrenciesConverterModelFromJson(jsonData);
    } else {
      log("Currencies Converter Error --> $decodedData");
      return twoCurrenciesConverterModelFromJson(jsonData);
    }
  }

  Future<CurrenciesSymbolsModel> getCurrenciesSymbols() async {
    var response = await http.get(
      Uri.parse(
          "${AppConstants.BASE_URL}/symbols"),
    );
    var jsonData = response.body;
    var decodedData = jsonDecode(jsonData);
    if (decodedData['success']) {
      log("Currencies Symbols Success --> $decodedData");
      return currenciesSymbolsModelFromJson(jsonData);
    } else {
      log("Currencies Symbols Error --> $decodedData");
      return currenciesSymbolsModelFromJson(jsonData);
    }
  }
}
