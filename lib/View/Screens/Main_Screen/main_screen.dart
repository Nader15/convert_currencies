import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../Logic/controllers/main_controller.dart';
import '../../../Routes/routes.dart';
import '../../../Utils/app_colors.dart';

class MainScreen extends StatelessWidget {
  final mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          // selectedIconTheme: const IconThemeData(size: 30),
          backgroundColor: AppColors.GREY_COLOR,
          selectedItemColor: AppColors.MAIN_COLOR,
          unselectedItemColor: AppColors.WHITE_COLOR,
          currentIndex: mainController.currentIndex.value,
          onTap: (index) {
            mainController.currentIndex.value = index;
            if (mainController.pageController.hasClients) {
              mainController.pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease);
            }
            if (mainController.currentIndex.value == 2) {}
          },
          items:  [
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/converter2_icon.svg",height: 30,color: mainController.currentIndex.value == 0?AppColors.MAIN_COLOR:AppColors.WHITE_COLOR),
              label: '',
            ),
            BottomNavigationBarItem(
              icon:SvgPicture.asset("assets/icons/two_dates_icon.svg",height: 30,color: mainController.currentIndex.value == 1?AppColors.MAIN_COLOR:AppColors.WHITE_COLOR),
              label: '',
            ),
          ],
        ),
        body: IndexedStack(
          index: mainController.currentIndex.value,
          children: mainController.tabs,
        ),
      );
    });
  }
}
