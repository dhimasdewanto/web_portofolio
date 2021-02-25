import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SharedAxisRouteBuilder extends PageRouteBuilder {
  SharedAxisRouteBuilder({
    required Widget page,
    required SharedAxisTransitionType transitionType,
  }) : super(
          pageBuilder: (
            context,
            primaryAnimation,
            secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            context,
            primaryAnimation,
            secondaryAnimation,
            child,
          ) {
            return SharedAxisTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: transitionType,
              child: child,
            );
          },
        );
}
