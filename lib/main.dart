import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'controllers/copy_text_widget.dart';
import 'pages/home_page.dart';

void main() {
  /// Remove /#/ from url path.
  usePathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Must same with duration in index.html and main.dart
    const durationAnimate = Duration(milliseconds: 400);

    return MaterialApp(
      title: "Dhimas Dewanto's Portofolio",
      theme: ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.black,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Colors.black,
            ),
          ),
        ),
        canvasColor: Colors.yellow,
      ),
      home: const CopyTextWidget(
        child: HomePage(),
      ),
    ).animate().fadeIn(duration: durationAnimate);
  }
}
