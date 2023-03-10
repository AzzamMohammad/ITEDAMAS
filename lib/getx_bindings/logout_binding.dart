import 'package:get/get.dart';
import 'package:university_app/modules/logout/logout_controller.dart';

class LogoutBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<LogoutController>(LogoutController());
  }

}