import 'dart:convert';

import 'package:university_app/models/notification_account.dart';

import '../../config/server_config.dart';
import '../../data_app/shard_preference_data.dart';
import 'package:http/http.dart' as http;

import '../../models/student.dart';

class SplashServes {
  var LoginUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.LoginRoute);
  var CheckNotificationUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.CheckNotificationRoute);
  ShardPreferenceData shardPreferenceData = ShardPreferenceData();
  Future<bool> Login(Student student)async{
    var ResponseJson = await http.post(
        LoginUrl,
        headers: {
          'Accept':'application/json'
        },
        body: {
          'email':student.Email, 'password' : student.Password
        }
    );
    if(ResponseJson.statusCode == 200){
      var Response = jsonDecode(ResponseJson.body);
      if(Response['status'] == true){
        await shardPreferenceData.SaveToken(Response['Data']['token']);
        return true;
      }
      else{
        return false;
      }
    }
    else{
      return false;
    }
  }
  Future<NotificationAndAccount> CheckNotificationAndAccountRequest(String Token , NotificationAndAccount notificationAndAccount)async{
    var ResponseJson = await http.get(CheckNotificationUrl,headers: {
      'Accept':'application/json',
      'auth-token' : '${Token}',
    });

    if(ResponseJson.statusCode == 200){
      var Response = jsonDecode(ResponseJson.body);
      if(Response['status'] == true){
        notificationAndAccount.Account(Response['Data']['point']);
        notificationAndAccount.NumberOfNewNotification(Response['Data']['counter']);
        print('${Response['Data']['point']}');
        print('${Response['Data']['counter']}');
        return notificationAndAccount;
      }
      else{
        return notificationAndAccount;
      }
    }
    else{
    return notificationAndAccount;
    }
  }
}