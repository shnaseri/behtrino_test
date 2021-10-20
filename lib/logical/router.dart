import 'package:behtrino_test/UI/authentication/login/login_page.dart';
import 'package:behtrino_test/UI/authentication/otp/otp_page.dart';
import 'package:behtrino_test/UI/home/main_page.dart';
import 'package:behtrino_test/UI/splash/splash_page.dart';
import 'package:behtrino_test/constant/path_router_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const SplashPage());

      case homePagePath:
        return MaterialPageRoute(builder: (context) => const MainPage());
      case loginPagePath:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case otpPagePath:
        return MaterialPageRoute(builder: (context) => const OTPPage());
      default:
        return null;
    }
  }
}
