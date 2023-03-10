import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class MyPasswordFild extends StatelessWidget {

  final double FildWidth ;
  final double FildHeight ;
  final Color ? FildColor;
  final Color ? FildBorderColor;
  final String HintText;
  final Color ? HintTextColor;
  final double ? HintTextSize;
  final Function (String) OnChanged;
  final TextInputType ? KeyboardType;
  var IsHead = true.obs;


  MyPasswordFild({
    required this.FildWidth,
    required this.FildHeight,
    this.FildColor,
    this.FildBorderColor,
    required this.HintText,
    this.HintTextColor,
    this.HintTextSize,
    required this.OnChanged,
    this.KeyboardType
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
      child:
          Obx((){
            return TextFormField(
              onChanged: OnChanged,
              textDirection: TextDirection.rtl,
              cursorColor: Color1,
              obscureText: IsHead.value,
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
                prefixIcon: IconButton(icon:  IsHead.value? Icon(Icons.visibility_off,size: 20,color: Color1,) : Icon(Icons.visibility,size: 20,color: Color1,), onPressed: () { IsHead(!IsHead.value); },),
                contentPadding: EdgeInsets.fromLTRB(0,8,8,8),
              ),

            );
          })


    );
  }
}
