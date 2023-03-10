import 'package:get/get.dart';
import 'package:university_app/data_app/shard_preference_data.dart';
import 'package:university_app/modules/logout/LogoutServer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../constant.dart';

class LogoutController extends GetxController {
  LogoutServer logoutServer = LogoutServer();
  ShardPreferenceData shardPreferenceData = ShardPreferenceData();
  bool StatusRequest = true;
  String Message = "";

  @override
  void onReady() async {

      EasyLoading.show(
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,);
    if (InternetConnection == true) {
      StatusRequest =
          await logoutServer.Logout(await shardPreferenceData.GetToken());
      Message = logoutServer.Message;
      if (StatusRequest == true) {
        shardPreferenceData.SaveEmail('');
        shardPreferenceData.SavePassword('');
        EasyLoading.dismiss();
        Get.offAllNamed('/login');
      }
      else{
        EasyLoading.showError(
          Message,
          duration: Duration(seconds: 4),
          dismissOnTap: true,
          maskType: EasyLoadingMaskType.black,
        );
      }
    } else {
      StatusRequest = false;
      Message = "لا يوجد اتصال بالإنترنت";
    }
    super.onReady();
  }
}
