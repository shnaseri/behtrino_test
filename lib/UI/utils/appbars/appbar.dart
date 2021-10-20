
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final BuildContext parentContext;

  const AppBarWidget({Key? key, required this.parentContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;

    return AppBar(
      toolbarHeight: height * 0.1,
      automaticallyImplyLeading: true,
      elevation: 0,
      title: getTitleWidget(),
      centerTitle: true,
      // excludeHeaderSemantics: true,
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xffd0dee9),
      leading: getLeading(),
      actions: getActions(),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(MediaQuery
          .of(parentContext)
          .size
          .height * 0.1);

  List<Widget>? getActions();

  Widget? getLeading();

  Widget getTitleWidget() ;


}