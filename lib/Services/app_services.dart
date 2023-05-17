import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../Models/currencies_fluctuation_model.dart';
import '../Models/currencies_symbols_model.dart';
import '../Models/two_currencies_converter_model.dart';
import '../Utils/app_constants.dart';

class AppServices {
  final http.Client httpClient;

  AppServices({http.Client? httpClient})
      : httpClient = httpClient ?? http.Client();
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
      Uri.parse("${AppConstants.BASE_URL}/symbols"),
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

  Future<CurrenciesFluctuationModel> getCurrenciesFluctuation({
    required String currency,
    required String startDate,
    required String endDate,
  }) async {
    var response = await http.get(
      Uri.parse(
          "${AppConstants.BASE_URL}/fluctuation?start_date=$startDate&end_date=$endDate&base=$currency"),
    );
    var jsonData = response.body;
    var decodedData = jsonDecode(jsonData);
    if (decodedData['success']) {
      log("Currencies Fluctuation Success --> $decodedData");
      return currenciesFluctuationModelFromJson(jsonData);
    } else {
      log("Currencies Fluctuation Error --> $decodedData");
      return currenciesFluctuationModelFromJson(jsonData);
    }
  }
}
