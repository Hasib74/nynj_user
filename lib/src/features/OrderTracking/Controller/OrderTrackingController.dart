import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/Error/failures.dart';
import '../data/OrderTrackingRepository.dart';
import '../model/OrderDetails.dart';
import '../model/OrderStatus.dart';

class OrderTrackingController extends GetxController {
  static OrderTrackingController to = Get.find();

  OrderTrackingRepository _orderTrackingRepository =
      new OrderTrackingRepository();

  Rx<OrderStatus>? orderTracking = new OrderStatus().obs;
  Rx<OrderedProductListDetailsModel> orderDetails =
      new OrderedProductListDetailsModel().obs;

  RxBool loading = false.obs;

  TextEditingController reviewController = new TextEditingController();

  getOrderStatus() async {}

  @override
  void onInit() {
    super.onInit();
  }

  getAllOrdersTrakingInfo() async {
    Future.delayed(Duration.zero).then((value) {
      loading(true);
    });

    orderTracking?.value = OrderStatus();

    Either<dynamic, Failure>? response =
        await _orderTrackingRepository.orderTracking();

    response?.fold((l) {
      print("Left ===>  ${l.body}");

      loading.value = false;

      orderTracking?.value = OrderStatus.fromJson(jsonDecode(l.body));
    }, (r) {
      loading.value = false;

      print("Right ${r}");
    });
  }

  getOrderDetails({@required int? orderId}) async {
    loading.value = true;

    print("Order details product id ${orderId}");
    Either<dynamic, Failure> response =
        await _orderTrackingRepository.orderDetailsProductList(orderId ?? 0);

    response.fold((l) {
      print("Order details Left ===>  ${l.body}");

      loading.value = false;

      orderDetails.value =
          OrderedProductListDetailsModel.fromJson(jsonDecode(l.body));
    }, (r) {
      loading.value = false;

      print("Order details Right ${r}");
    });
  }

  double totalPrice() {
    double _price = 0;

    printInfo(
        info:
            "Order details order data list ${orderDetails.value.productDetails}");

    try {
      if (orderDetails.value.message != null) {
        orderDetails.value.message?.orderDetails?.forEach((e) {
          printInfo(
              info: "order details price cal { ${e.amount} * ${e.quantity} }");

          _price += e.quantity! * double.parse(e.amount);
        });
      }
    } on Exception catch (e) {
      // TODO

      printInfo(info: "Order details error  ${e.toString()}");
    }

    printInfo(info: "Order details total price ${_price}");

    return _price;
  }
}
