import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_image_view_widget.dart';
import 'package:pizza_user_app/src/core/utils/spaces/AppSpaces.dart';
import 'package:pizza_user_app/src/features/delivery_options/writeAddress/write_address.dart';

import '../../../generated/assets.dart';
import '../../core/routing/app_routes.dart';
import '../../core/utils/colors/app_colors.dart';

class DeliveryOptions extends StatelessWidget {
  const DeliveryOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AppColors.whiteColor,
      appBar: AppBar(

        backgroundColor: AppColors.primaryColor,
        elevation: 0,
       /* leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.whiteColor,
          ),
        ),*/
        title: Text(
          "Delivery Options",
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                iconSize: 80,
                onPressed: () {
                  Get.to(() => WriteAddressScreen());
                },
                icon: AppImageView(
                  image: Assets.imagesDelivery,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ).getImage()),
            AppSpaces.spaces_width_15,
            IconButton(
              iconSize: 80,
              onPressed: () {
                Get.toNamed(AppRoutes.DISPLAY);
              },
              icon: AppImageView(
                image: Assets.imagesPickUp,
                width: 200,
                height: 200,
              ).getImage(),
            )
          ],
        ),
      ),
    );
  }
}
