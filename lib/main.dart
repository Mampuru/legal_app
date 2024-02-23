import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:legal_app/views/home_view.dart';
import 'package:legal_app/views/legislation_view.dart';

import 'constants.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Legal Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Use dark theme
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: logoPath,
        nextScreen: const HomeView(),
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 250,
      ),
    );
  }
}

