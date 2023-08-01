import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'mini_tutorials/5.cuper_tab_bar.dart';
import 'mini_tutorials/6.location.dart';
import 'mini_tutorials/7.horiz_vert_scroll.dart';

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
        enableLog: true,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: const ScrollContent());
  }
}

class IOSApp extends StatelessWidget {
  const IOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(
            primaryColor: CupertinoColors.black,
            applyThemeToAll: true,
            brightness: Brightness.dark),
        home: SegmentedControlExample());
  }
}
