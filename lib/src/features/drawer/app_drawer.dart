import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_button.dart';
import 'package:pizza_user_app/src/core/remote/urls/app_urls.dart';
import 'package:pizza_user_app/src/core/utils/colors/app_colors.dart';
import 'package:pizza_user_app/src/core/utils/spaces/AppSpaces.dart';
import 'package:get/get.dart';
import 'package:pizza_user_app/src/features/_display/controller/app_display_controller.dart';
import 'package:pizza_user_app/src/features/_display/screen/app_display_screen.dart';
import 'package:pizza_user_app/src/features/profile/screen/EditProfile.dart';
import 'package:pizza_user_app/src/features/profile/screen/EditProfileController/ProfileController.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/routing/app_routes.dart';
import '../OrderTracking/screen/OrdersScreen.dart';
import '../contratAndHourOfWork/screen/contrat_and_hour_of_work_screen.dart';
import '../profile/domain/model/User.dart';
import '../todayDeals/today_deals_screen.dart';
import 'drawer_controller.dart';

class AppDrawer extends StatelessWidget {
  VoidCallback? onHomeButtonClick;

  AppDrawer({super.key, this.onHomeButtonClick});

  InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    Get.put(AppDrawerController());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpaces.spaces_height_20,
          AppSpaces.spaces_height_20,
          AppSpaces.spaces_height_20,
          Obx(
            () => ProfileController.to.user.value.fullName == null
                ? Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Get.toNamed(AppRoutes.LOG_IN);
                      },
                      child: Text(
                        "Sign in",
                        style: Get.textTheme.titleLarge,
                      ),
                    ),
                  )
                : Container(),
          ),
          _header(context),
          Expanded(child: _items(context)),
        ],
      ),
    );
  }

  _header(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () {
            print("Profile image : ${ProfileController.to.user.value.photo}");
            return ProfileController.to.user.value.photo == null
                ? Container()
                : CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(ApiUrls.download_base_url +
                        ProfileController.to.user.value.photo));
          },
        ),
        AppSpaces.spaces_height_10,
        Obx(
          () => Text(
            ProfileController.to.user.value.fullName ?? "",
            style: Get.textTheme.bodyLarge,
          ),
        ),
        AppSpaces.spaces_height_10,
        Obx(
          () => ProfileController.to.user.value.fullName == null
              ? Container()
              : Center(
                  child: AppButtonWidget(
                    onTab: () {
                      Navigator.pop(context);

                      Get.to(() => EditProfile());
                    },
                    borderRadius: 30,
                    width: 120,
                    title: "Edit Profile",
                    leadingCenter: true,
                  ),
                ),
        ),
      ],
    );
  }

  _items(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(left: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () {
                      if (onHomeButtonClick != null) {
                        onHomeButtonClick!();
                      }
                      Get.back(result: true);

                      AppDrawerController.to.setDrawerItem(DrawerItems.Home);

                      // AppDisplayController.to.
                    },
                    child: Text(
                      "Home",
                      style: Get.textTheme.bodyLarge!.copyWith(
                          color: AppDrawerController.to.drawerItems.value ==
                                  DrawerItems.Home
                              ? AppColors.primaryColor
                              : AppColors.grayColor),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Get.to(() => TodayDealsScreen());
                      AppDrawerController.to
                          .setDrawerItem(DrawerItems.TodayDeals);
                    },
                    child: Text("Today's Deals",
                        style: Get.textTheme.bodyLarge!.copyWith(
                            color: AppDrawerController.to.drawerItems.value ==
                                    DrawerItems.TodayDeals
                                ? AppColors.primaryColor
                                : AppColors.grayColor))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Get.to(() => TodayDealsScreen(
                            title: "My Coupons",
                            message: "No Coupons Available",
                          ));

                      AppDrawerController.to
                          .setDrawerItem(DrawerItems.MyCoupons);
                    },
                    child: Text("My Coupons",
                        style: Get.textTheme.bodyLarge!.copyWith(
                            color: AppDrawerController.to.drawerItems.value ==
                                    DrawerItems.MyCoupons
                                ? AppColors.primaryColor
                                : AppColors.grayColor))),
                TextButton(
                    onPressed: () {
                      Get.to(() => TodayDealsScreen(
                            title: "Reward's",
                            message: "No Reward's Available",
                          ));
                      AppDrawerController.to.setDrawerItem(DrawerItems.Rewards);
                    },
                    child: Text("Reward's",
                        style: Get.textTheme.bodyLarge!.copyWith(
                            color: AppDrawerController.to.drawerItems.value ==
                                    DrawerItems.Rewards
                                ? AppColors.primaryColor
                                : AppColors.grayColor))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Get.to(() => EditProfile());
                      AppDrawerController.to.setDrawerItem(DrawerItems.Profile);
                    },
                    child: Text("My Account",
                        style: Get.textTheme.bodyLarge!.copyWith(
                            color: AppDrawerController.to.drawerItems.value ==
                                    DrawerItems.Profile
                                ? AppColors.primaryColor
                                : AppColors.grayColor))),
                // TextButton(
                //     onPressed: () {},
                //     child: Text("My Profile", style: Get.textTheme.bodyLarge)),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Get.to(() => OrdersScreen(
                            isAppBarNeed: true,
                          ));
                      AppDrawerController.to
                          .setDrawerItem(DrawerItems.MyOrders);
                    },
                    child: Text("My Order Tracking ",
                        style: Get.textTheme.bodyLarge!.copyWith(
                            color: AppDrawerController.to.drawerItems.value ==
                                    DrawerItems.MyOrders
                                ? AppColors.primaryColor
                                : AppColors.grayColor))),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                      // Get.to(() => TodayDealsScreen(
                      //       title: "Contact Us",
                      //       message:
                      //           "Address: 7151 security blvd Baltimore, MD 21227 \n\n Phone : 410-277-4900 \n\n Email : info@wingsandthingspizza.com",
                      //     ));


                      Get.to(()=>ContractAndHourOfWorkScreen());

                      AppDrawerController.to
                          .setDrawerItem(DrawerItems.ContactUs);
                    },
                    child: Text("Contact Us",
                        style: Get.textTheme.bodyLarge!.copyWith(
                            color: AppDrawerController.to.drawerItems.value ==
                                    DrawerItems.ContactUs
                                ? AppColors.primaryColor
                                : AppColors.grayColor))),
                _appReview(),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);

                      /* Get.to(() => TodayDealsScreen(
                            title: "Hours of Operation",
                            message:
                                "Monday - Thursday : 11:00 AM - 10:00 PM \n\n Friday - Saturday : 11:00 AM - 11:00 PM \n\n Sunday : 12:00 PM - 10:00 PM",
                          ));*/

                      Get.to(()=>ContractAndHourOfWorkScreen(isContract: false,));

                      AppDrawerController.to
                          .setDrawerItem(DrawerItems.HoursOfOperation);
                    },
                    child: Text("Hours of Operation",
                        style: Get.textTheme.bodyLarge!.copyWith(
                            color: AppDrawerController.to.drawerItems.value ==
                                    DrawerItems.HoursOfOperation
                                ? AppColors.primaryColor
                                : AppColors.grayColor))),

                TextButton(
                    onPressed: () async {
                      // Get.to(() => TodayDealsScreen(
                      //   title: "Privacy Policy",
                      //   message:
                      //   "Monday - Thursday : 11:00 AM - 10:00 PM \n\n Friday - Saturday : 11:00 AM - 11:00 PM \n\n Sunday : 12:00 PM - 10:00 PM",
                      // ));

                      _launchUrl();

                      AppDrawerController.to
                          .setDrawerItem(DrawerItems.PrivacyPolicy);
                    },
                    child: Text("Trams And Condition, Privacy Policy",
                        style: Get.textTheme.bodyLarge!.copyWith(
                            color: AppDrawerController.to.drawerItems.value ==
                                    DrawerItems.PrivacyPolicy
                                ? AppColors.primaryColor
                                : AppColors.grayColor))),

                AppSpaces.spaces_height_15,
                Obx(
                  () => ProfileController.to.user.value.fullName != null
                      ? InkWell(
                          child: const Text("Sign out"),
                          onTap: () {
                            SharedPreferences.getInstance().then((value) {
                              value.clear();

                              ProfileController.to.user.value = User();

                              Restart.restartApp();
                            });
                          },
                        )
                      : Container(),
                ),
                AppSpaces.spaces_height_15,
                Obx(
                  () => ProfileController.to.user.value.fullName != null
                      ? InkWell(
                          onTap: () {
                            SharedPreferences.getInstance().then((value) {
                              value.clear();

                              ProfileController.to.user.value = User();
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            "Delete Account",
                            style: TextStyle(color: AppColors.redColor),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ));
  }

  _appReview() {
    return FutureBuilder(
        future: inAppReview.isAvailable(),
        builder: (context, AsyncSnapshot<bool> isAvailable) {
          print("isAvailable ${isAvailable.data}");
          if (isAvailable.data == true) {
            return Visibility(
              visible: false,
              child: TextButton(
                  onPressed: () async {
                    if (await inAppReview.isAvailable()) {
                      inAppReview.requestReview();
                    } else {
                      print("In app review not available");
                    }
                    AppDrawerController.to.setDrawerItem(DrawerItems.Feedback);
                  },
                  child: Text("Review/ Feedback",
                      style: Get.textTheme.bodyLarge!.copyWith(
                          color: AppDrawerController.to.drawerItems.value ==
                                  DrawerItems.Feedback
                              ? AppColors.primaryColor
                              : AppColors.grayColor))),
            );
          } else {
            return Container();
          }
        });

    inAppReview.isAvailable().then((value) {
      return Visibility(
        visible: true,
        child: TextButton(
            onPressed: () async {
              if (await inAppReview.isAvailable()) {
                inAppReview.requestReview();
              } else {
                print("In app review not available");
              }
              AppDrawerController.to.setDrawerItem(DrawerItems.Feedback);
            },
            child: Text("Review/ Feedback",
                style: Get.textTheme.bodyLarge!.copyWith(
                    color: AppDrawerController.to.drawerItems.value ==
                            DrawerItems.Feedback
                        ? AppColors.primaryColor
                        : AppColors.grayColor))),
      );
    });

    return Container();
  }

  Future<void> _launchUrl() async {
    String _url =
        "https://docs.google.com/document/d/1-06wa4rVTyy110N1cN2tJ5Tjw7r8QmggzjcQlozVeuA/edit";

    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }
}
