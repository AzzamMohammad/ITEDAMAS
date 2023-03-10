import 'dart:async';

import 'package:get/get.dart';
import 'package:university_app/data_app/shard_preference_data.dart';
import 'package:university_app/models/notification_account.dart';
import 'package:university_app/models/student.dart';
import 'package:university_app/modules/login/login_serves.dart';

import '../splash/splash_serves.dart';

class LoginController extends GetxController{
  LoginServes loginServes = LoginServes();
  ShardPreferenceData shardPreferenceData = ShardPreferenceData();
  SplashServes splashServes = SplashServes();
  var StudentEmail = '';
  var StudentPassword = '';
  var Message;
  bool? State;
  var CheckBoxStatus = false;
  NotificationAndAccount notificationAndAccount = NotificationAndAccount();


  Future<void> LoginClicked()async{
    Student student = Student(Email: StudentEmail,Password: StudentPassword);
    State = await loginServes.Login(student);

      await shardPreferenceData.SaveEmail(StudentEmail);
      await shardPreferenceData.SavePassword(StudentPassword);
    if(State == true && CheckBoxStatus == true){
      String Token = await shardPreferenceData.GetToken();
      splashServes.CheckNotificationAndAccountRequest(Token, notificationAndAccount);
      Timer.periodic(Duration(seconds: 10), (timer) {
        splashServes.CheckNotificationAndAccountRequest(Token, notificationAndAccount);

        // shardPreferenceData.SaveAmountValue(notificationAndAccount.Account.value as double);
      });
    }
    Message = loginServes.message;
  }

}