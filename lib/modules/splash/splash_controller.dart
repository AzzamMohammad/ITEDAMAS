import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:university_app/data_app/shard_preference_data.dart';
import 'package:university_app/models/student.dart';
import 'package:university_app/modules/splash/splash_serves.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constant.dart';
import '../../models/notification_account.dart';

class SplashController extends GetxController {
  late ShardPreferenceData shardPreferenceData;
  SplashServes splashServes = SplashServes();
  bool LoginState = false;
  late Student student;
  late String Token;

  @override
  void onInit() async {
    shardPreferenceData = ShardPreferenceData();
    Token = await shardPreferenceData.GetToken();
    notificationAndAccount = NotificationAndAccount();
    super.onInit();
  }

  @override
  void onReady() {
     GoTo();
     splashServes.CheckNotificationAndAccountRequest(Token, notificationAndAccount);
    Timer.periodic(Duration(seconds: 10), (timer) {
       splashServes.CheckNotificationAndAccountRequest(Token, notificationAndAccount);
       // shardPreferenceData.SaveAmountValue(notificationAndAccount.Account.value as double);
     });


    CheckInternetConnection();
    super.onReady();
  }

  Future<void> GoTo() async {
    String Email = await shardPreferenceData.GetEmail();
    String Password = await shardPreferenceData.GetPassword();

    // if the data are exist in history
    if (Email != '' && Password != '') {

      bool temp = false;
      // check internet connection
      var listener =
          InternetConnectionChecker().onStatusChange.listen((status) async {
        student = Student(Password: Password, Email: Email);
        switch (status) {
          case InternetConnectionStatus.connected:
            {
              LoginState = await splashServes.Login(student);
              temp = true;
              if (LoginState == true) {
                Get.offAllNamed('/home');
              } else {
                Get.offAllNamed('/login');
              }
              break;
            }
          case InternetConnectionStatus.disconnected:
            {
              break;
            }
        }
      });

      // end task after 10 seconds
      await Future.delayed(Duration(seconds: 15));
      await listener.cancel();

      //if can not connected to server
      if (temp == false) {
        Fluttertoast.showToast(
          msg: "الاتصال بالإنترنت مفقود",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 7,
          backgroundColor: Color1,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
      }
    } else {
      Get.offAllNamed('/login');
    }
  }

  void CheckInternetConnection() {
    int Counter = 0;
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          {
            InternetConnection = true;
            if (Counter != 0) {
              Fluttertoast.showToast(
                  msg: "تم استعادة الاتصال بالإنترنت",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Color1,
                  textColor: Colors.white,
                  fontSize: 16.0);
            }
            break;
          }
        case InternetConnectionStatus.disconnected:
          {
            InternetConnection = false;
            Counter++;
            Fluttertoast.showToast(
              msg: "الاتصال بالإنترنت مفقود",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Color1,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            break;
          }
      }
    });
  }

}
