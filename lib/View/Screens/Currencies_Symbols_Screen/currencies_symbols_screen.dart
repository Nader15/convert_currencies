import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/controllers/currencies_symbols_controller.dart';
import '../../../Logic/controllers/two_currencies_converter_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../Widgets/custom_circle_progress.dart';

class CurrenciesSymbolsScreen extends StatelessWidget {
  CurrenciesSymbolsScreen({Key? key}) : super(key: key);
  final currenciesSymbolsController = Get.find<CurrenciesSymbolsController>();
  final twoCurrenciesConverterController = Get.find<TwoCurrenciesConverterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.BLACK_COLOR,
        appBar: AppBar(
          backgroundColor: AppColors.BLACK_COLOR,
          title: const Text("Currencies Symbols"),
        ),
        body: Obx(() {
          if (currenciesSymbolsController.isLoadingCurrenciesSymbols.value){
            return const CustomCircleProgress();
          }
          else{
            return ListView.separated(
              padding: const EdgeInsets.all(15),
              controller: currenciesSymbolsController.scrollController.value,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: currenciesSymbolsController.paginatedSymbols.length+1,
              itemBuilder: (context, index) {
                return Obx(() {
                  if (index == currenciesSymbolsController.paginatedSymbols.length) {
                    if (currenciesSymbolsController.isLoadingPagination.value) {
                      return const CustomCircleProgress();
                    } else {
                      return Container(); // Empty container when not loading
                    }
                  }else{
                    final symbol = currenciesSymbolsController.paginatedSymbols[index];
                    return ListTile(
                      splashColor: AppColors.MAIN_COLOR,
                      onTap: () {
                        twoCurrenciesConverterController.selectCurrency(symbol.code);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      tileColor: AppColors.GREY_COLOR,
                      title: Text(
                        symbol.description,
                        style: const TextStyle(
                            color: AppColors.WHITE_COLOR),
                      ),
                      trailing: Text(
                        symbol.code,
                        style: const TextStyle(
                            color: AppColors.MAIN_COLOR),
                      ),
                    );
                  }
                });

              },
              separatorBuilder: (context, index) =>
              const SizedBox(
                height: 10,
              ),
            );
          }
        }));
  }
}
