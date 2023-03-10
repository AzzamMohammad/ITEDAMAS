import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../constant.dart';


AlertStyle MyStyleAlert(bool HaveCloseButton , bool CloseIFClickOut , bool ButtonVisible,Color OverlayColor,Color BackgroundColor){
  return AlertStyle(
      backgroundColor: BackgroundColor,
      animationType: AnimationType.grow,
      isCloseButton: HaveCloseButton,
      isButtonVisible: ButtonVisible,
      isOverlayTapDismiss: CloseIFClickOut,
      descStyle: TextStyle(fontWeight: FontWeight.bold,color:  Color4),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: BorderSide(
          color: Color1,
        ),
      ),
      titleStyle: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
      constraints: BoxConstraints.expand(width: 1000),
      overlayColor: OverlayColor ,
      alertElevation: 200,
      alertAlignment: Alignment.center,
      buttonsDirection: ButtonsDirection.column
  );
}