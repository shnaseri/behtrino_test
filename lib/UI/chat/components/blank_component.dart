import 'package:behtrino_test/constant/const_repository.dart';
import 'package:behtrino_test/constant/string_repository.dart';
import 'package:flutter/material.dart';

class BlankPageComponnet extends StatelessWidget {
  const BlankPageComponnet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(baseOfPathMedia + 'no_chat.png'))),
        ),
        const Text(
          noMessageChatPage,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}