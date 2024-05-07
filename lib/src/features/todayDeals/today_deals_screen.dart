import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pizza_user_app/src/core/utils/colors/app_colors.dart';

class TodayDealsScreen extends StatelessWidget {
  TodayDealsScreen({super.key, this.title, this.message});

  String? title;

  String? message;

  int randomInt = Random().nextInt(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: randomInt == 1
          ? Color(0xffFDE7EB)
          : randomInt == 2
              ? Color(0xffFDFCD3)
              : Color(0xffFADDE2),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(title ?? "Today Deals"),
      ),
      body: Center(
        child: Text(message ?? "No deals today"),
      ),
    );
  }
}
