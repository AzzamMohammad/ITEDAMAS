import 'package:get/get.dart';
import 'package:university_app/data_app/shard_preference_data.dart';
import 'package:university_app/models/ads.dart';
import 'package:university_app/modules/home/home_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../constant.dart';

class HomeController extends GetxController{

  late List<SingleAds> Ads ;
  late HomeService homeService ;
  late ShardPreferenceData shardPreferenceData;
  var CheckReferich;

  @override
  void onInit() {
    Ads = [];
    homeService = HomeService();
    shardPreferenceData = ShardPreferenceData();
    CheckReferich = true.obs;
    super.onInit();
  }

  @override
  void onReady() async{
    EasyLoading.show(
      dismissOnTap: false,
      maskType:EasyLoadingMaskType.black,
    );
    if(InternetConnection == true){
      Ads = await homeService.GetADS(await shardPreferenceData.GetToken());
      if(Ads.length > 0){
        print(Ads[0].img);
        CheckReferich(false);
      }
      super.onReady();
    }
    else{
      EasyLoading.dismiss();
      EasyLoading.showError(
        "لا يوجد اتصال بالإنترنت",
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );

    }
    EasyLoading.dismiss();
    super.onReady();
  }


}