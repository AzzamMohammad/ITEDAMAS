import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../config/server_config.dart';
import '../../constant.dart';

class LogoutServer {
  var LogoutUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.Logout);
  String Message = "";
  Future<bool> Logout(String Token)async{
    var ResponseJson = await http.post(
      LogoutUrl,
      headers: {
        'Accept':'application/json',
        'auth-token':'${Token}'
      },
      body: {

      }
    );
    if(ResponseJson.statusCode == 200){
      var Response = jsonDecode(ResponseJson.body);
      if(Response['status'] == true){
        Message = Response['msg'];
        return true;
      }
      else{
        Message = Response['msg'];
        return false;
      }
    }
    else{
      Message = 'Missing connection';
      return false;
    }
  }
}