import 'dart:developer';

import 'package:convert_currencies/Routes/routes.dart';
import 'package:convert_currencies/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Logic/controllers/two_currencies_converter_controller.dart';
import '../../Widgets/custom_circle_progress.dart';
import 'Widgets/date_picker_widget.dart';

class TwoCurrenciesConverterScreen extends StatelessWidget {
  TwoCurrenciesConverterScreen({Key? key}) : super(key: key);

  final twoCurrenciesConverterController = Get.find<TwoCurrenciesConverterController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          backgroundColor: AppColors.BLACK_COLOR,
          appBar: AppBar(
            backgroundColor: AppColors.BLACK_COLOR,
            title: const Text("Converter"),
          ),
          body: Obx(() {
            return Stack(
              children: [
                SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: (){
                                      twoCurrenciesConverterController.fromCurrencyNameSelected(true);
                                      twoCurrenciesConverterController.toCurrencyNameSelected(false);
                                      Get.toNamed(Routes.currenciesSymbolsScreen);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: twoCurrenciesConverterController.fromCurrencyNameSelected.value?AppColors.MAIN_COLOR:AppColors.GREY_COLOR,
                                          borderRadius: BorderRadius.circular(20)),
                                      child:  Text(
                                        twoCurrenciesConverterController.fromCurrencyName.value,
                                        style: const TextStyle(
                                            fontSize: 20, color: AppColors.WHITE_COLOR),
                                      ),
                                    ),
                                  ),),
                              const SizedBox(width: 2),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: AppColors.GREY_COLOR,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Text(
                                            "From",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: AppColors.MAIN_COLOR),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: TextFormField(
                                            onChanged: (value){

                                              twoCurrenciesConverterController.converterBase.value = value;
                                              log(twoCurrenciesConverterController.converterBase.value);
                                              if(twoCurrenciesConverterController.converterBase.value!="") {
                                                twoCurrenciesConverterController.getCurrenciesConverter();
                                              }else{
                                                twoCurrenciesConverterController.converterResult.value = 0.0;
                                              }
                                            },
                                            controller: twoCurrenciesConverterController.fromCurrency.value,

                                            keyboardType: TextInputType.number,
                                            cursorColor: AppColors.MAIN_COLOR,
                                            style: const TextStyle(
                                              color: AppColors.WHITE_COLOR,
                                              fontSize: 30,
                                            ),
                                            textAlign: TextAlign.right,
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.symmetric(
                                                    vertical: 0, horizontal: 5),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: AppColors.WHITE_COLOR
                                                            .withOpacity(0.05)),
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color: AppColors.WHITE_COLOR),
                                                    borderRadius:
                                                    BorderRadius.circular(10))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: (){
                                      twoCurrenciesConverterController.toCurrencyNameSelected(true);
                                      twoCurrenciesConverterController.fromCurrencyNameSelected(false);
                                      Get.toNamed(Routes.currenciesSymbolsScreen);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          color: twoCurrenciesConverterController.toCurrencyNameSelected.value?AppColors.MAIN_COLOR:AppColors.GREY_COLOR,
                                          borderRadius: BorderRadius.circular(20)),
                                      child:  Text(
                                        twoCurrenciesConverterController.toCurrencyName.value,
                                        style: const TextStyle(
                                            fontSize: 20, color: AppColors.WHITE_COLOR),
                                      ),
                                    ),
                                  )),
                              const SizedBox(width: 2),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: AppColors.GREY_COLOR,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Text(
                                            "To",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: AppColors.MAIN_COLOR),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            // color: AppColors.MAIN_COLOR,
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "${twoCurrenciesConverterController.converterResult.value}",
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  color: AppColors.WHITE_COLOR),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          )
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                          const SizedBox(height: 50),
                          DatePicker(),
                        ],
                      ),
                    )),
                if(twoCurrenciesConverterController.isLoadingCurrenciesConverter.value)
                const CustomCircleProgress()
              ],
            );
          })),
    );
  }
}
