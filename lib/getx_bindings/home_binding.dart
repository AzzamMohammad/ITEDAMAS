import 'package:get/get.dart';
import 'package:university_app/modules/home/home_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }

}
