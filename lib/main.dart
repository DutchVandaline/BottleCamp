import 'package:bottlecamp/Screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Themes/LightTheme.dart';
import 'Themes/DarkTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme().theme,
      darkTheme: DarkTheme().theme,
      home: const MainScreen(),
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: child!,
          )),
    );
  }
}
