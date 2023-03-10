import 'package:get/get.dart';
import 'package:university_app/constant.dart';
import 'package:university_app/data_app/shard_preference_data.dart';
import 'package:university_app/models/person.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:university_app/modules/profile/profile_serves.dart';

class ProfileController extends GetxController {
  late Person person;
  late ShardPreferenceData shardPreferenceData;
  late bool Status;
  late var IsRefeich = false.obs;

  late String Message;

  late ProfileService profileService;

  @override
  void onInit() {
    shardPreferenceData = ShardPreferenceData();
    Status = true;
    Message = "";
    profileService = ProfileService();
    person = Person(
        Name: "",
        Year: "",
        Part: "",
        RegisterYear: "",
        YearlyAvg: 0.0,
        TotalAvg: 0.0,
        FatherName: "",
        MotherName: "",
        PhoneNumber: 0,
        Email: "",
        Id: 0,
        Status: "");
    super.onInit();
  }

  @override
  void onReady() async {
    if(person.Name == ""){
      EasyLoading.show(
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
      if (InternetConnection == true) {
        Person p = await profileService.GetPersonInfo(
            await shardPreferenceData.GetToken());
        person = Person(
            Name: p.Name,
            Year: p.Year,
            Part: p.Part,
            RegisterYear: p.RegisterYear,
            YearlyAvg: p.YearlyAvg,
            TotalAvg: p.TotalAvg,
            FatherName: p.FatherName,
            MotherName: p.MotherName,
            PhoneNumber: p.PhoneNumber,
            Email: p.Email,
            Id: p.Id,
            Status: p.Status,);
        IsRefeich(true);

        Message = profileService.Message;
        if (p.Status == "") {
          EasyLoading.dismiss();
          EasyLoading.showError(
            Message,
            duration: Duration(seconds: 4),
            dismissOnTap: false,
            maskType: EasyLoadingMaskType.black,
          );
        }
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(
          "لا يوجد اتصال بالإنترنت",
          duration: Duration(seconds: 4),
          dismissOnTap: false,
          maskType: EasyLoadingMaskType.black,
        );
      }

      EasyLoading.dismiss();

    }
    super.onReady();
  }
}
