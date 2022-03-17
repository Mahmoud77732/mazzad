import 'package:flutter/material.dart';
import 'package:mazzad/screens/onboard_screen/on_board_screen.dart';

// take the settings from onGenerateRoute in GetMaterial
class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnBoardScreen.rountName:
        return SlideRoute(page: const OnBoardScreen());

      default:
        return SlideRoute(page: Container());
    }
  }
}

enum SlideDirection { left, up, right, down }

class SlideRoute extends PageRouteBuilder {
  final SlideDirection direction;
  final Widget page;
  SlideRoute({
    this.direction = SlideDirection.left,
    required this.page,
  }) : super(
          pageBuilder: (
            context,
            animation,
            secAnimation,
          ) =>
              page,
          transitionsBuilder: (context, animation, secAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: direction == SlideDirection.left
                  ? const Offset(1, 0)
                  : direction == SlideDirection.right
                      ? const Offset(-1, 0)
                      : direction == SlideDirection.up
                          ? const Offset(0, 1)
                          : const Offset(0, -1),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          ),
        );
}
