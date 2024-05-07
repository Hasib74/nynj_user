import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../features/PickCurrentLocation/Controller/PickCurrentLocationController.dart';
import '../../../utils/colors/app_colors.dart';

/*PickCurrentLocationController _pickCurrentLocationController = Get.find();*/

class PickCurrentLocationScreen extends StatefulWidget {
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  State<PickCurrentLocationScreen> createState() =>
      _PickCurrentLocationScreenState();
}

class _PickCurrentLocationScreenState extends State<PickCurrentLocationScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    PickCurrentLocationController.to.pickLocationGoogleMapcontroller.future
        .then((value) {
      value.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    Get.put(PickCurrentLocationController(), permanent: true);

    PickCurrentLocationController.to.getCurrentLocation();

    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Obx(() => Text("${PickCurrentLocationController.to.latlng.value}")),
            Expanded(
              child: Obx(() => Stack(
                    children: [
                      GoogleMap(

                          // all the other arguments
                          initialCameraPosition: CameraPosition(
                            zoom: 10.0,
                            target:
                                PickCurrentLocationController.to.latlng.value,
                          ),
                          markers: {
                            Marker(
                              markerId: MarkerId("userPositionId"),
                              position:
                                  PickCurrentLocationController.to.latlng.value,
                              icon: BitmapDescriptor.defaultMarker,
                            )
                          },
                          myLocationButtonEnabled: false,
                          myLocationEnabled: true,
                          onMapCreated: (GoogleMapController controller) {
                            PickCurrentLocationController
                                .to.pickLocationGoogleMapcontroller
                                .complete(controller);
                          },
                          onTap: (latLng) {
                            print('${latLng.latitude}, ${latLng.longitude}');

                            PickCurrentLocationController.to.latlng.value =
                                LatLng(latLng.latitude, latLng.longitude);
                            /*Get.back(result: LatLng(latLng.latitude, latLng.longitude));*/
                          }),
                      _next_button(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  _next_button() {
    return Positioned(
      bottom: 10,
      right: 10,
      child: InkWell(
        onTap: () =>
            Get.back(result: PickCurrentLocationController.to.latlng.value),
        child: Container(
          width: 60,
          height: 25,
          child: Center(
            child: Text(
              "Next",
              style: Get.textTheme.bodyText1!.copyWith(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
