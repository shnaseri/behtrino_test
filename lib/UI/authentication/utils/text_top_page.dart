import 'package:behtrino_test/constant/string_repository.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class TextTopOfPage extends StatelessWidget {
  const TextTopOfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        titleOfLoginPage,
        textDirection: TextDirection.rtl,
        style: primaryTextStyle(
            size:
            Theme.of(context).textTheme.headline2?.fontSize!.toInt() ?? 50,
            weight: FontWeight.w600),
      ),
    );
  }
}
