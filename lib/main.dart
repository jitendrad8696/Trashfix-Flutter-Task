import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:trashfix/const/color_const.dart';
import 'package:trashfix/const/string_const.dart';
import 'package:trashfix/firebase_options.dart';
import 'package:trashfix/services/auth.dart';
import 'package:trashfix/views/pages/error_page.dart';
import 'package:trashfix/views/pages/home/home.dart';
import 'package:trashfix/views/pages/onboarding/create_profile_page.dart';
import 'package:trashfix/views/pages/onboarding/introduction_page.dart';
import 'package:trashfix/views/pages/waiting_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle()
      .copyWith(statusBarColor: ColorConst.primaryColor));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthController _controller = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConst.appTitle,
      navigatorKey: navigatorKey,
      theme: ThemeData.light().copyWith(
        primaryColor: ColorConst.primaryColor,
      ),
      home: FutureBuilder(
        future: _controller.currentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WaitingPage();
          } else if (snapshot.hasError) {
            return const ErrorPage();
          } else if (!snapshot.hasData) {
            return const IntroductionPage();
          } else if (!_controller.userInfo) {
            return CreateProfilePage();
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }
}
