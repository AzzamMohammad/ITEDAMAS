import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_app/getx_bindings/home_binding.dart';
import 'package:university_app/getx_bindings/login_binding.dart';
import 'package:university_app/getx_bindings/logout_binding.dart';
import 'package:university_app/getx_bindings/my_marks_binding.dart';
import 'package:university_app/getx_bindings/notification_binding.dart';
import 'package:university_app/getx_bindings/services_binding.dart';
import 'package:university_app/getx_bindings/splash_binding.dart';
import 'package:university_app/modules/home/home.dart';
import 'package:university_app/modules/my_marks/my_marks.dart';
import 'package:university_app/modules/notification/notifications.dart';
import 'package:university_app/modules/splash/splash.dart';

import 'constant.dart';
import 'getx_bindings/profile_binding.dart';
import 'modules/login/login.dart';
import 'modules/logout/logout.dart';
import 'modules/profile/profile.dart';
import 'modules/services/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false ,

      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/login', page: ()=> Login(),binding: LoginBinding()),
        GetPage(name: '/splash', page: ()=> Splash() , binding: SplashBinding()),
        GetPage(name: '/home', page: ()=>Home() , binding: HomeBinding()),
        GetPage(name: '/my_marks', page: ()=> MyMarks(),binding: MyMarksBinding()),
        GetPage(name: '/services', page:()=>Services(),binding: ServicesBinding()),
        GetPage(name: '/profile', page: ()=>Profile(),binding: ProfileBinding()),
        GetPage(name: '/notifications', page: ()=>Notifications(),binding: NotificationBinding()),
        GetPage(name: '/logout', page: ()=>Logout(),binding: LogoutBinding()),
      ],
      builder: EasyLoading.init(),

    )
  );
  ConfigEasyLoading();
}

void ConfigEasyLoading(){
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 20)
    ..indicatorType = EasyLoadingIndicatorType.foldingCube
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 50
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Color1
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue
    ..userInteractions = false
    ..dismissOnTap = false;
}
