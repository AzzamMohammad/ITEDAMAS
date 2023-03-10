import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:university_app/config/server_config.dart';
import 'package:university_app/data_app/shard_preference_data.dart';

import '../../constant.dart';
import '../../models/university_subjects.dart';

class ServicesServer{
  var PracticalUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.ObjectionPracticalRoute);
  var TheoreticalUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.ObjectionTheoreticalRoute);
  var DetectingSignsUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.DetectingSignsRoute);
  var CertifiedGraduationRouteUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.CertifiedGraduationRoute);
  var CollegeLifeUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.CollegeLifeRoute);
  var RegistrationDocumentUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.RegistrationDocumentRoute);
  var WorkDocumentUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.WorkDocumentRoute);
  var UpgradingDocumentUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.UpgradingDocumentRoute);
  var RePracticalUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.RePractical);
  var CancelRePracticalUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.CancelRePracticalUrl);
  var GetSubjectStudentUrl = Uri.parse(ServerConfiguration.ServerDomain + ServerConfiguration.GetSubjectStudentRoute);


  ShardPreferenceData shardPreferenceData = ShardPreferenceData();
  String Message = '';

  Future<bool> GetAllSubjectForStudent(String Token)async{
    var ResponseJson = await http.get(
        GetSubjectStudentUrl,
        headers: {
          'Accept':'application/json',
          'auth-token': '${Token}'
        }
    );
    if(ResponseJson.statusCode == 200){
      var Response = jsonDecode(ResponseJson.body);
      if(Response['status'] == true){
        Message = Response['msg'];
        StudentSubjects = universitySubjectsFromJson(ResponseJson.body).data;
        return true;
      }
    }
    return false;
  }


  Future<bool> RequestObjectionPractical(int SubjectObjectionPracticalId ,String Token)async{
    var ResponseJson = await http.post(
        PracticalUrl,
        headers: {
          'auth-token' : '${Token}',
          'Accept':'application/json'
        },
        body: {
          'subject_id' : '${SubjectObjectionPracticalId}'
        }
    );
    var Response = jsonDecode(ResponseJson.body);

    if(ResponseJson.statusCode == 200){
      Message = Response['msg'];
      return Response['status'];
    }
    else{
      Message = 'Missing connection';
      return false;
    }
  }

  Future<bool> RequestCancelRePractical(int SubjectRePracticalId ,String Token)async{
    var ResponseJson = await http.post(
        CancelRePracticalUrl,
        headers: {
          'auth-token' : '${Token}',
          'Accept':'application/json'
        },
        body: {
          'subject_id' : '${SubjectRePracticalId}'
        }
    );
    var Response = jsonDecode(ResponseJson.body);
    print("SSSSSSSSSSSSSSSSSSSSSSs");
    print(SubjectRePracticalId);
    if(ResponseJson.statusCode == 200){
      Message = Response['msg'];
      return Response['status'];
    }
    else{
      Message = 'Missing connection';
      return false;
    }
  }

  Future<bool> RequestRePractical(int SubjectRePracticalId ,String Token)async{
    var ResponseJson = await http.post(
        RePracticalUrl,
        headers: {
          'auth-token' : '${Token}',
          'Accept':'application/json'
        },
        body: {
          'subject_id' : '${SubjectRePracticalId}'
        }
    );
    print('SSSSSSSSSSSSSSSSSSSSSSSSSSS');

    print(SubjectRePracticalId);
    var Response = jsonDecode(ResponseJson.body);

    if(ResponseJson.statusCode == 200){
      Message = Response['msg'];
      return Response['status'];
    }
    else{
      Message = 'Missing connection';
      return false;
    }
  }

  Future<bool> RequestObjectionTheoretical(int SubjectObjectionTheoreticalId ,String Token)async{
    var ResponseJson = await http.post(
        TheoreticalUrl,
        headers: {
          'auth-token' : '${Token}',
          'Accept':'application/json'
        },
        body: {
          'subject_id' : '${SubjectObjectionTheoreticalId}'
        }
    );
    var Response = jsonDecode(ResponseJson.body);

    if(ResponseJson.statusCode == 200){
      Message = Response['msg'];
      return Response['status'];
    }
    else{
      Message = 'Missing connection';
      return false;
    }
  }

  Future<bool> RequestDetectingSigns(File? FinancialDocument , File? BloodDonationDocument , File? IdImage,String Token)async{
    try{
      var Request = http.MultipartRequest('post' , DetectingSignsUrl);
      Request.headers['auth-token'] = '${Token}';
      Request.headers['Accept'] = 'application/json';
      if(FinancialDocument != null){
        var FinancialDocumentPicture = http.MultipartFile.fromBytes('Delivering_financial', FinancialDocument.readAsBytesSync(),
            filename: FinancialDocument.path);
        Request.files.add(FinancialDocumentPicture);

      }
      if(BloodDonationDocument != null){
        var BloodDonationDocumentPicture = http.MultipartFile.fromBytes('donate_blood',BloodDonationDocument.readAsBytesSync() ,
            filename: BloodDonationDocument.path);
        Request.files.add(BloodDonationDocumentPicture);
      }
      if(IdImage != null){
        var IdImagePicture = http.MultipartFile.fromBytes('photo_id',IdImage.readAsBytesSync(),
            filename: IdImage.path);
        Request.files.add(IdImagePicture);

      }
      var JsonResponse = await Request.send();
      if(JsonResponse.statusCode == 200){
        var ResponseData = await JsonResponse.stream.toBytes();
        var Result = String.fromCharCodes(ResponseData);
        var Response = jsonDecode(Result);
        Message = Response['msg'];
        if(Response['status'] == true)
          return true;
        else
          return false;
      }
      else{
        Message = 'Missing connection';
        return false;
      }
    }catch(e){
      Message = 'Missing connection';
      return false;
    }
 }

  Future<bool> RequestCertifiedGraduation(File? AcquittalFromUniversity , File? AcquittalFromHousing , File? ClearanceCredit,String Token)async{
    var Request = http.MultipartRequest('post' , CertifiedGraduationRouteUrl);
    Request.headers['auth-token'] = '${Token}';
    Request.headers['Accept'] = 'application/json';
    if(AcquittalFromUniversity != null){
      var AcquittalFromUniversityPicture = http.MultipartFile.fromBytes('acquittal_from_the_university', AcquittalFromUniversity.readAsBytesSync(),
          filename: AcquittalFromUniversity.path);
      Request.files.add(AcquittalFromUniversityPicture);

    }
    if(AcquittalFromHousing != null){
      var AcquittalFromHousingPicture = http.MultipartFile.fromBytes('acquittal_from_housing',AcquittalFromHousing.readAsBytesSync() ,
          filename: AcquittalFromHousing.path);
      Request.files.add(AcquittalFromHousingPicture);
    }
    if(ClearanceCredit != null){
      var ClearanceCreditPicture = http.MultipartFile.fromBytes('Clearance_of_credit_of_credit',ClearanceCredit.readAsBytesSync(),
          filename: ClearanceCredit.path);
      Request.files.add(ClearanceCreditPicture);

    }
    var JsonResponse = await Request.send();
    if(JsonResponse.statusCode == 200){
      var ResponseData = await JsonResponse.stream.toBytes();
      var Result = String.fromCharCodes(ResponseData);
      var Response = jsonDecode(Result);
      Message = Response['msg'];
      if(Response['status'] == true)
        return true;
      else
        return false;
    }
    else{
      Message = 'Missing connection';
      return false;
    }
  }

  Future<bool> RequestCollegeLife(File? IdImage , File? UniversityCard , String Token)async{
    var Request = http.MultipartRequest('post' , CollegeLifeUrl);
    Request.headers['auth-token'] = '${Token}';
    Request.headers['Accept'] = 'application/json';
    if(IdImage != null){
      var IdImagePicture = http.MultipartFile.fromBytes('photo_id', IdImage.readAsBytesSync(),
          filename: IdImage.path);
      Request.files.add(IdImagePicture);

    }
    if(UniversityCard != null){
      var UniversityCardPicture = http.MultipartFile.fromBytes('photo_card',UniversityCard.readAsBytesSync() ,
          filename: UniversityCard.path);
      Request.files.add(UniversityCardPicture);
    }
    var JsonResponse = await Request.send();
    if(JsonResponse.statusCode == 200){
      var ResponseData = await JsonResponse.stream.toBytes();
      var Result = String.fromCharCodes(ResponseData);
      var Response = jsonDecode(Result);
      Message = Response['msg'];
      if(Response['status'] == true)
        return true;
      else
        return false;
    }
    else{
      Message = 'Missing connection';
      return false;
    }
  }

  Future<bool> RequestRegisteringDocument(File? BloodDonationDocument , File? IdImage , File? RegisterDocument, String Token)async{
    var Request = http.MultipartRequest('post' , RegistrationDocumentUrl);
    Request.headers['auth-token'] = '${Token}';
    Request.headers['Accept'] = 'application/json';
    if(BloodDonationDocument != null){
      var BloodDonationDocumentPicture = http.MultipartFile.fromBytes('donate_blood', BloodDonationDocument.readAsBytesSync(),
          filename: BloodDonationDocument.path);
      Request.files.add(BloodDonationDocumentPicture);

    }
    if(IdImage != null){
      var IdImagePicture = http.MultipartFile.fromBytes('photo_id',IdImage.readAsBytesSync() ,
          filename: IdImage.path);
      Request.files.add(IdImagePicture);
    }

    if(RegisterDocument != null){
      var RegisterDocumentPicture = http.MultipartFile.fromBytes('arrived_registration',RegisterDocument.readAsBytesSync() ,
          filename: RegisterDocument.path);
      Request.files.add(RegisterDocumentPicture);
    }
    var JsonResponse = await Request.send();
    if(JsonResponse.statusCode == 200){
      var ResponseData = await JsonResponse.stream.toBytes();
      var Result = String.fromCharCodes(ResponseData);
      var Response = jsonDecode(Result);
      Message = Response['msg'];
      if(Response['status'] == true)
        return true;
      else
        return false;
    }
    else{
      Message = 'Missing connection';
      return false;
    }
  }

  Future<bool> RequestWorkDocument(File? BloodDonationDocument , File? IdImage , File? RegisterDocument, String Token)async{
    var Request = http.MultipartRequest('post' , WorkDocumentUrl);
    Request.headers['auth-token'] = '${Token}';
    Request.headers['Accept'] = 'application/json';
    if(BloodDonationDocument != null){
      var BloodDonationDocumentPicture = http.MultipartFile.fromBytes('donate_blood', BloodDonationDocument.readAsBytesSync(),
          filename: BloodDonationDocument.path);
      Request.files.add(BloodDonationDocumentPicture);

    }
    if(IdImage != null){
      var IdImagePicture = http.MultipartFile.fromBytes('photo_id',IdImage.readAsBytesSync() ,
          filename: IdImage.path);
      Request.files.add(IdImagePicture);
    }

    if(RegisterDocument != null){
      var RegisterDocumentPicture = http.MultipartFile.fromBytes('arrived_registration',RegisterDocument.readAsBytesSync() ,
          filename: RegisterDocument.path);
      Request.files.add(RegisterDocumentPicture);
    }
    var JsonResponse = await Request.send();
    if(JsonResponse.statusCode == 200){
      var ResponseData = await JsonResponse.stream.toBytes();
      var Result = String.fromCharCodes(ResponseData);
      var Response = jsonDecode(Result);
      Message = Response['msg'];
      if(Response['status'] == true)
        return true;
      else
        return false;
    }
    else{
      Message = 'Missing connection';
      return false;
    }
  }

  Future<bool> RequestRaisedDocument(String Token)async{
    var ResponseJson = await http.post(
      UpgradingDocumentUrl,
        headers: {
          'auth-token' : '${Token}',
          'Accept':'application/json'
        },
    );
    var Response = jsonDecode(ResponseJson.body);

    if(ResponseJson.statusCode == 200){
      Message = Response['msg'];
      return Response['status'];
    }
    else{
      Message = 'Missing connection';
      return false;
    }
  }
}

