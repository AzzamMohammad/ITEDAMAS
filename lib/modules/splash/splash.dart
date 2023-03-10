import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:university_app/modules/splash/splash_controller.dart';
import '../../constant.dart';

class Splash extends StatelessWidget {
  SplashController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/ITE.png'),
              LoadingAnimationWidget.staggeredDotsWave(
                color:  Color1,
                size: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
