import 'package:behtrino_test/UI/utils/appbars/appbar.dart';
import 'package:behtrino_test/constant/color_repository.dart';
import 'package:behtrino_test/constant/const_repository.dart';
import 'package:behtrino_test/constant/string_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/src/extensions/widget_extensions.dart';

class AppBarTitleProfile extends AppBarWidget{
  final String title;
  final BuildContext context;
  final int index;
  final Function functionBack;
  AppBarTitleProfile(this.context, this.index, {Key? key, required this.title,required this.functionBack}) : super(key: key, parentContext: context);

  @override
  Widget getTitleWidget() {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: Theme.of(context).textTheme.headline6!.fontSize!*0.8
      ),
    );
  }


  @override
  getActions() {
    // TODO: implement getActions
    return [
      const Center(
        child: Text(
          backText,
          style: TextStyle(
              fontWeight: FontWeight.w900
          ),
        ),
      ).paddingRight(7),
      InkWell(
        onTap: (){
          Navigator.pop(parentContext);
          functionBack();
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
    return  Container(
      margin: const EdgeInsets.only(left: 13),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(
                baseOfPathMedia + 'profile${index+1}.png',

              ),
              fit: BoxFit.contain
          )
      ),
    );

  }


}