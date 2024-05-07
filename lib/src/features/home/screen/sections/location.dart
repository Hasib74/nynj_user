import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:pizza_user_app/generated/assets.dart';
import 'package:pizza_user_app/src/core/common_widgets/app_image_view_widget.dart';
import 'package:pizza_user_app/src/core/utils/colors/app_colors.dart';

import '../../../../core/utils/spaces/AppSpaces.dart';

class ShopLocation extends StatelessWidget {
  const ShopLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "OUR",
              style: Get.textTheme.titleLarge?.copyWith(
                  color: AppColors.redColor, fontWeight: FontWeight.w800),
            ),
            AppSpaces.spaces_width_10,
            Text(
              "LOCATION",
              style: Get.textTheme.titleLarge?.copyWith(
                  color: AppColors.blackColor, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        AppSpaces.spaces_height_15,
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              width: Get.width * 0.9,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 20,
                    blurRadius: 0.5,
                    offset: Offset(0, 0.5), // changes position of shadow
                  ),
                ],
              ),
              child: InkWell(
                onTap: () async {
                  final availableMaps = await MapLauncher.installedMaps;
                  print(
                      availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

                  await availableMaps.first.showMarker(
                      coords: Coords(39.299236, -76.609383),
                      title: "230 Baltinore National Pike Baltimore MD 21229");
                },
                child: GoogleMap(
                  onTap: (value) async {


                    print("Helllooooo");
                    final availableMaps = await MapLauncher.installedMaps;
                    print(
                        availableMaps); // [AvailableMap { mapName: Google Maps, mapType: google }, ...]

                    await availableMaps.first.showMarker(
                        coords: Coords(39.299236, -76.609383),
                        title: "230 Baltinore National Pike Baltimore MD 21229");
                  },
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: false,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(39.299236, -76.609383),
                    zoom: 15,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId("1"),
                      position: LatLng(39.299236, -76.609383),
                    )
                  },
                ),
              )),
        ),
      ],
    );
  }
}
