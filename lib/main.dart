import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'app/routes/setup_routes.router.dart';
import 'config/color_config.dart';

void main() {
  runZonedGuarded(() {

    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) async {
      setupLocator();
      runApp(const MyApp());
    });
  }, (error, trace) async {

  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskColor = Colors.black.withOpacity(0.5)
      ..maskType = EasyLoadingMaskType.custom
      ..backgroundColor = ColorConfig.accentColor.withAlpha(1)
      ..textColor = Colors.white
      ..indicatorColor = Colors.white;

    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'MindWellness Chat',
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardColor: ColorConfig.accentColor,
        hintColor: ColorConfig.accentColor,
        primaryColor: ColorConfig.primaryColor,
        dividerColor: Colors.black26,
        fontFamily: 'Poppins',
      ),
    );
  }
}