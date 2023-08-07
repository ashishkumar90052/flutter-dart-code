import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdartcode/speed/internet_speed.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/date_symbol_data_local.dart';
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//         enableLog: true,
//         title: 'Flutter Demo',
//         themeMode: ThemeMode.dark,
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           useMaterial3: true,
//           brightness: Brightness.light,
//           // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
//         ),
//         darkTheme: ThemeData(
//           useMaterial3: true,
//           brightness: Brightness.dark,
//           // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
//         ),
//         home: const ScrollContent());
//   }
// }

// class IOSApp extends StatelessWidget {
//   const IOSApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CupertinoApp(
//         debugShowCheckedModeBanner: false,
//         theme: CupertinoThemeData(
//             primaryColor: CupertinoColors.black,
//             applyThemeToAll: true,
//             brightness: Brightness.dark),
//         home: SegmentedControlExample());
//   }
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: InternetSpeed());
  //   const VideoPlayerScreen(
  //       videoUrl:
  //           'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'),
  // );
}
