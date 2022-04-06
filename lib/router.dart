import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mazzad/screens/Bidders/main_bidders.dart';
import 'package:mazzad/screens/SignUp/signup_screen.dart';
import 'package:mazzad/screens/auction%20details/auction_details_screen.dart';
import 'package:mazzad/screens/auctions/auctions.dart';
import 'package:mazzad/screens/categories/categories_screen.dart';
import 'package:mazzad/screens/home/home_screen.dart';
import 'package:mazzad/screens/login/login_screen.dart';
import 'package:mazzad/screens/otb/otb_screen.dart';
import 'package:mazzad/screens/profile/profile_screen.dart';
import './screens/onboard/on_board_screen.dart';

// take the settings from onGenerateRoute in GetMaterial
class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnBoardScreen.rountName:
        return SlideRoute(page: const OnBoardScreen());
      case OTPScreen.routeName:
        return SlideRoute(page: const OTPScreen());
      case LoginScreen.routeName:
        return SlideRoute(page: LoginScreen());
      case SignupScreen.routeName:
        return SlideRoute(page: SignupScreen());
      case ProfileScreen.routeName:
        return SlideRoute(page: ProfileScreen());
      case HomeScreen.routeName:
        return SlideRoute(page: HomeScreen());
      case CategoriesScreen.routeName:
        return SlideRoute(page: CategoriesScreen());
      case AuctionsScreen.routeName:
        return SlideRoute(page: AuctionsScreen());
      case AuctionDetailsScreen.routeName:
        return SlideRoute(page: AuctionDetailsScreen());
      case MainBidders.routeName:
        return SlideRoute(page: MainBidders());
      default:
        return SlideRoute(page: HomeScreen());
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
