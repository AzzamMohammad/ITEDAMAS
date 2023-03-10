import 'package:get/get.dart';
import 'package:university_app/modules/notification/notification_controller.dart';

class NotificationBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<NotificationController>(NotificationController());
  }

}