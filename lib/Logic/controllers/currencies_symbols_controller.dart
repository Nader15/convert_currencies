import 'dart:developer';

import 'package:convert_currencies/Models/currencies_symbols_model.dart';
import 'package:convert_currencies/Services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrenciesSymbolsController extends GetxController {

  void scrollListener() {
    if (scrollController.value.position.pixels ==
        scrollController.value.position.maxScrollExtent) {
      // Reached the end of the list, load more data
      getPaginatedSymbols();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    getCurrenciesSymbols();
    scrollController.value.addListener(scrollListener);
  }

  @override
  void onClose() {
    scrollController.value.removeListener(scrollListener);
    scrollController.value.dispose();
    super.onClose();
  }

  var isLoadingCurrenciesSymbols = false.obs;

  var currenciesSymbolsData = <String, Symbol>{}.obs;

  getCurrenciesSymbols() async {
    try {
      isLoadingCurrenciesSymbols(true);
      var response = await AppServices().getCurrenciesSymbols();
      if (response.success) {
        currenciesSymbolsData.value = response.symbols;
        getPaginatedSymbols();
      }
    } finally {
      isLoadingCurrenciesSymbols(false);
    }
  }

  Rx<ScrollController> scrollController = ScrollController().obs;
  static const scrollThreshold = 1.00;
  final int pageSize = 10;
  int pageNumber = 1;
  var paginatedSymbols = <Symbol>[].obs;
  var isLoadingPagination = false.obs;

  getPaginatedSymbols() async {
    if (!isLoadingPagination.value) {
      isLoadingPagination.value = true;
    }
    final List<Symbol> symbolList = currenciesSymbolsData.values.toList();
    final int startIndex = (pageNumber - 1) * pageSize;
    int endIndex = startIndex + pageSize;

    if (startIndex >= symbolList.length) {
      isLoadingPagination.value = false;
      return ;
    }
    if (endIndex > symbolList.length) {
      endIndex = symbolList.length;
    }
    await Future.delayed(Duration(seconds: 1));
    final List<Symbol> symbolList1 = symbolList.sublist(startIndex, endIndex);
    paginatedSymbols.addAll(symbolList1);
    pageNumber++;
    isLoadingPagination.value = false;
  }
}
