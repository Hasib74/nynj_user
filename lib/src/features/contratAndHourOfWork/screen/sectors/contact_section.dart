import 'package:flutter/material.dart';
import 'package:pizza_user_app/generated/assets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 130,
            child: const Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  Assets.imagesTopBarContractPage,
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
              padding: const EdgeInsets.only(top: 16),
              child: Image.asset(Assets.imagesContactUsCenterCard),
            ),
          )
        ],
      ),
    );
  }
}
