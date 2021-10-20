
import 'package:behtrino_test/UI/utils/appbars/appbar.dart';
import 'package:behtrino_test/constant/const_repository.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
class AppBarHome extends AppBarWidget{
  const AppBarHome(BuildContext context, {Key? key}) : super(key: key, parentContext: context);

  @override
  List<Widget>? getActions() {
    // TODO: implement getActions
    return [
      const Icon(Icons.search_sharp).paddingRight(30)
    ];
  }

  @override
  getLeading() {
    return  Container(
      margin: EdgeInsets.only(left: 13),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            baseOfPathMedia + 'profile1.png',

          ),
          fit: BoxFit.contain
        )
      ),
    );

  }

  @override
  Widget getTitleWidget() {
    return Container();
  }

}