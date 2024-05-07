import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:pizza_user_app/src/core/firebase_helper/notification/firebase_notification_service.dart';
import 'package:pizza_user_app/src/core/routing/app_routes.dart';
import 'package:pizza_user_app/src/core/utils/colors/app_colors.dart';
import 'package:pizza_user_app/src/features/splash_screen/binding/splash_binding.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   // options: DefaultFirebaseOptions.currentPlatform,
  );

  NotificationService.listenNotificationMessage();
  NotificationService.listenForgroundNotificationMessage();
  NotificationService.listenBackgroundNotificationMessage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      // statusBarIconBrightness: Brightness.light,
      // statusBarBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.primaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
      systemStatusBarContrastEnforced: false,
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRouets(),
      initialRoute: AppRoutes.INITIAL,
      initialBinding: AppSplashBinding(),
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffEDF6ED)),
    );
  }
}
