import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:university_app/models/ads.dart';

import '../../config/server_config.dart';

class HomeService {
  var GetADSUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.GetADSRoute);

  Future<List<SingleAds>> GetADS(String token)async{
    var ResponseJson = await http.get(
        GetADSUrl,
        headers: {
          'Accept':'application/json',
          'auth-token': '${token}'
        }
    );

    if(ResponseJson.statusCode == 200){
      var Response = jsonDecode(ResponseJson.body);
      if(Response['status'] == true){

        var Ads = adsFromJson(ResponseJson.body);

        return Ads.data;
      }
    }
    return [];
  }


}