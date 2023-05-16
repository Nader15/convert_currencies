import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_colors.dart';

class ThemeServices {
  final lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(

        ),
    primaryTextTheme: ThemeData.light().textTheme.apply(

        ),
    scaffoldBackgroundColor: AppColors.WHITE_COLOR,
    appBarTheme: AppBarTheme(
      color: AppColors.MAIN_COLOR,
      foregroundColor: AppColors.WHITE_COLOR,
    ),
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.GREY_COLOR,
    ),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: AppColors.WHITE_COLOR),
        backgroundColor: AppColors.BLACK_COLOR),
    cardTheme: CardTheme(
      color: AppColors.GREY_COLOR,
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: AppColors.WHITE_COLOR),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.WHITE_COLOR,
    ),
    dividerColor: Colors.black12,
  );
}
