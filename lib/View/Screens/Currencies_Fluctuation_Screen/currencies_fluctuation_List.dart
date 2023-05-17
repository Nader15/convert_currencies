import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/controllers/currencies_fluctuation_controller.dart';
import '../../../Logic/controllers/currencies_symbols_controller.dart';
import '../../../Logic/controllers/two_currencies_converter_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../Widgets/custom_circle_progress.dart';

class CurrenciesFluctuationScreenList extends StatelessWidget {
  CurrenciesFluctuationScreenList({Key? key}) : super(key: key);
  final currenciesFluctuationController =
      Get.find<CurrenciesFluctuationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (currenciesFluctuationController
          .isLoadingCurrenciesFluctuation.value) {
        return const CustomCircleProgress();
      } else {
        return ListView.separated(
          padding: const EdgeInsets.all(15),
          controller: currenciesFluctuationController.scrollController.value,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: currenciesFluctuationController
              .paginatedCurrenciesFluctuation.length +
              1,
          itemBuilder: (context, index) {
            return Obx(() {
              if (index ==
                  currenciesFluctuationController
                      .paginatedCurrenciesFluctuation.length) {
                if (currenciesFluctuationController
                    .isLoadingPagination.value) {
                  return const CustomCircleProgress();
                } else {
                  return Container(); // Empty container when not loading
                }
              } else {
                final data = currenciesFluctuationController
                    .paginatedCurrenciesFluctuation[index];
                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.GREY_COLOR),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Start",
                            style: TextStyle(
                              color: AppColors.WHITE_COLOR,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${data.startRate.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: AppColors.WHITE_COLOR,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.MAIN_COLOR,
                        child: Text(
                          "${data.currency}",
                          style: TextStyle(
                              color: AppColors.GREY_COLOR,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "End",
                            style: TextStyle(
                              color: data.endRate > data.startRate
                                  ? AppColors.RED_COLOR
                                  : AppColors.BLUE_COLOR,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "${data.endRate.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: data.endRate > data.startRate
                                      ? AppColors.RED_COLOR
                                      : AppColors.BLUE_COLOR,
                                ),
                              ),
                              data.endRate != data.startRate?Icon(
                                data.endRate > data.startRate
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward,
                                color: data.endRate > data.startRate
                                    ? AppColors.RED_COLOR
                                    : AppColors.BLUE_COLOR,
                                size: 15,
                              ):SizedBox(),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
            });
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
        );
      }
    });
  }
}
