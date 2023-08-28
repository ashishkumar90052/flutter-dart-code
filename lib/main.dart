import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdartcode/mock.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'iOs/4.navigation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const IOSApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MockTestController());

    return GetMaterialApp(
      enableLog: true,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.light
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          ),
      darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark
          // colorScheme:  ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          ),
      home: YourScreen(),
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
