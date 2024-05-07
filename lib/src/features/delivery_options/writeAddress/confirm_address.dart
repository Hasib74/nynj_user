import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_button.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_text_fields.dart';
import 'package:pizza_user_app/src/core/utils/spaces/AppSpaces.dart';
import 'package:pizza_user_app/src/features/delivery_options/controller/address_controller.dart';

import '../../../core/routing/app_routes.dart';
import '../../../core/utils/colors/app_colors.dart';
import 'package:get/get.dart';

import '../controller/delivery_option_controller.dart';

class WriteConfirmAddressScreen extends StatefulWidget {
  const WriteConfirmAddressScreen({super.key});

  @override
  State<WriteConfirmAddressScreen> createState() =>
      _WriteConfirmAddressScreenState();
}

class _WriteConfirmAddressScreenState extends State<WriteConfirmAddressScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.close)),
        backgroundColor: AppColors.primaryColor,
        title: Text("Confirm address"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          //height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              _textFiledWithLavel(
                  lavel: "Address",
                  controller: AddressController.to.addressController),
              AppSpaces.spaces_height_15,
              _textFiledWithLavel(
                  lavel: "Confirm Address",
                  controller: AddressController.to.confirmAddressController),
              AppSpaces.spaces_height_15,
              _textFiledWithLavel(
                  lavel: "Suite/Apartment/Business",
                  controller:
                      AddressController.to.suiteAprtmentBusinessController),
              AppSpaces.spaces_height_15,
              _textFiledWithLavel(
                  lavel: "Delivery Instructions",
                  controller:
                      AddressController.to.deliveryInstructionController),
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              AppButtonWidget(
                  title: "Confirm Address",
                  //      width: 140,
                  leadingCenter: true,
                  onTab: () {
                    if (AddressController.to.confirmAddressValidation()) {
                      Get.toNamed(AppRoutes.DISPLAY);
                    }
                  }),
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              Align(
                alignment: Alignment.bottomCenter,
                child: _saveForFuture(),
              )
            ],
          ),
        ),
      ),
    );
  }

  _textFiledWithLavel({String? lavel, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            lavel ?? "",
            style: Get.textTheme.titleMedium,
          ),
        ),
        AppSpaces.spaces_height_10,
        AppTextFieldWidget(
          controller: controller,
        ),
      ],
    );
  }

  _saveForFuture() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Save this address for future use",
          style: Get.textTheme.titleMedium!
              .copyWith(color: AppColors.primaryColor),
        ),
        AppSpaces.spaces_width_10,
        CupertinoSwitch(
          value: AddressController.to.futureSave ??false,
          onChanged: (bool? value) {
            print("Value is ${value}");
            AddressController.to.futureSave = value ?? false;
            setState(() {});
          },
        )
      ],
    );
  }
}
