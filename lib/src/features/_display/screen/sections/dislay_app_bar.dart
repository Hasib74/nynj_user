import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../generated/assets.dart';
import '../../../../core/common_widgets/app_image_view_widget.dart';
import '../../../all_products/screen/all_products_screen.dart';

class DisplayAppBar extends StatefulWidget {
  GlobalKey<ScaffoldState>? scaffoldKey;

  bool? canBack;

  DisplayAppBar({Key? key, this.scaffoldKey, this.canBack = false})
      : super(key: key);

  @override
  State<DisplayAppBar> createState() => DisplayAppBarState();
}

class DisplayAppBarState extends State<DisplayAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
        color: Color(0xff9A1C20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.canBack ?? false
              ?  Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                )
              : IconButton(
                  padding: EdgeInsets.only(left: 16),
                  onPressed: () {
                    print(
                        "Current Index : ${widget.scaffoldKey?.currentState}");
                    widget.scaffoldKey?.currentState?.openDrawer();
                  },
                  icon: AppImageView(
                    image: Assets.assetsImagesMenu,
                    height: 80,
                    width: 80,
                  ).getImage()),
          Center(
            child: AppImageView(
              image: Assets.imagesLogo,
              height: 80,
              width: 100,
            ).getImage(),
          ),
          IconButton(
              padding: EdgeInsets.only(right: 16),
              onPressed: () {
                Get.to(() => ProductList(
                      forSearch: true,
                    ));
              },
              icon: AppImageView(
                image: Assets.assetsImagesSearch,
                height: 80,
                width: 80,
              ).getImage())
        ],
      ),
    );
  }
}
