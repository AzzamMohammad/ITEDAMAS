import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class GoButton extends StatelessWidget {
  final double Width,Height;
  final double ? ButtomNameSize;
  final Color ? ButtonColor ;
  final Color ? ButtonNameColor;
  final String ButtonName;
  final Function() OnTap;


  GoButton({
    required this.Width,
    required this.Height,
    this.ButtonColor,
    required this.ButtonName,
    this.ButtomNameSize,
    this.ButtonNameColor,
    required this.OnTap,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: Container(
        width: Width,
        height: Height,
        decoration: BoxDecoration(
          color: ButtonColor ?? Color1,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child:
          Text(
            ButtonName,

            style: TextStyle(
              color: ButtonNameColor ?? Color4,
              fontSize: ButtomNameSize ?? 30,

            ),

          ),
        ),

      ),

    );
  }
}
