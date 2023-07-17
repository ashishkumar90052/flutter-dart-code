import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdartcode/screens/9.onboarding/onboarding.dart';
import 'package:flutterdartcode/screens/9.swipe_to_pay/swipe_button.dart';

import 'mini_tutorials/1. retrive_text.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        home: const MyCustomForm());
  }
}
