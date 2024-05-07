import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pizza_user_app/src/core/app_snack_bar/app_snack_bar.dart';
import 'package:pizza_user_app/src/core/database/local/LocalDataSourceController.dart';

class AddressController extends GetxController {
  bool? futureSave = false;

  static AddressController to = Get.find();

  TextEditingController addressController = TextEditingController();
  TextEditingController suiteAprtmentBusinessController =
      TextEditingController();
  TextEditingController deliveryInstructionController = TextEditingController();
  TextEditingController confirmAddressController = TextEditingController();

  bool canGoToAddressConfirmPage() {
    if (addressController.value.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Address is empty");

      return false;
    }

    if (suiteAprtmentBusinessController.value.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Suite/Apartment/Business is empty");

      return false;
    }

    if (deliveryInstructionController.value.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Delivery Instruction is empty");

      return false;
    }

    return true;
  }

  bool confirmAddressValidation() {
    if (addressController.value.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Address is empty");

      return false;
    }

    if (confirmAddressController.value.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Confirm Address is empty");

      return false;
    }

    if (suiteAprtmentBusinessController.value.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Suite/Apartment/Business is empty");

      return false;
    }

    if (deliveryInstructionController.value.text.isEmpty) {
      AppSnackBar.errorSnackbar(msg: "Delivery Instruction is empty");

      return false;
    }

    if (futureSave == true) {
      Map<String, dynamic> _map = {};

      _map["address"] = addressController.value.text;
      _map["confirmAddress"] = confirmAddressController.value.text;
      _map["suiteAprtmentBusiness"] =
          suiteAprtmentBusinessController.value.text;
      _map["deliveryInstruction"] = deliveryInstructionController.value.text;

      LocalDataSourceController.to.saveAddress(_map);

      LocalDataSourceController.to.getAddress();
    }

    return true;
  }
}
