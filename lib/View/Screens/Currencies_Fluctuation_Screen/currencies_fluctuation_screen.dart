import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Logic/controllers/currencies_fluctuation_controller.dart';
import '../../../Logic/controllers/two_currencies_converter_controller.dart';
import '../../../Routes/routes.dart';
import '../../../Utils/app_colors.dart';
import 'Widgets/alerts.dart';
import 'currencies_fluctuation_List.dart';

class CurrenciesFluctuationScreen extends StatelessWidget {
  CurrenciesFluctuationScreen({Key? key}) : super(key: key);
  final currenciesFluctuationController =
      Get.find<CurrenciesFluctuationController>();
  final twoCurrenciesConverterController =
      Get.find<TwoCurrenciesConverterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BLACK_COLOR,
      appBar: AppBar(
        shadowColor: AppColors.MAIN_COLOR,
        elevation: 0.5,
        backgroundColor: AppColors.BLACK_COLOR,
        title: const Text("Currencies Fluctuation"),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(120.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Alerts().startDatePop();
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.MAIN_COLOR,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Start Date",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.BLACK_COLOR,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                currenciesFluctuationController
                                    .selectedStartDate.value,
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.WHITE_COLOR),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            twoCurrenciesConverterController
                                .fromCurrencyNameSelected(true);
                            Get.toNamed(Routes.currenciesSymbolsScreen);
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.MAIN_COLOR,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "Base Currency",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.BLACK_COLOR,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                twoCurrenciesConverterController
                                    .fromCurrencyName.value,
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.WHITE_COLOR),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Alerts().endDatePop();
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.MAIN_COLOR,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "End Date",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: AppColors.BLACK_COLOR,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                currenciesFluctuationController
                                    .selectedEndDate.value,
                                style: TextStyle(
                                    fontSize: 15, color: AppColors.WHITE_COLOR),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Here are the results of your currency value compared to other currencies based on the selected time period :",
                    style: TextStyle(color: AppColors.WHITE_COLOR,fontSize: 10),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ),
      body: CurrenciesFluctuationScreenList(),
    );
  }
}
