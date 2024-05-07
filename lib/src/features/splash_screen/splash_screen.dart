import 'package:flutter/material.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_image_view_widget.dart';
import 'package:pizza_user_app/src/core/utils/colors/app_colors.dart';

import '../../../generated/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redColor,
      body: Center(
          child: AppImageView(
        image: Assets.imagesLogo,

        fit: BoxFit.contain,
      ).getImage()),
    );
  }
}
