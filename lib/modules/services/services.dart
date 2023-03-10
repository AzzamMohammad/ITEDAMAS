import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_app/components/app_bar.dart';
import 'package:university_app/components/bottom_bar.dart';
import 'package:university_app/components/my_dropdown.dart';
import 'package:university_app/components/my_style_alert.dart';
import 'package:university_app/components/servics_card.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:university_app/modules/services/services_controller.dart';

import '../../components/image_Picker_alert.dart';
import '../../constant.dart';
import 'package:image_picker/image_picker.dart';


class Services extends StatelessWidget {
  ServicesController controller = Get.find();

  var selectedValueTheoretical = ''.obs;
  var selectedValuePractical = ''.obs;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar('الخدمات', MediaQuery.of(context).size.width * .25, false),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // علاماتي
                ServiceCard(
                    Width: MediaQuery.of(context).size.width * .45,
                    Height: MediaQuery.of(context).size.height * .20,
                    CardName: 'علاماتي',
                    ImageAssetsLink: 'assets/images/score.png',
                    OnTap: () {
                      OnClickMyMarks();
                    }),

                // كشف العلامات
                ServiceCard(
                    Width: MediaQuery.of(context).size.width * .45,
                    Height: MediaQuery.of(context).size.height * .20,
                    CardName: 'كشف العلامات',
                    ImageAssetsLink: 'assets/images/1.png',
                    OnTap: () {
                      Alert(
                        context: context,
                        style: MyStyleAlert(
                            true, false, true, Color(0x033AFF00), Color1),
                        image: Image.asset(
                          'assets/images/1.png',
                          width: 100,
                          height: 100,
                        ),
                        title: "كشف العلامات",
                        desc:
                            "سوف يتم خصم 3000 ليرة سورية من حسابك\n هل أنت واثق من الطلب ؟",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "إتمام العملية",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              // controller.FinancialDocument = null;
                              controller.BloodDonationDocument = null;
                              controller.IdImage = null;
                              Navigator.of(context).pop();
                              Alert(
                                context: context,
                                style: MyStyleAlert(true, false, true,
                                    Color(0x033AFF00), Color1),
                                title: "أدخل البيانات",
                                buttons: [
                                  // DialogButton(
                                  //   child: Container(
                                  //     alignment: Alignment(0, 0),
                                  //     child: Text(
                                  //       "ايصال مالي",
                                  //       style: TextStyle(
                                  //           color: Colors.white, fontSize: 20),
                                  //     ),
                                  //   ),
                                  //   onPressed: () {
                                  //     Alert(
                                  //       context: context,
                                  //       style: MyStyleAlert(
                                  //           true,
                                  //           false,
                                  //           true,
                                  //           Color(0x33AFF00),
                                  //           Color(0xffcee6fa)),
                                  //       buttons: [
                                  //         DialogButton(
                                  //           child: Text(
                                  //             "التقاط صورة",
                                  //             style: TextStyle(
                                  //                 color: Colors.white,
                                  //                 fontSize: 20),
                                  //           ),
                                  //           onPressed: () {
                                  //             LoadFinancialDocumentImage(
                                  //                 ImageSource.camera);
                                  //             Navigator.of(context).pop();
                                  //           },
                                  //           // width: 120,
                                  //         ),
                                  //         DialogButton(
                                  //           child: Text(
                                  //             "تحميل صورة",
                                  //             style: TextStyle(
                                  //                 color: Colors.white,
                                  //                 fontSize: 20),
                                  //           ),
                                  //           onPressed: () {
                                  //             LoadFinancialDocumentImage(
                                  //                 ImageSource.gallery);
                                  //             Navigator.of(context).pop();
                                  //             print(image?.path);
                                  //           },
                                  //           // width: 120,
                                  //         )
                                  //       ],
                                  //     ).show();
                                  //   },
                                  //   // width: 120,
                                  // ),
                                  DialogButton(
                                    child: Container(
                                      alignment: Alignment(.2, 0),
                                      child: Text(
                                        "تبرع بالدم",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    onPressed: () {
                                      Alert(
                                        context: context,
                                        style: MyStyleAlert(true, false, true,
                                            Color(0x33AFF00), Color(0xffcee6fa)),
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "التقاط صورة",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () {
                                              LoadBloodDonationDocumentImage(
                                                  ImageSource.camera);
                                              Navigator.of(context).pop();
                                            },
                                            // width: 120,
                                          ),
                                          DialogButton(
                                            child: Text(
                                              "تحميل صورة",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () {
                                              LoadBloodDonationDocumentImage(
                                                  ImageSource.gallery);
                                              Navigator.of(context).pop();
                                              print(image?.path);
                                            },
                                            // width: 120,
                                          )
                                        ],
                                      ).show();
                                    },
                                    // width: 120,
                                  ),
                                  DialogButton(
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "صورة هوية",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    onPressed: () {
                                      Alert(
                                        context: context,
                                        style: MyStyleAlert(
                                            true,
                                            false,
                                            true,
                                            Color(0x33AFF00),
                                            Color(0xffcee6fa)),
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "التقاط صورة",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () {
                                              LoadIdImageImage(
                                                  ImageSource.camera);
                                              Navigator.of(context).pop();
                                            },
                                            // width: 120,
                                          ),
                                          DialogButton(
                                            child: Text(
                                              "تحميل صورة",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () {
                                              LoadIdImageImage(
                                                  ImageSource.gallery);
                                              Navigator.of(context).pop();
                                              print(image?.path);
                                            },
                                            // width: 120,
                                          )
                                        ],
                                      ).show();
                                    },
                                    // width: 120,
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "التالي",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                     OnDetectingSignsClicked(context);
                                    },
                                    width: 120,
                                  )
                                ],
                              ).show();
                            },
                            width: 120,
                          ),
                        ],
                      ).show();
                    }),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //  اعادة عملي
                ServiceCard(
                    Width: MediaQuery.of(context).size.width * .45,
                    Height: MediaQuery.of(context).size.height * .20,
                    CardName: ' اعادة عملي',
                    ImageAssetsLink: 'assets/images/my_marks.png',
                    OnTap: () {
                      Alert(
                        context: context,
                        style: MyStyleAlert(
                            true, false, true, Color(0x2A033AFF), Color1),
                        image: Image.asset(
                          'assets/images/my_marks.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        title: " اعادة عملي",
                        desc: "الرجاء اختيار المادة",
                        content: MyDropdownList(
                          selectedValue: selectedValuePractical,
                          items: controller.Subject,
                        ),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "التالي",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              int index = 0;
                              for(int i = 0 ; i < StudentSubjects.length ; i++){
                                if(StudentSubjects[i].name == selectedValuePractical.value){
                                  index = i;
                                  break;
                                }
                              }
                              controller.ReParticalId = StudentSubjects[index].id;
                              OnClickRePractical(context);
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }),
                // الغاء اعادة عملي
                ServiceCard(
                    Width: MediaQuery.of(context).size.width * .45,
                    Height: MediaQuery.of(context).size.height * .20,
                    CardName: 'الغاء اعادة عملي',
                    ImageAssetsLink: 'assets/images/cancellation.png',
                    OnTap: () {
                      Alert(
                        context: context,
                        style: MyStyleAlert(
                            true, false, true, Color(0x2A033AFF), Color1),
                        image: Image.asset(
                          'assets/images/cancellation.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        title: "الغاء اعادة عملي",
                        desc: "الرجاء اختيار المادة",
                        content: MyDropdownList(
                          selectedValue: selectedValuePractical,
                          items: controller.Subject,
                        ),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "التالي",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                                Navigator.of(context).pop();
                                int index = 0;
                                for(int i = 0 ; i < StudentSubjects.length ; i++){
                                  if(StudentSubjects[i].name == selectedValuePractical.value){
                                    index = i;
                                    break;
                                  }
                                }
                                controller.CancelRePracticalId = StudentSubjects[index].id;

                                OnClickCancelRePractical(context);
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //اعتلراض نظري
                ServiceCard(
                    Width: MediaQuery.of(context).size.width * .45,
                    Height: MediaQuery.of(context).size.height * .20,
                    CardName: 'اعتراض نظري',
                    ImageAssetsLink: 'assets/images/re-correction1.png',
                    OnTap: () {
                      Alert(
                        context: context,
                        style: MyStyleAlert(
                            true, false, true, Color(0x2A033AFF), Color1),
                        image: Image.asset(
                          'assets/images/re-correction1.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        title: "اعتراض نظري",
                        desc: "الرجاء اختيار المادة",
                        content: MyDropdownList(
                          selectedValue: selectedValueTheoretical,
                          items: controller.Subject,
                        ),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "التالي",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              print("+++++++++++$selectedValueTheoretical");
                              Alert(
                                context: context,
                                style: MyStyleAlert(true, false, true,
                                    Color(0x2A033AFF), Color1),
                                image: Image.asset(
                                  'assets/images/re-correction1.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                                title: "اعتراض نظري",
                                desc:
                                "سوف يتم خصم 2000 ليرة سورية من حسابك\n هل أنت واثق من الطلب ؟",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "إتمام العملية",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      int index = 0;
                                      for(int i = 0 ; i < StudentSubjects.length ; i++){
                                        if(StudentSubjects[i].name == selectedValuePractical.value){
                                          index = i;
                                          break;
                                        }
                                      }
                                      controller.SubjectObjectionTheoreticalId = StudentSubjects[index].id;
                                      OnClickSubmitObjectionTheoretical(
                                          context);
                                    },
                                    width: 120,
                                  )
                                ],
                              ).show();
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }),
                // اعتراض عملي
                ServiceCard(
                    Width: MediaQuery.of(context).size.width * .45,
                    Height: MediaQuery.of(context).size.height * .20,
                    CardName: 'اعتراض عملي',
                    ImageAssetsLink: 'assets/images/re-correction.png',
                    OnTap: () {
                      Alert(
                        context: context,
                        style: MyStyleAlert(
                            true, false, true, Color(0x2A033AFF), Color1),
                        image: Image.asset(
                          'assets/images/re-correction.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        title: "اعتراض عملي",
                        desc: "الرجاء اختيار المادة",
                        content: MyDropdownList(
                          selectedValue: selectedValuePractical,
                          items: controller.Subject,
                        ),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "التالي",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              print("+++++++++++$selectedValuePractical");
                              Alert(
                                context: context,
                                style: MyStyleAlert(true, false, true,
                                    Color(0x2A033AFF), Color1),
                                image: Image.asset(
                                  'assets/images/re-correction.png',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
                                ),
                                title: "اعتراض عملي",
                                desc:
                                "سوف يتم خصم 2000 ليرة سورية من حسابك\n هل أنت واثق من الطلب ؟",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "إتمام العملية",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      int index = 0;
                                      for(int i = 0 ; i < StudentSubjects.length ; i++){
                                        if(StudentSubjects[i].name == selectedValuePractical.value){
                                          index = i;
                                          break;
                                        }
                                      }
                                      controller.SubjectObjectionPracticalId = StudentSubjects[index].id;
                                      OnClickSubmitObjectionPractical(context);
                                    },
                                    width: 120,
                                  )
                                ],
                              ).show();
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //حياة جامعية
                ServiceCard(
                    Width: MediaQuery.of(context).size.width * .45,
                    Height: MediaQuery.of(context).size.height * .20,
                    CardName: 'حياة جامعية',
                    ImageAssetsLink: 'assets/images/document.png',
                    OnTap: () {
                      controller.UniversityCard = null;
                      controller.IdImage = null;
                      Alert(
                        context: context,
                        style: MyStyleAlert(
                            true, false, true, Color(0x033AFF00), Color1),
                        image: Image.asset(
                          'assets/images/document.png',
                          width: 100,
                          height: 100,
                        ),
                        title: "حياة جامعية",
                        desc:
                        "ادخل البيانات",
                        buttons: [
                          DialogButton(
                            child: Container(
                              alignment: Alignment(0, 0),
                              child: Text(
                                "صورة البطاقة الجامعية",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: () {
                              Alert(
                                context: context,
                                style: MyStyleAlert(
                                    true,
                                    false,
                                    true,
                                    Color(0x33AFF00),
                                    Color(0xffcee6fa)),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "التقاط صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadUniversityCardImage(
                                          ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                    // width: 120,
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "تحميل صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadUniversityCardImage(
                                          ImageSource.gallery);
                                      Navigator.of(context).pop();
                                      print(image?.path);
                                    },
                                    // width: 120,
                                  )
                                ],
                              ).show();
                            },
                            // width: 120,
                          ),
                          DialogButton(
                            child: Container(
                              alignment: Alignment(.2, 0),
                              child: Text(
                                "صورة الهوية الشخصية",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: () {
                              Alert(
                                context: context,
                                style: MyStyleAlert(true, false, true,
                                    Color(0x33AFF00), Color(0xffcee6fa)),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "التقاط صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadIdImageImage(
                                          ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                    // width: 120,
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "تحميل صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadIdImageImage(
                                          ImageSource.gallery);
                                      Navigator.of(context).pop();
                                      print(image?.path);
                                    },
                                    // width: 120,
                                  )
                                ],
                              ).show();
                            },
                            // width: 120,
                          ),
                          DialogButton(
                            child: Text(
                              "التالي",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              OnCollegeLifeClicked(context);
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }),
                //مصدقة تخرج
                ServiceCard(
                    Width: MediaQuery.of(context).size.width * .45,
                    Height: MediaQuery.of(context).size.height * .20,
                    CardName: 'مصدقة تخرج',
                    ImageAssetsLink: 'assets/images/diploma.png',
                    OnTap: () {
                      controller.AcquittalFromUniversity = null;
                      controller.AcquittalFromHousing = null;
                      controller.ClearanceCredit = null;
                      Alert(
                        context: context,
                        style: MyStyleAlert(
                            true, false, true, Color(0x033AFF00), Color1),
                        image: Image.asset(
                          'assets/images/diploma.png',
                          width: 100,
                          height: 100,
                        ),
                        title: "مصدقة تخرج",
                        desc:
                        "ادخل البيانات",
                        buttons: [
                          DialogButton(
                            child: Container(
                              alignment: Alignment(0, 0),
                              child: Text(
                                "براءة ذمة من الجامعة",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: () {
                              Alert(
                                context: context,
                                style: MyStyleAlert(
                                    true,
                                    false,
                                    true,
                                    Color(0x33AFF00),
                                    Color(0xffcee6fa)),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "التقاط صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadAcquittalFromUniversityImage(
                                          ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                    // width: 120,
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "تحميل صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadAcquittalFromUniversityImage(
                                          ImageSource.gallery);
                                      Navigator.of(context).pop();
                                      print(image?.path);
                                    },
                                    // width: 120,
                                  )
                                ],
                              ).show();
                            },
                            // width: 120,
                          ),
                          DialogButton(
                            child: Container(
                              alignment: Alignment(.2, 0),
                              child: Text(
                                "براءة ذمة من السكن",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: () {
                              Alert(
                                context: context,
                                style: MyStyleAlert(true, false, true,
                                    Color(0x33AFF00), Color(0xffcee6fa)),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "التقاط صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadAcquittalFromHousingImage(
                                          ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                    // width: 120,
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "تحميل صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadAcquittalFromHousingImage(
                                          ImageSource.gallery);
                                      Navigator.of(context).pop();
                                      print(image?.path);
                                    },
                                    // width: 120,
                                  )
                                ],
                              ).show();
                            },
                            // width: 120,
                          ),
                          DialogButton(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "براءة ذمة من التسليف الطلابي",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: () {
                              Alert(
                                context: context,
                                style: MyStyleAlert(
                                    true,
                                    false,
                                    true,
                                    Color(0x33AFF00),
                                    Color(0xffcee6fa)),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "التقاط صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadClearanceCreditImage(
                                          ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                    // width: 120,
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "تحميل صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadClearanceCreditImage(
                                          ImageSource.gallery);
                                      Navigator.of(context).pop();
                                      print(image?.path);
                                    },
                                    // width: 120,
                                  )
                                ],
                              ).show();
                            },
                            // width: 120,
                          ),
                          DialogButton(
                            child: Text(
                              "التالي",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              OnCertifiedGraduationClicked(context);
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ServiceCard(
                    Width: MediaQuery.of(context).size.width * .45,
                    Height: MediaQuery.of(context).size.height * .20,
                    CardName: 'وثيقة ترفع',
                    ImageAssetsLink: 'assets/images/page.png',
                    OnTap: () {
                      Alert(
                        context: context,
                        style: MyStyleAlert(
                            true, false, true, Color(0x033AFF00), Color1),
                        image: Image.asset(
                          'assets/images/page.png',
                          width: 100,
                          height: 100,
                        ),
                        title: "وثيقة ترفع",
                        desc:
                        "هل أنت متأكد من طلبك ؟",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "التالي",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              OnRaisedDocumentClicked(context);
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }),

                //وثيقة التسجيل
                ServiceCard (
                    Width: MediaQuery.of(context).size.width * .45,
                    Height: MediaQuery.of(context).size.height * .20,
                    CardName: 'وثيقة تسجيل',
                    ImageAssetsLink: 'assets/images/registration.png',
                    OnTap: () {
                      controller.BloodDonationDocument = null;
                      controller.IdImage = null;
                      controller.RegisterDocument = null;
                      Alert(
                        context: context,
                        style: MyStyleAlert(
                            true, false, true, Color(0x033AFF00), Color1),
                        image: Image.asset(
                          'assets/images/registration.png',
                          width: 100,
                          height: 100,
                        ),
                        title: "وثيقة تسجيل",
                        desc:
                        "ادخل البيانات",
                        buttons: [
                          DialogButton(
                            child: Container(
                              alignment: Alignment(.2, 0),
                              child: Text(
                                "تبرع بالدم",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: () {
                              Alert(
                                context: context,
                                style: MyStyleAlert(true, false, true,
                                    Color(0x33AFF00), Color(0xffcee6fa)),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "التقاط صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadBloodDonationDocumentImage(
                                          ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                    // width: 120,
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "تحميل صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadBloodDonationDocumentImage(
                                          ImageSource.gallery);
                                      Navigator.of(context).pop();
                                      print(image?.path);
                                    },
                                    // width: 120,
                                  )
                                ],
                              ).show();
                            },
                            // width: 120,
                          ),
                          DialogButton(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "صورة هوية",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: () {
                              Alert(
                                context: context,
                                style: MyStyleAlert(
                                    true,
                                    false,
                                    true,
                                    Color(0x33AFF00),
                                    Color(0xffcee6fa)),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "التقاط صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadIdImageImage(
                                          ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                    // width: 120,
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "تحميل صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadIdImageImage(
                                          ImageSource.gallery);
                                      Navigator.of(context).pop();
                                      print(image?.path);
                                    },
                                    // width: 120,
                                  )
                                ],
                              ).show();
                            },
                            // width: 120,
                          ),
                          DialogButton(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "ايصال التسجيل بالجامعة",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: () {
                              Alert(
                                context: context,
                                style: MyStyleAlert(
                                    true,
                                    false,
                                    true,
                                    Color(0x33AFF00),
                                    Color(0xffcee6fa)),
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "التقاط صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadRegisterDocumentImage(
                                          ImageSource.camera);
                                      Navigator.of(context).pop();
                                    },
                                    // width: 120,
                                  ),
                                  DialogButton(
                                    child: Text(
                                      "تحميل صورة",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    onPressed: () {
                                      LoadRegisterDocumentImage(
                                          ImageSource.gallery);
                                      Navigator.of(context).pop();
                                      print(image?.path);
                                    },
                                    // width: 120,
                                  )
                                ],
                              ).show();
                            },
                            // width: 120,
                          ),
                          DialogButton(
                            child: Text(
                              "التالي",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              OnRegisteringDocumentClicked(context);
                            },
                            width: 120,
                          )
                        ],
                      ).show();
                    }),

              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              //وثيقة دوام
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ServiceCard(
                      Width: MediaQuery.of(context).size.width * .45,
                      Height: MediaQuery.of(context).size.height * .20,
                      CardName: 'وثيقة دوام',
                      ImageAssetsLink: 'assets/images/project.png',
                      OnTap: () {
                        controller.BloodDonationDocument = null;
                        controller.IdImage = null;
                        controller.RegisterDocument = null;
                        Alert(
                          context: context,
                          style: MyStyleAlert(
                              true, false, true, Color(0x033AFF00), Color1),
                          image: Image.asset(
                            'assets/images/project.png',
                            width: 100,
                            height: 100,
                          ),
                          title: "وثيقة تسجيل",
                          desc:
                          "ادخل البيانات",
                          buttons: [
                            DialogButton(
                              child: Container(
                                alignment: Alignment(.2, 0),
                                child: Text(
                                  "تبرع بالدم",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              onPressed: () {
                                Alert(
                                  context: context,
                                  style: MyStyleAlert(true, false, true,
                                      Color(0x33AFF00), Color(0xffcee6fa)),
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "التقاط صورة",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {
                                        LoadBloodDonationDocumentImage(
                                            ImageSource.camera);
                                        Navigator.of(context).pop();
                                      },
                                      // width: 120,
                                    ),
                                    DialogButton(
                                      child: Text(
                                        "تحميل صورة",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {
                                        LoadBloodDonationDocumentImage(
                                            ImageSource.gallery);
                                        Navigator.of(context).pop();
                                        print(image?.path);
                                      },
                                      // width: 120,
                                    )
                                  ],
                                ).show();
                              },
                              // width: 120,
                            ),
                            DialogButton(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "صورة هوية",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              onPressed: () {
                                Alert(
                                  context: context,
                                  style: MyStyleAlert(
                                      true,
                                      false,
                                      true,
                                      Color(0x33AFF00),
                                      Color(0xffcee6fa)),
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "التقاط صورة",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {
                                        LoadIdImageImage(
                                            ImageSource.camera);
                                        Navigator.of(context).pop();
                                      },
                                      // width: 120,
                                    ),
                                    DialogButton(
                                      child: Text(
                                        "تحميل صورة",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {
                                        LoadIdImageImage(
                                            ImageSource.gallery);
                                        Navigator.of(context).pop();
                                        print(image?.path);
                                      },
                                      // width: 120,
                                    )
                                  ],
                                ).show();
                              },
                              // width: 120,
                            ),
                            DialogButton(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "ايصال التسجيل بالجامعة",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              onPressed: () {
                                Alert(
                                  context: context,
                                  style: MyStyleAlert(
                                      true,
                                      false,
                                      true,
                                      Color(0x33AFF00),
                                      Color(0xffcee6fa)),
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "التقاط صورة",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {
                                        LoadRegisterDocumentImage(
                                            ImageSource.camera);
                                        Navigator.of(context).pop();
                                      },
                                      // width: 120,
                                    ),
                                    DialogButton(
                                      child: Text(
                                        "تحميل صورة",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20),
                                      ),
                                      onPressed: () {
                                        LoadRegisterDocumentImage(
                                            ImageSource.gallery);
                                        Navigator.of(context).pop();
                                        print(image?.path);
                                      },
                                      // width: 120,
                                    )
                                  ],
                                ).show();
                              },
                              // width: 120,
                            ),
                            DialogButton(
                              child: Text(
                                "التالي",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                OnWorkDocumentClicked(context);
                              },
                              width: 120,
                            )
                          ],
                        ).show();
                      }),
                ),
                SizedBox(
                  height: 30,
                ),



              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar:Obx((){
        return MyBottomNavigationBar(MediaQuery.of(context).size.height * .06, 0);
      })

    );
  }

  void LoadFinancialDocumentImage(ImageSource imageSource) async {
    controller.FinancialDocument = await PickImage(imageSource);

  }

  void LoadBloodDonationDocumentImage(ImageSource imageSource) async {
    controller.BloodDonationDocument = await PickImage(imageSource);
  }

  void LoadIdImageImage(ImageSource imageSource) async {
    controller.IdImage = await PickImage(imageSource);
  }

  void LoadAcquittalFromHousingImage(ImageSource imageSource) async {
    controller.AcquittalFromHousing = await PickImage(imageSource);
  }

  void LoadAcquittalFromUniversityImage(ImageSource imageSource) async {
    controller.AcquittalFromUniversity = await PickImage(imageSource);
  }

  void LoadClearanceCreditImage(ImageSource imageSource) async {
    controller.ClearanceCredit = await PickImage(imageSource);
  }

  void LoadUniversityCardImage(ImageSource imageSource) async {
    controller.UniversityCard = await PickImage(imageSource);
  }

  void LoadRegisterDocumentImage(ImageSource imageSource) async {
    controller.RegisterDocument = await PickImage(imageSource);
    print("lllllllllllllllllllllllll");
    print(controller.RegisterDocument);
  }

  void OnClickMyMarks() {
    Get.toNamed('/my_marks');
  }

  void OnDetectingSignsClicked(BuildContext context)async{
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    print(controller.FinancialDocument?.path);
    // if(controller.FinancialDocument == null){
    //   EasyLoading.showError(
    //     "صورة الايصال المالي مطلوبة",
    //     duration: Duration(seconds: 4),
    //     dismissOnTap: true,
    //     maskType: EasyLoadingMaskType.black,
    //   );
    //   return;
    // }
    if(controller.BloodDonationDocument == null){
      EasyLoading.showError(
        "صورة وثيقة التبرع بالدم مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }
    if(controller.IdImage == null){
      EasyLoading.showError(
        "صورة الهوية الشخصية مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }

    await controller.DetectingSignsRequest();
    EasyLoading.dismiss();
    if(controller.AccountIsEnough == false){
      EasyLoading.showError(
        "لا يوجد رصيد كافي",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      controller.AccountIsEnough = true;
      return;
    }
    if (!controller.StatusRequest) {
      EasyLoading.showError(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    } else
      EasyLoading.showSuccess(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    Navigator.of(context).pop();
  }

  void OnClickSubmitObjectionPractical(BuildContext context) async {
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    await controller.ObjectionPracticalRequest();
    EasyLoading.dismiss();
    if(controller.AccountIsEnough == false){
      EasyLoading.showError(
        "لا يوجد رصيد كافي",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      controller.AccountIsEnough = true;
      return;
    }
    if (!controller.StatusRequest) {
      EasyLoading.showError(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    } else
      EasyLoading.showSuccess(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
  }
  void OnClickCancelRePractical(BuildContext context) async {
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    await controller.CancelRePracticalRequest();

    if (!controller.StatusRequest) {
      EasyLoading.showError(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    } else
      EasyLoading.showSuccess(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
  }


  void OnClickSubmitObjectionTheoretical(BuildContext context) async {
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    await controller.ObjectionTheoreticalRequest();
    EasyLoading.dismiss();
    if(controller.AccountIsEnough == false){
      EasyLoading.showError(
        "لا يوجد رصيد كافي",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      controller.AccountIsEnough = true;
      return;
    }
    if (!controller.StatusRequest) {
      EasyLoading.showError(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    } else
      EasyLoading.showSuccess(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
  }

  void OnCertifiedGraduationClicked(BuildContext context)async{
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    if(controller.AcquittalFromUniversity == null){
      EasyLoading.showError(
        "صورة براءة ذمة من الجامعة مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }
    if(controller.AcquittalFromHousing == null){
      EasyLoading.showError(
        "صورة براءة ذمة من السكن مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }
    if(controller.ClearanceCredit == null){
      EasyLoading.showError(
        "صورة براءة ذمة من التسليف الطلابي مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }

    await controller.CertifiedGraduationRequest();
    EasyLoading.dismiss();

    if (!controller.StatusRequest) {
      EasyLoading.showError(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    } else
      EasyLoading.showSuccess(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );

    Navigator.of(context).pop();
  }
  void OnClickRePractical(BuildContext context)async{
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    await controller.RePracticalRequest();

    EasyLoading.dismiss();

    if (!controller.StatusRequest) {
      EasyLoading.showError(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    } else
      EasyLoading.showSuccess(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );

  }


  void OnCollegeLifeClicked(BuildContext context)async{
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    if(controller.UniversityCard == null){
      EasyLoading.showError(
        "صورة البطاقة الجامعة مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }
    if(controller.IdImage == null){
      EasyLoading.showError(
        "صورة الهوية الشخصية مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }

    await controller.CollegeLifeRequest();
    EasyLoading.dismiss();

    if (!controller.StatusRequest) {
      EasyLoading.showError(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    } else
      EasyLoading.showSuccess(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    controller.UniversityCard = null;
    controller.IdImage = null;
    Navigator.of(context).pop();
  }

  void OnRegisteringDocumentClicked(BuildContext context)async{
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    if(controller.BloodDonationDocument == null){
      EasyLoading.showError(
        "وثيقة التبرع بالدم مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }
    if(controller.IdImage == null){
      EasyLoading.showError(
        "صورة الهوية الشخصية مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }

    if(controller.RegisterDocument == null){
      EasyLoading.showError(
        "ايصال التسجيل بالجامعة مطلوب",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }
    await controller.RegisteringDocumentRequest();
    EasyLoading.dismiss();

    if (!controller.StatusRequest) {
      EasyLoading.showError(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    } else
      EasyLoading.showSuccess(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    Navigator.of(context).pop();
  }

  void OnWorkDocumentClicked(BuildContext context)async{
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    if(controller.BloodDonationDocument == null){
      EasyLoading.showError(
        "وثيقة التبرع بالدم مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }
    if(controller.IdImage == null){
      EasyLoading.showError(
        "صورة الهوية الشخصية مطلوبة",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }

    if(controller.RegisterDocument == null){
      EasyLoading.showError(
        "ايصال التسجيل بالجامعة مطلوب",
        duration: Duration(seconds: 4),
        dismissOnTap: true,
        maskType: EasyLoadingMaskType.black,
      );
      return;
    }
    await controller.WorkDocumentRequest();
    EasyLoading.dismiss();

    if (!controller.StatusRequest) {
      EasyLoading.showError(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    } else
      EasyLoading.showSuccess(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    Navigator.of(context).pop();
  }

  void OnRaisedDocumentClicked(BuildContext context)async{
    EasyLoading.instance..userInteractions = false;
    EasyLoading.show(
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
    await controller.RaisedDocumentRequest();
    EasyLoading.dismiss();

    if (!controller.StatusRequest) {
      EasyLoading.showError(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    } else
      EasyLoading.showSuccess(
        controller.Message,
        duration: Duration(seconds: 4),
        dismissOnTap: false,
        maskType: EasyLoadingMaskType.black,
      );
    Navigator.of(context).pop();
  }

}