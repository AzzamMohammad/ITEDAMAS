import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:university_app/models/person.dart';

import '../../config/server_config.dart';

class ProfileService{
  var GetProfileInfoRute = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.GetProfileInfoRoute);
   String Message = '';
  Future<Person> GetPersonInfo(String Token)async{
    Person person = Person(Name: "", Year: "", Part: "", RegisterYear: "", YearlyAvg: 0.0, TotalAvg: 0.0, FatherName: "", MotherName: "", PhoneNumber: 0, Email: "", Id: 0, Status: "");
    var ResponseJson = await http.get(
        GetProfileInfoRute,
        headers: {
          'Accept':'application/json',
          'auth-token':'${Token}'
        },
    );
    print("llllllllllllllllllllllllllllllll");
    if(ResponseJson.statusCode == 200){
      var Response = jsonDecode(ResponseJson.body);
      print("llllllllllllllllllllllllllllllll");
      print(Response['Data']['yearly_avg']);
      if(Response['status'] == true){
        Message = Response['msg'];
        String Year = "";
        if(Response['Data']['current_year'] == 1)
          Year = "السنة الأولى" ;
        else if(Response['Data']['current_year'] == 2)
          Year = "السنة الثانية" ;
        else if(Response['Data']['current_year'] == 3)
          Year = "السنة الثالثة" ;
        else if(Response['Data']['current_year'] == 4)
          Year = "السنة الرابعة" ;
        else if(Response['Data']['current_year'] == 5)
          Year = "السنة الخامسة" ;
          person = Person(
            Name: Response['Data']['name'],
            Year: Year,
            Part: Response['Data']['specialization'],
            RegisterYear: Response['Data']['signYear'],
            YearlyAvg: Response['Data']['yearly_avg'].toDouble(),
            TotalAvg: Response['Data']['total_avg'].toDouble(),
            FatherName: Response['Data']['futher_name'],
            MotherName: Response['Data']['mather_name'],
            PhoneNumber: Response['Data']['phone'],
            Email: Response['Data']['email'],
            Id: Response['Data']['student_id'],
            Status: Response['Data']['status'],

        );

        return person;
      }
      else{
        Message = Response['msg'];
        return person;
      }
    }
    else{
      Message = 'Missing connection';
      return person;
    }
  }
}