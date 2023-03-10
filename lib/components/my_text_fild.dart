import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class MyTextFild extends StatelessWidget {

  final double FildWidth ;
  final double FildHeight ;
  final Color ? FildColor;
  final Color ? FildBorderColor;
  final String HintText;
  final Color ? HintTextColor;
  final double ? HintTextSize;
  final Function (String) OnChanged;
  final TextInputType ? KeyboardType;
  final Icon ? IconFild;

  MyTextFild({
    required this.FildWidth,
    required this.FildHeight,
    this.FildColor,
    this.FildBorderColor,
    required this.HintText,
    this.HintTextColor,
    this.HintTextSize,
    required this.OnChanged,
     this.KeyboardType,
    this.IconFild,
});


  @override
  Widget build(BuildContext context) {
    return  Container(
      width: FildWidth,
      height: FildHeight,
      decoration: BoxDecoration(
        color:FildColor ??Color1,
        border: Border(
          top: BorderSide(color:FildBorderColor ?? Color1,width: 2,),
          bottom: BorderSide(color: FildBorderColor ?? Color1,width: 2),
          left: BorderSide(color: FildBorderColor ?? Color1,width: 2),
          right: BorderSide(color: FildBorderColor ?? Color1,width: 2),
        ),
      ),
      child: TextFormField(
        onChanged: OnChanged,
        textDirection: TextDirection.rtl,
        cursorColor: Color1,
        keyboardType: KeyboardType ?? TextInputType.text,
        style: TextStyle(
          color: Color1,
          fontSize:HintTextSize ?? 17,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: HintText,
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(
              color: HintTextColor ?? Color1
          ),
          contentPadding: EdgeInsets.fromLTRB(20,8,8,8),
        ),
      ),

    );
  }
}
