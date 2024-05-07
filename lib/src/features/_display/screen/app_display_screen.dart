import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_image_view_widget.dart';
import 'package:pizza_user_app/src/core/utils/colors/app_colors.dart';
import 'package:pizza_user_app/src/features/OrderTracking/screen/OrdersScreen.dart';
import 'package:pizza_user_app/src/features/_display/screen/sections/dislay_app_bar.dart';
import 'package:pizza_user_app/src/features/all_products/screen/all_products_screen.dart';
import 'package:pizza_user_app/src/features/cart/controller/CartController.dart';
import 'package:pizza_user_app/src/features/cart/screen/cart_screen.dart';
import 'package:pizza_user_app/src/features/drawer/app_drawer.dart';
import 'package:pizza_user_app/src/features/favourite/screen/favourite_screen.dart';
import 'package:pizza_user_app/src/features/home/screen/home_screen.dart';
import 'package:pizza_user_app/src/features/order/screen/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_image_view_widget.dart';
import 'package:pizza_user_app/src/core/utils/colors/app_colors.dart';

import '../../../../../generated/assets.dart';
import '../../../../generated/assets.dart';
import '../../../core/firebase_helper/Firebase/FirebaseRepoManeger.dart';
import '../../auth/controller/auth_controller.dart';
import '../../profile/screen/EditProfileController/ProfileController.dart';

part "../screen/sections/display_bottom_bar.dart";


class AppDisplayScreen extends StatefulWidget {
  const AppDisplayScreen({Key? key}) : super(key: key);

  @override
  State<AppDisplayScreen> createState() => AppDisplayScreenState();
}

class AppDisplayScreenState extends State<AppDisplayScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    FavouriteScreen(),
    ProductList(),
    OrdersScreen(),
    CartScreen(),
  ];

  String? redirectionTitle;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Get.arguments != null) {
        redirectionTitle = Get.arguments;
      }

      if (redirectionTitle != null) {
        if (redirectionTitle == "Favourite") {
          setState(() {
            currentIndex = 1;
          });
        } else if (redirectionTitle == "OrderTrackingScreen") {
          setState(() {
            currentIndex = 3;
          });
        } else if (redirectionTitle == "Cart") {
          setState(() {
            currentIndex = 4;
          });
        }
      }

      print("Token ............ ${AuthController.to.token}");
      if (AuthController.to.token != null) {
        ProfileController.to.getUserInfo()?.then((value) async {
          String _deviceToken = await FirebaseRepoManager.fbTokenRepository
              .getFirebaseDeviceToken();

          print("DeviceToken ............ ${_deviceToken}");
          ProfileController.to.saveDeviceToken(_deviceToken);
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(AppColors.primaryColor);
    // FlutterStatusbarcolor.setNavigationBarColor(AppColors.primaryColor);
    // FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    //FlutterStatusbarcolor.setStatusBarColor(AppColors.primaryColor);
    //FlutterStatusbarcolor.setNavigationBarColor(AppColors.primaryColor);
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex != 0) {
          currentIndex = 0;

          setState(() {});

          return false;
        } else {
          exit(0);
        }
      },
      child: Scaffold(
        //  resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffEDF6ED),

        key: scaffoldKey,
        drawer: Drawer(
          child: AppDrawer(
            onHomeButtonClick: () {
              print("On ok button click");
              setState(() {
                currentIndex = 0;
              });
            },
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: DisplayAppBar(
                  scaffoldKey: scaffoldKey,
                ),
              ),
              Positioned.fill(
                top: 120,
                child: SizedBox(
                  child: pages[currentIndex],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: _AppBottomBar(
                  onTabChange: (index) {
                    print("Current Index : ${index}");
                    setState(() {
                      currentIndex = index!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
