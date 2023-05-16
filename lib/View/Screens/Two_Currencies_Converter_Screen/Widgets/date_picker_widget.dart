import 'dart:developer';

import 'package:convert_currencies/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker_theme.dart';
import 'package:flutter_holo_date_picker/widget/date_picker_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Logic/controllers/two_currencies_converter_controller.dart';

class DatePicker extends StatelessWidget {
   DatePicker({Key? key}) : super(key: key);

   final twoCurrenciesConverterController = Get.find<TwoCurrenciesConverterController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Choose Date",style: const TextStyle(fontSize: 20,color: AppColors.MAIN_COLOR),),
        Container(
          width: double.infinity,
          child: DatePickerWidget(
            looping: false, // default is not looping
            firstDate: DateTime(2004, 1, 1),
            lastDate: DateTime.now(),
            initialDate: DateTime.now(),
            dateFormat: "dd/MMMM/yyyy",
            onChange: (DateTime newDate, _) {
              twoCurrenciesConverterController.selectedDate.value = DateFormat('yyyy-MM-dd').format(newDate);
              if(twoCurrenciesConverterController.converterBase.value.isNotEmpty){
                twoCurrenciesConverterController.getCurrenciesConverter();
              }
            },
            pickerTheme: const DateTimePickerTheme(

              backgroundColor: Colors.transparent,
              itemTextStyle: TextStyle(color: Colors.white, fontSize: 19),
              dividerColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
