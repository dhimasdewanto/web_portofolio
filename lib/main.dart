import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'controllers/copy_text_widget.dart';
import 'pages/home_page.dart';
import 'pages/projects_page.dart';

const String goHome = "/";
const String goProjects = "/projects";

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: goHome,
      builder: (context, state) => const CopyTextWidget(
        child: HomePage(),
      ),
    ),
    GoRoute(
      path: goProjects,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: const CopyTextWidget(
            child: ProjectsPage(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
        );
      },
    ),
  ],
);

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

    return MaterialApp.router(
      title: "Dhimas Dewanto's Portofolio",
      routerConfig: _router,
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
    ).animate().fadeIn(duration: durationAnimate);
  }
}
