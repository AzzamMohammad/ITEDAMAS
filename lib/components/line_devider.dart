import 'package:flutter/material.dart';
import '../constant.dart';

class LineDev extends StatelessWidget {
  final Color ? lineColor;
  final double ? lineLength;
  final double ? lineThickness;

  LineDev({
    this.lineColor,
    this.lineLength,
    this.lineThickness
   });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: lineLength ?? MediaQuery.of(context).size.width * .5,
        child: Divider(
          color:lineColor ?? Color1,
          thickness: lineThickness ?? 3,
        ),
      ),
    );
  }
}
