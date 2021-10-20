import 'dart:async';

import 'package:behtrino_test/UI/utils/cirucal_progressbar.dart';
import 'package:behtrino_test/constant/color_repository.dart';
import 'package:behtrino_test/constant/path_router_repository.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  startTime() {
    var _duration = const Duration(seconds: 1, milliseconds: 400);
    return Timer(_duration, navigationToHomePage);
  }

  Future<void> navigationToHomePage() async {
    var _prefs = await SharedPreferences.getInstance();
    if(_prefs.containsKey('token')) {
      Navigator.of(context).pushReplacementNamed(homePagePath);
    }
    else {
      Navigator.of(context).pushReplacementNamed(loginPagePath);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height(),
        width: context.width(),
        decoration: const BoxDecoration(color: colorBackGroundPage),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'))),
                  ),
                ),
              ),
            ),
            const CircularProgressBar(),
          ],
        ),
      ),
    );
  }
}
