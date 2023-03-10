import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:university_app/constant.dart';
import 'package:university_app/data_app/shard_preference_data.dart';
import 'package:university_app/models/subject.dart';
import 'package:university_app/modules/my_marks/my_marcks_serves.dart';


class MyMarksController extends GetxController{

  late List<Datum> Subjects ;
  late MyMarksServes marksServes ;
  late ShardPreferenceData shardPreferenceData;
  late var IsEndLoading;
  late List<String> SubjectName;
  late List<String> SubjectsYears;
  late List<Datum> SuccessSubject;
  late List<Datum> FailSubject;
  late var DisplayList= [].obs;

  @override
  void onInit() {
    Subjects = [];
    SubjectName = [];
    SubjectsYears = [];
    SuccessSubject = [];
    FailSubject = [];
    marksServes = MyMarksServes();
    shardPreferenceData = ShardPreferenceData();
    IsEndLoading = false.obs;
    super.onInit();
  }


  @override
  void onReady() async{
    EasyLoading.show(
      dismissOnTap: false,
      maskType:EasyLoadingMaskType.black,
    );

    if(true){//CopyOFSubjects.length == 0
      if(InternetConnection == true){
        Subjects = await marksServes.GetMySubject(await shardPreferenceData.GetToken());
        CopyOFSubjects = Subjects;
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
    }
    else
      Subjects = CopyOFSubjects;
    DisplayList(List.from(Subjects));
    for(Datum datum in Subjects){
      SubjectName.add(datum.name);
      if(!SubjectsYears.contains(datum.year.toString()))
        SubjectsYears.add(datum.year.toString());
      if(datum.status == "نجاح")
        SuccessSubject.add(datum);
      else
        FailSubject.add(datum);
    }
    IsEndLoading(true);
    EasyLoading.dismiss();
    super.onReady();
  }

  @override
  void onClose() {
    EasyLoading.dismiss();
    super.onClose();
  }


}