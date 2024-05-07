import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pizza_user_app/generated/assets.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_image_view_widget.dart';
import 'package:pizza_user_app/src/core/utils/colors/app_colors.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../core/routing/app_routes.dart';
import '../../core/utils/spaces/AppSpaces.dart';
import '../Authentication/SignUp/Controller/SignUpController.dart';
import 'Controller/ServiceTypeController.dart';

class ServiceTypeScreen extends StatefulWidget {
  @override
  _ServiceTypeScreenState createState() => _ServiceTypeScreenState();
}

class _ServiceTypeScreenState extends State<ServiceTypeScreen> {
  //ServiceTypeController? _serviceTypeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  Get.put(ServiceTypeController());
    //  _serviceTypeController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColorForOptions,
      /*  appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.whiteColor,
          ),
        ),
      ),*/
      body: Center(
          child: Container(
        margin: EdgeInsets.symmetric(vertical: 100),
        color: Color(0xffF9FDFF),
        child: Column(
          children: <Widget>[
            Spacer(),
            _lunchLogo(),
            Spacer(),
            _title(),
            Spacer(),
            _appServiceTypes(),
            Spacer(),
          ],
        ),
      )),
    );
  }

  Widget _lunchLogo() {
    return Container(
        // height: 150,
        // width: 150,
        // decoration: BoxDecoration(
        //   shape: BoxShape.circle,
        //   color: Colors.white,
        // ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppImageView(
              size: 160,
              image: Assets.imagesLogo,
              fit: BoxFit.contain,
            ).getImage()));
  }

  Text _title() {
    return Text(
      "Please choose which service do you need.",
      style: TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w800,
        fontSize: 15,
      ),
    );
  }

  Widget _appServiceTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
            onTap: () {
              // goToNextScreen();
              Get.toNamed(AppRoutes.DELIVERY_OPRIONS);
              // Get.to(() => WriteAddressScreen());
            },
            child: Image.asset(
              Assets.imagesOrderFood,
              width: 100,
              height: 100,
            )),

        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.DELIVERY_OPRIONS);

            //    Get.to(() => WriteConfirmAddressScreen());
          },
          child: Image.asset(
            Assets.imagesCatering,
            width: 100,
            height: 100,
          ),
        ),

        //   RingButtonWidget(title: 'Grocery', iconAsset: AppAssets.groceryIcon),
      ],
    );
  }

/*
  goToNextScreen() async {
    // AppConstantData.selectServiceName = await LocalDataSourceController.to.sp.get(LocalKey.user_selected_service_name);

    //_loadController();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    new Future.delayed(const Duration(seconds: 2), () async {
      try {
        Token token = await SignUpController.to.getToken();

        print("Toeknnnnnnnnnnnnnnnn => ${token == null}");
        if (token == null) {
          // Get.toNamed(AppRoutes.SERVICE_TYPE_OPTION);
          Future.delayed(Duration.zero)
              .then((value) => Get.offAllNamed(AppRoutes.LOG_IN));
        } else {
        //  AuthController.to.token = token.token;

          Get.offAllNamed(AppRoutes.DISPLAY);
        }
      } on Exception catch (e) {
        // TODO

        print("SplashScreen Error ::: => ${e.toString()}");
      }
    });
  }
*/

  Widget RingButtonWidget(
          {String? title, String? iconAsset, double buttonSize = 110}) =>
      InkWell(
        child: Container(
          margin: EdgeInsets.all(8),
          width: buttonSize,
          height: buttonSize,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconAsset!,
                width: 50,
                height: 50,
                alignment: Alignment.center,
                color: AppColors.redColor,
              ),
              Text(
                '${title}',
                style: TextStyle(color: AppColors.redColor, fontSize: 15),
              ),
            ],
          ),
        ),
        /* onTap: () {
        //  Get.toNamed(AppRoutes.DISPLAY);
        },*/
      );
}
