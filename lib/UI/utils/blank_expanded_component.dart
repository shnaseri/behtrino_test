import 'package:flutter/material.dart';

class ExpandedBlank extends StatelessWidget {
  int flex;
  ExpandedBlank({Key? key,this.flex = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(),
    );
  }
}
