import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const TrekNepalApp());

class TrekNepalApp extends StatelessWidget {
  const TrekNepalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrekNepal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: kPrimary,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}