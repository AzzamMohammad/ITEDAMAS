import 'dart:convert';
import 'dart:io';

import 'package:university_app/config/server_config.dart';
import 'package:http/http.dart' as http;
import 'package:university_app/constant.dart';
import 'package:university_app/data_app/shard_preference_data.dart';
import 'package:university_app/models/notification_account.dart';
import 'package:university_app/models/student.dart';

class LoginServes{
   var url = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.LoginRoute);
   ShardPreferenceData shardPreferenceData = ShardPreferenceData();
   var message;
   Future<bool> Login(Student student)async{

     var ResponseJson = await http.post(
       url,
       headers: {
        'Accept':'application/json'
       },
       body: {
        'email':student.Email, 'password' : student.Password,
       },
     ).timeout(Duration(seconds: 60));
     if(ResponseJson.statusCode == 200){
       var Response = jsonDecode(ResponseJson.body);
       if(Response['status'] == true){
         message = Response['msg'];
         await shardPreferenceData.SaveToken(Response['Data']['token']);
         notificationAndAccount.Account(Response['Data']['point']);
         print(Response['Data']['point']);
         return true;
       }
       else{
         message = Response['msg'];
         return false;
       }
     }
     else{
       message = 'Missing connection';
       return false;
     }
  }
}