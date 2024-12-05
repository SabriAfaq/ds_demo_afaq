import 'dart:ffi';

import 'package:ds_demo_afaq/utils/constant.dart';
import 'package:ds_demo_afaq/utils/widget_functions.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? width;

  const OptionButton({super.key, this.text, this.width, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: MaterialButton(
        splashColor: COLOR_WHITE.withAlpha(55),
        minWidth: width,
        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color:COLOR_DARK_BLUE ,
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              icon,
              color: COLOR_WHITE,
            ),
            addHorizontalSpace(10),
            Text(
              text!,
              style: TextStyle(color: COLOR_WHITE),
            )
          ],
        ),
      ),
    );
  }
}
