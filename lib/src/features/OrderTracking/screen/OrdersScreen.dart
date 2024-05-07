import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:pizza_user_app/src/core/routing/app_routes.dart';
import 'package:pizza_user_app/src/core/utils/colors/app_colors.dart';
import 'package:pizza_user_app/src/features/auth/controller/auth_controller.dart';
import 'package:pizza_user_app/src/features/profile/screen/EditProfileController/ProfileController.dart';

import '../../../core/Network/network_info.dart';
import '../../../core/common_widgets/app_loading.dart';
import '../../profile/domain/model/User.dart';
import '../Controller/OrderTrackingController.dart';
import '../widgets/order_card.dart';
import 'OrderStatusScreen.dart';
import '../model/OrderStatus.dart';

class OrdersScreen extends StatefulWidget {
  bool? isAppBarNeed;

  OrdersScreen({this.isAppBarNeed = false});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (!Get.isRegistered<OrderTrackingController>()) {
      Get.put(OrderTrackingController());
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.put(NetworkInfoController());
      Get.put(OrderTrackingController());

      if (ProfileController.to.user.value.fullName == null) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Please Sign In"),
                  content: Text(
                      "Please Sign In to access your order current status"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel")),
                    TextButton(
                        onPressed: () async {
                          await Get.toNamed(AppRoutes.LOG_IN);

                          Navigator.pop(context);

                          OrderTrackingController.to.getAllOrdersTrakingInfo();
                        },
                        child: Text("Sign In")),
                  ],
                ));
      } else {
        OrderTrackingController.to.getAllOrdersTrakingInfo();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /*
    * Monday te ki hobe ?  ;
    * hole tour e jaitam .Ar hocce na dada .Jibon bedona !!;
    *
    * */

    return Scaffold(
      appBar: widget.isAppBarNeed != null && widget.isAppBarNeed == true
          ? AppBar(
              backgroundColor: AppColors.primaryColor,
              title: Text("Order Tracking"),
            )
          : null,
      body: ProfileController.to.user.value.fullName == null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () async {
                  await Get.toNamed(AppRoutes.LOG_IN);

                  OrderTrackingController.to.getAllOrdersTrakingInfo();

                  setState(() {});
                },
                child: Center(
                  child: Text(
                    "Please Sign In to access your order current status",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          : Container(
              width: Get.width,
              height: Get.height,
              child: Obx(
                () => OrderTrackingController.to.loading.value
                    ? Center(
                        child: AppLoading(),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          OrderTrackingController.to.getAllOrdersTrakingInfo();
                        },
                        child: ListView.separated(
                          reverse: false,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          itemBuilder: (_, int index) {
                            Order? _orderStatus = OrderTrackingController
                                .to.orderTracking?.value.orders?.reversed
                                .elementAt(index);

                            printInfo(
                                info:
                                    "Order created date and time : ${_orderStatus?.createdAt}");

                            var _dateTime =
                                DateTime.parse(_orderStatus?.createdAt ?? "");

                            printInfo(
                                info:
                                    "Order created date and time 2: ${DateFormat('hh:mm a').format(_dateTime)}");

                            return Hero(
                              tag: index.toString(),
                              child: InkWell(
                                onTap: () => Get.to(OrderTackingScreen(
                                  orderId: _orderStatus?.id,
                                  offerId: _orderStatus?.offerId,
                                  orderAddress: _orderStatus?.orderAddress,
                                  orderStatus: _orderStatus?.orderStatusId,
                                  discountPrice: _orderStatus?.discount,
                                  totatlPrice: _orderStatus?.totalAmount,
                                  herokey: index.toString(),
                                )),
                                child: OrdersCard(
                                    orderStatus:
                                        _orderStatus?.orderStatusId.toString(),
                                    createdTime:
                                        DateFormat('hh:mm a').format(_dateTime),
                                    date: _orderStatus?.createdAt,
                                    holderAddress: _orderStatus?.orderAddress,
                                    holderName: "Unknown",
                                    offer: _orderStatus?.offerId,
                                    deliveryCharge:
                                        _orderStatus?.deliveryFee.toString(),
                                    distance: _orderStatus?.distance,
                                    discountPrice: _orderStatus?.discount,
                                    orderId: _orderStatus?.id,
                                    totalPrice: _orderStatus?.totalAmount,
                                    pickUpLocation: _orderStatus?.latValue ==
                                            null
                                        ? null
                                        : LatLng(
                                            double.parse(
                                                _orderStatus?.latValue ?? "0"),
                                            double.parse(
                                                _orderStatus?.longValue ??
                                                    "0"))),
                              ),
                            );
                          },
                          itemCount:
                              OrderTrackingController.to.orderTracking?.value ==
                                      null
                                  ? 0
                                  : OrderTrackingController.to.orderTracking
                                          ?.value.orders?.length ??
                                      0,
                          separatorBuilder: (_, int index) {
                            return Container(
                              height: 10,
                            );
                          },
                        ),
                      ),
              ),
            ),
    );
  }
}
