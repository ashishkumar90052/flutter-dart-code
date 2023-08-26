import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdartcode/mock.dart';
import 'package:flutterdartcode/model.dart';
import 'package:flutterdartcode/screens/4.scratch_card.dart/scratch_card.dart';
import 'package:flutterdartcode/screens/8.instagram_stories/insta_stories.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'mini_tutorials/5.cuper_tab_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const MyApp());
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
        theme: ThemeData(useMaterial3: true),
        // theme: ThemeData(
        //   useMaterial3: true,
        //   brightness: Brightness.light,
        //   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        // ),
        // darkTheme: ThemeData(
        //   useMaterial3: true,
        //   brightness: Brightness.dark,
        //   // colorScheme:  ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        // ),
        home: YourScreen(),
        initialBinding: BindingsBuilder(() {
          Get.put(MockTestController());
        }));
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

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
//   initializeDateFormatting().then((_) => runApp(const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) => MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(useMaterial3: true),
//       home: InternetSpeed());
//   //   const VideoPlayerScreen(
//   //       videoUrl:
//   //           'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'),
//   // );
// }
