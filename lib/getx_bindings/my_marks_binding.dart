import 'package:get/get.dart';
import 'package:university_app/modules/my_marks/my_marks_controoler.dart';

class MyMarksBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<MyMarksController>(MyMarksController());
  }

}