import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dhimas Dewanto's Portofolio",
      theme: ThemeData(
        textTheme: const TextTheme(
          headline2: TextStyle(
            color: Colors.black,
          )
        ),
        canvasColor: Colors.yellow,
      ),
      home: const HomePage(),
    );
  }
}