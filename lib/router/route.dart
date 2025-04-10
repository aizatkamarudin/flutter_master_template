import 'package:flutter/material.dart';
import 'package:flutter_master_template/features/home/home.dart';
import 'package:flutter_master_template/features/login/login_1.dart';
import 'package:flutter_master_template/features/login/login_2.dart';
import 'package:flutter_master_template/router/router_constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case loginScreen1Route:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen1(),
      );
    case loginScreen2Route:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen2(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  }
}
