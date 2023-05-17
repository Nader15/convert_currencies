import 'package:convert_currencies/Services/app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Models/currencies_fluctuation_model.dart';

class CurrenciesFluctuationController extends GetxController {
  void scrollListener() {
    if (scrollController.value.position.pixels ==
        scrollController.value.position.maxScrollExtent) {
      // Reached the end of the list, load more data
      getPaginatedCurrenciesFluctuation();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    getCurrenciesFluctuation();
    scrollController.value.addListener(scrollListener);
  }

  @override
  void onClose() {
    scrollController.value.removeListener(scrollListener);
    scrollController.value.dispose();
    super.onClose();
  }

  var isLoadingCurrenciesFluctuation = false.obs;
  var currenciesFluctuationData = <String, Rate>{}.obs;
  var currency = "USD".obs;
  var selectedStartDate = "${DateFormat('yyyy-MM-dd').format(DateTime.now())}".obs;
  var selectedEndDate = "${DateFormat('yyyy-MM-dd').format(DateTime.now())}".obs;
  getCurrenciesFluctuation() async {
    try {
      isLoadingCurrenciesFluctuation(true);
      var response = await AppServices().getCurrenciesFluctuation(
        currency: currency.value,
        startDate: selectedStartDate.value,
        endDate: selectedEndDate.value,
      );
      if (response.success) {
        currenciesFluctuationData.value = response.rates;
        getPaginatedCurrenciesFluctuation();
      }
    } finally {
      isLoadingCurrenciesFluctuation(false);
    }
  }

  Rx<ScrollController> scrollController = ScrollController().obs;
  static const scrollThreshold = 1.00;
  final int pageSize = 10;
  int pageNumber = 1;
  var paginatedCurrenciesFluctuation = <Rate>[].obs;
  var isLoadingPagination = false.obs;

  getPaginatedCurrenciesFluctuation() async {
    if (!isLoadingPagination.value) {
      isLoadingPagination.value = true;
    }
    final List<Rate> symbolList = currenciesFluctuationData.values.toList();
    final int startIndex = (pageNumber - 1) * pageSize;
    int endIndex = startIndex + pageSize;

    if (startIndex >= symbolList.length) {
      isLoadingPagination.value = false;
      return;
    }
    if (endIndex > symbolList.length) {
      endIndex = symbolList.length;
    }
    await Future.delayed(Duration(seconds: 1));
    final List<Rate> symbolList1 = symbolList.sublist(startIndex, endIndex);
    paginatedCurrenciesFluctuation.addAll(symbolList1);
    pageNumber++;
    isLoadingPagination.value = false;
  }
}
