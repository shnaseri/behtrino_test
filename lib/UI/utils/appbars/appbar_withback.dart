
import 'package:behtrino_test/UI/utils/appbars/appbar.dart';
import 'package:behtrino_test/constant/color_repository.dart';
import 'package:behtrino_test/constant/string_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

class AppBarWithBack extends AppBarWidget{
  AppBarWithBack(BuildContext context, {Key? key}) : super(key: key, parentContext: context);

  @override
  getActions() {
    // TODO: implement getActions
    return [
      const Center(
        child: Text(
          backText,
          style: TextStyle(
              fontWeight: FontWeight.w800
          ),
        ),
      ).paddingRight(7),
      InkWell(
        onTap: (){
          Navigator.pop(parentContext);
        },
        child: CircleAvatar(
          backgroundColor: colorIconBackOfAppBar.withOpacity(0.1),
          child: const Icon(Icons.arrow_forward,color: colorIconBackOfAppBar,)
          ,
        ).paddingRight(10),
      ),

    ];
  }

  @override
  getLeading() {
    // TODO: implement getLeading
    return Container();
  }

  @override
  Widget getTitleWidget() {
    return Container();
  }

}