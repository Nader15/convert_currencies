import 'package:flutter/material.dart';

import '../../Utils/app_colors.dart';

class CustomCircleProgress extends StatelessWidget {
  const CustomCircleProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  CircularProgressIndicator(
        color: AppColors.MAIN_COLOR,
      ),
    );
  }
}
