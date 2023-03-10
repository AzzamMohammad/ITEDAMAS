import 'dart:io';

import 'package:get/get.dart';
import 'package:university_app/constant.dart';
import 'package:university_app/data_app/shard_preference_data.dart';
import 'package:university_app/models/student.dart';
import 'package:university_app/modules/services/services_server.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ServicesController extends GetxController {
  late int SubjectObjectionPracticalId;
  late int CancelRePracticalId;
  late int SubjectObjectionTheoreticalId;
  late String Message;
  late bool StatusRequest;
  late ServicesServer servicesServer;
  late ShardPreferenceData shardPreferenceData;
  late File? FinancialDocument;
  late File? BloodDonationDocument;
  late File? IdImage;
  late File? AcquittalFromUniversity;
  late File? AcquittalFromHousing;
  late File? ClearanceCredit;
  late File? UniversityCard;
  late File? RegisterDocument;
  late bool AccountIsEnough;
  late int ReParticalId ;
  late List<String> Subject ;


  @override
  void onInit() {
    servicesServer = ServicesServer();
    SubjectObjectionPracticalId = 0;
    SubjectObjectionTheoreticalId = 0;
    CancelRePracticalId = 0;
    ReParticalId = 0;
    shardPreferenceData = ShardPreferenceData();
    StatusRequest = true;
    FinancialDocument = null;
    BloodDonationDocument = null;
    IdImage = null;
    Message = '';
    AccountIsEnough = true;
    AcquittalFromHousing = null;
    AcquittalFromUniversity = null;
    ClearanceCredit = null;
    UniversityCard = null;
    RegisterDocument = null;
    Subject = [];
    super.onInit();
  }

  @override
  void onReady()async{
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,);
    if(InternetConnection == true){
      StatusRequest = await servicesServer.GetAllSubjectForStudent(await shardPreferenceData.GetToken());

      int Temp = 0;
      while(!StatusRequest && Temp != 4){
        StatusRequest = await servicesServer.GetAllSubjectForStudent(await shardPreferenceData.GetToken());
        Temp++;
      }
      EasyLoading.dismiss();
      if(StatusRequest == false)
        Get.offAllNamed('/home');
      else{
        for(int i = 0 ; i < StudentSubjects.length ; i++){
          Subject.add(StudentSubjects[i].name);
        }

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
      Get.offAllNamed('/home');
    }

  }

  Future<void> ObjectionPracticalRequest() async {
    if (InternetConnection == true) {
      int Account = notificationAndAccount.Account.value;
      if (Account - 2000 > 0) {
        AccountIsEnough = true;
        StatusRequest = await servicesServer.RequestObjectionPractical(
            SubjectObjectionPracticalId, await shardPreferenceData.GetToken());
        Message = servicesServer.Message;
        if (StatusRequest == true) {
          notificationAndAccount.Account(
              notificationAndAccount.Account.value - 2000);
          StatusRequest = false;
        }
      } else
        AccountIsEnough = false;
    }
    else {
      StatusRequest = false;
      Message = "لا يوجد اتصال بالإنترنت";
    }
  }

  Future<void> CancelRePracticalRequest() async {
    if (InternetConnection == true) {
      print(CancelRePracticalId);
      StatusRequest = await servicesServer.RequestCancelRePractical(
          CancelRePracticalId, await shardPreferenceData.GetToken());
      Message = servicesServer.Message;
    }
    else{
      StatusRequest = false;
      Message = "لا يوجد اتصال بالإنترنت";
    }

  }

  Future<void>  RePracticalRequest() async {
    if (InternetConnection == true) {
      StatusRequest = await servicesServer.RequestRePractical(
          ReParticalId, await shardPreferenceData.GetToken());
      Message = servicesServer.Message;
    }
    else{
      StatusRequest = false;
      Message = "لا يوجد اتصال بالإنترنت";
    }

  }


  Future<void> ObjectionTheoreticalRequest()async{
    if(InternetConnection == true){
      int Account = notificationAndAccount.Account.value;
      if(Account - 2000 > 0 ){
        AccountIsEnough = true;
        StatusRequest = await servicesServer.RequestObjectionTheoretical(SubjectObjectionTheoreticalId, await shardPreferenceData.GetToken());
        Message = servicesServer.Message;
        if(StatusRequest == true){
          notificationAndAccount.Account(notificationAndAccount.Account.value - 2000);
          StatusRequest = false;
        }
      }
      else
        AccountIsEnough = false;
    }
    else{
      StatusRequest = false;
      Message = "لا يوجد اتصال بالإنترنت";
    }

  }

  Future<void> DetectingSignsRequest()async{
    if(InternetConnection == true){
      int Account = notificationAndAccount.Account.value;
      if(Account - 3000 > 0){
        AccountIsEnough = true;
        StatusRequest = await servicesServer.RequestDetectingSigns(FinancialDocument,BloodDonationDocument,IdImage,await shardPreferenceData.GetToken());
        Message = servicesServer.Message;
        if(StatusRequest == true){
          notificationAndAccount.Account(notificationAndAccount.Account.value - 3000);
          StatusRequest = false;
        }
      }else
        AccountIsEnough = false;
    }
    else{
      StatusRequest = false;
      Message = "لا يوجد اتصال بالإنترنت";
    }
  }

  Future<void> CertifiedGraduationRequest()async{
      if(InternetConnection == true){
        StatusRequest = await servicesServer.RequestCertifiedGraduation(AcquittalFromUniversity,AcquittalFromHousing,ClearanceCredit,await shardPreferenceData.GetToken());
        Message = servicesServer.Message;
      }
      else{
        StatusRequest = false;
        Message = "لا يوجد اتصال بالإنترنت";
      }
  }

  Future<void> CollegeLifeRequest()async{
   if(InternetConnection == true){
     StatusRequest = await servicesServer.RequestCollegeLife(IdImage,UniversityCard,await shardPreferenceData.GetToken());
     Message = servicesServer.Message;
   }
   else{
     StatusRequest = false;
     Message = "لا يوجد اتصال بالإنترنت";
   }
  }


  Future<void> RegisteringDocumentRequest()async{
    if(InternetConnection == true){
      StatusRequest = await servicesServer.RequestRegisteringDocument(BloodDonationDocument,IdImage,RegisterDocument,await shardPreferenceData.GetToken());
      Message = servicesServer.Message;
    }
    else{
      StatusRequest = false;
      Message = "لا يوجد اتصال بالإنترنت";
    }
  }

  Future<void> WorkDocumentRequest()async{
    if(InternetConnection == true){
      StatusRequest = await servicesServer.RequestWorkDocument(BloodDonationDocument,IdImage,RegisterDocument,await shardPreferenceData.GetToken());
      Message = servicesServer.Message;
    }else{
      StatusRequest = false;
      Message = "لا يوجد اتصال بالإنترنت";
    }
  }

  Future<void> RaisedDocumentRequest()async{
   if(InternetConnection == true){
     StatusRequest = await servicesServer.RequestRaisedDocument(await shardPreferenceData.GetToken());
     Message = servicesServer.Message;
   }
   else{
     StatusRequest = false;
     Message = "لا يوجد اتصال بالإنترنت";
   }
  }

}
