import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Logic/controllers/currencies_fluctuation_controller.dart';
import '../../../../Logic/controllers/currencies_symbols_controller.dart';
import '../../../../Utils/app_colors.dart';
import '../../../Widgets/custom_circle_progress.dart';

class Alerts {
  final currenciesFluctuationController = Get.find<CurrenciesFluctuationController>();

  Future<bool>? startDatePop() async {
    final result = await Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsets.zero,
      backgroundColor: AppColors.GREY_COLOR,
      content: Column(
        children: [
          Text(
            "Choose Date Range From :",
            style: TextStyle(color: AppColors.WHITE_COLOR),
          ),
          SizedBox(height: 10),
          Container(
            child: DatePickerWidget(
              looping: false,
              // default is not looping
              firstDate: DateTime(2004, 1, 1),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
              dateFormat: "dd/MMMM/yyyy",
              onChange: (DateTime newDate, _) {
                currenciesFluctuationController.selectedStartDate.value =
                    DateFormat('yyyy-MM-dd').format(newDate);
                currenciesFluctuationController.pageNumber = 1;
                currenciesFluctuationController.paginatedCurrenciesFluctuation
                    .clear();
                currenciesFluctuationController.getCurrenciesFluctuation();
              },
              pickerTheme: const DateTimePickerTheme(
                backgroundColor: AppColors.GREY_COLOR,
                itemTextStyle:
                    TextStyle(color: AppColors.WHITE_COLOR, fontSize: 19),
                dividerColor: AppColors.MAIN_COLOR,
              ),
            ),
          )
        ],
      ),
      confirm: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                AppColors.MAIN_COLOR,
              ),
              foregroundColor: MaterialStateProperty.all(
                AppColors.GREY_COLOR,
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "OK",
            ),
          )),
    );
    if (result == null) {
      return false;
    } else {
      return result;
    }
  }

  Future<bool>? endDatePop() async {
    final result = await Get.defaultDialog(
      title: '',
      titlePadding: EdgeInsets.zero,
      backgroundColor: AppColors.GREY_COLOR,
      content: Column(
        children: [
          Text(
            "Choose Date Range To :",
            style: TextStyle(color: AppColors.WHITE_COLOR),
          ),
          SizedBox(height: 10),
          Container(
            child: DatePickerWidget(
              looping: false,
              // default is not looping
              firstDate: DateTime(2004, 1, 1),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
              dateFormat: "dd/MMMM/yyyy",
              onChange: (DateTime newDate, _) {
                currenciesFluctuationController.selectedEndDate.value =
                    DateFormat('yyyy-MM-dd').format(newDate);
                currenciesFluctuationController.paginatedCurrenciesFluctuation.clear();
                currenciesFluctuationController.pageNumber = 1;
                currenciesFluctuationController.getCurrenciesFluctuation();
              },
              pickerTheme: const DateTimePickerTheme(
                backgroundColor: AppColors.GREY_COLOR,
                itemTextStyle:
                    TextStyle(color: AppColors.WHITE_COLOR, fontSize: 19),
                dividerColor: AppColors.MAIN_COLOR,
              ),
            ),
          )
        ],
      ),
      confirm: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(
                AppColors.MAIN_COLOR,
              ),
              foregroundColor: MaterialStateProperty.all(
                AppColors.GREY_COLOR,
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "OK",
            ),
          )),
    );
    if (result == null) {
      return false;
    } else {
      return result;
    }
  }

}
