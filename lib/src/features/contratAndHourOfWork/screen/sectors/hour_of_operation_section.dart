import 'package:flutter/material.dart';
import 'package:pizza_user_app/generated/assets.dart';

class HrOfOperationSection extends StatelessWidget {
  const HrOfOperationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: const Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  Assets.imagesTopBarHrOfOperation,
                )),
          )),
          Positioned(
            top: 50,
            left: 0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                Assets.imagesBack,
                color: Colors.white,
                width: 60,
                height: 20,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Image.asset(Assets.imagesHrOfOperationCenterCard),
            ),
          )
        ],
      ),
    );
  }
}
