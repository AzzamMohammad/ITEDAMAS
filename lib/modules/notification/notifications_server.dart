import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/server_config.dart';
import '../../models/notification.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class NotificationsServer {
  var GetNotificationUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.GetNotificationRoute);

  Future<List<Notificationn>> GetNotifications(String token)async{
    var ResponseJson = await http.get(
        GetNotificationUrl,
        headers: {
          'Accept':'application/json',
          'auth-token': '${token}'
        }
    );

    if(ResponseJson.statusCode == 200){
      var Response = jsonDecode(ResponseJson.body);
      if(Response['status'] == true){

        var Notification = notificationsFromJson(ResponseJson.body);
        print(Notification.data.length);
        return Notification.data;
      }
    }
    return [];
  }

}