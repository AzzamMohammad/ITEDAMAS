import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:university_app/config/server_config.dart';
import 'package:university_app/models/subject.dart';

class MyMarksServes{
  var Url = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.MyMarksRoute);
  Future<List<Datum>> GetMySubject(String token)async{
    var ResponseJson = await http.get(
      Url,
      headers: {
        'Accept':'application/json',
        'auth-token': '${token}'
      }
    );

    if(ResponseJson.statusCode == 200){
      var Response = jsonDecode(ResponseJson.body);
      if(Response['status'] == true){

        var subjects = subjectFromJson(ResponseJson.body);
        return subjects.data;
      }
    }
    return [];
  }
}