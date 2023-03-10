import 'package:get/get.dart';
import 'package:university_app/modules/services/services_controller.dart';

class ServicesBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<ServicesController>(ServicesController());
  }

}