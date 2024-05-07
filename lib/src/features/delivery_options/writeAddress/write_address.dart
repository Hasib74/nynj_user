import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_button.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_text_fields.dart';
import 'package:pizza_user_app/src/core/utils/spaces/AppSpaces.dart';
import 'package:pizza_user_app/src/features/delivery_options/controller/delivery_option_controller.dart';
import 'package:pizza_user_app/src/features/delivery_options/writeAddress/confirm_address.dart';

import '../../../core/routing/app_routes.dart';
import '../../../core/utils/colors/app_colors.dart';
import 'package:get/get.dart';

import '../controller/address_controller.dart';

class WriteAddressScreen extends StatefulWidget {
  const WriteAddressScreen({super.key});

  @override
  State<WriteAddressScreen> createState() => _WriteAddressScreenState();
}

class _WriteAddressScreenState extends State<WriteAddressScreen> {
  bool _isSaved = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Get.put(AddressController(), permanent: true);
  }

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
        title: Text("Add an address"),
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
                  title: "Enter",
                  width: 100,
                  leadingCenter: true,
                  onTab: () {
                    if (AddressController.to.canGoToAddressConfirmPage()) {
                      Get.to(() => WriteConfirmAddressScreen());
                    }
                  }),
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              AppSpaces.spaces_height_15,
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: _saveForFuture(),
              // )
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
        AppSpaces.spaces_height_15,
        CupertinoSwitch(
            value: _isSaved,
            onChanged: (value) {
              setState(() {
                _isSaved = value;
              });
            })
      ],
    );
  }
}
