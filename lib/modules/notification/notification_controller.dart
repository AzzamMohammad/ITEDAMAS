import 'package:get/get.dart';
import 'package:university_app/modules/notification/notifications_server.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../constant.dart';
import '../../data_app/shard_preference_data.dart';
import '../../models/notification.dart';

class NotificationController extends GetxController{
 late List<Notificationn> Notifications ;
 late NotificationsServer notificationsServer;
 late ShardPreferenceData shardPreferenceData;
 var CheckReferich;

 @override
  void onInit() {
   Notifications = [];
    notificationsServer = NotificationsServer();
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
      Notifications = await notificationsServer.GetNotifications(await shardPreferenceData.GetToken());
      if(Notifications.length > 0){
        CheckReferich(false);
        notificationAndAccount.NumberOfNewNotification(0);
      }
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