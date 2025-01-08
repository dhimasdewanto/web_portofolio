import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'pages/home_page.dart';

void main() {
  /// Remove /#/ from url path.
  usePathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Must same with duration in index.html and main.dart
    const durationAnimate = Duration(milliseconds: 400);

    return MaterialApp(
      title: "Dhimas Dewanto's Portofolio",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.yellow,
      ),
      home: const HomePage(),
    ).animate().fadeIn(duration: durationAnimate);
  }
}
