import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pizza_user_app/generated/assets.dart';
import 'package:pizza_user_app/src/core/utils/colors/app_colors.dart';
import 'package:pizza_user_app/src/features/contratAndHourOfWork/screen/sectors/contact_section.dart';
import 'package:pizza_user_app/src/features/contratAndHourOfWork/screen/sectors/hour_of_operation_section.dart';

class ContractAndHourOfWorkScreen extends StatelessWidget {
  final bool? isContract;

  ContractAndHourOfWorkScreen({super.key, this.isContract = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isContract! ? ContactSection() : HrOfOperationSection());
  }
}
