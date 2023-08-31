import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdartcode/screens/9.notification/local_notification.dart';
import 'package:get/get.dart';
import 'iOs/4.navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),

      // themeMode: ThemeMode.system, // Set theme based on system
      // theme: ThemeData(
      //   useMaterial3: true,
      //   primaryColor: kRed,
      //   // brightness: Brightness.light,
      //   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      // ),
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   primaryColor: kRed,
      //   // brightness: Brightness.dark,
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      // ),

      home: const LocalNotifications(),
      // initialBinding: BindingsBuilder(() {
      //   Get.put(MockTestController());
      // })
    );
  }
}

class IOSApp extends StatelessWidget {
  const IOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
            primaryColor: CupertinoColors.white,
            applyThemeToAll: true,
            brightness: Brightness.dark),
        home: SliverNavBarExample());
  }
}
