import 'package:flutter/material.dart';
import 'package:flutter_proyecto/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tyfon',
      theme: ThemeData(
        unselectedWidgetColor:Colors.white,
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white70,
          displayColor: Colors.white70,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Palette.kToDark,
        ).copyWith(
          secondary: Palette.kToDark[50],
        ),
        scaffoldBackgroundColor: const Color(0xff13121D),
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Palette {
  static MaterialColor kToDark = const MaterialColor(
    0xffF4A53C, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff13121D), //10%
      100: Color(0xffb74c3a), //20%
      200: Color(0xffa04332), //30%
      300: Color(0xff89392b), //40%
      400: Color(0xff733024), //50%
      500: Color(0xff5c261d), //60%
      600: Color(0xff451c16), //70%
      700: Color(0xff2e130e), //80%
      800: Color(0xff170907), //90%
      900: Color(0xff000000), //100%
    },
  );
} // you ca
