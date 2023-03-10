import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_app/components/app_bar.dart';
import 'package:university_app/components/bottom_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:university_app/modules/profile/profile_controller.dart';

import '../../components/go_button.dart';
import '../../constant.dart';

class Profile extends StatelessWidget {
  ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color1,
        appBar: MyAppBar(
            "الملف الشخصي", MediaQuery.of(context).size.width * .25, false),
        body: SafeArea(
          child: Obx((){
            if(controller.IsRefeich.value){
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .97,
                        height: MediaQuery.of(context).size.height * .20,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(70))),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20, left: 40),
                              child: Container(
                                width: 110,
                                height: 130,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(120)),
                                    color: Color2),
                                child: Image.asset(
                                  'assets/images/student.png',
                                  width: 15,
                                  height: 15,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // Icon(Icons.person),
                                    Image.asset(
                                      'assets/images/studentIcon.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    AutoSizeText(
                                      controller.person.Name,
                                      style: TextStyle(color: Color1, fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'assets/images/cap.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    AutoSizeText(
                                      controller.person.Year,
                                      style: TextStyle(color: Color1, fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      'assets/images/coding.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: AutoSizeText(
                                        controller.person.Part,
                                        style:
                                        TextStyle(color: Color1, fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height * .10,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .10,
                    decoration: BoxDecoration(
                      color: Color1,
                      // borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),topLeft: Radius.circular(30))
                    ),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'سنة التسجيل',
                              style: TextStyle(fontSize: 17, color: Colors.white),
                            ),
                            AutoSizeText(controller.person.RegisterYear,
                                style: TextStyle(fontSize: 15, color: Colors.white))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('المعدل العام',
                                style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                            AutoSizeText("${controller.person.TotalAvg}%",
                                style: TextStyle(fontSize: 15, color: Colors.white))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('المعدل الحالي',
                                style:
                                TextStyle(fontSize: 17, color: Colors.white)),
                            AutoSizeText("${controller.person.YearlyAvg}%",
                                style: TextStyle(fontSize: 15, color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .97,
                        height: MediaQuery.of(context).size.height * .534,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(70))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .35,
                                  height: MediaQuery.of(context).size.height * .13,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [Color1, Color2]),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        'assets/images/father.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      AutoSizeText(controller.person.FatherName,
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .35,
                                  height: MediaQuery.of(context).size.height * .13,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [Color1, Color2]),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        'assets/images/mother.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      AutoSizeText(controller.person.MotherName,
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .35,
                                  height: MediaQuery.of(context).size.height * .13,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Color1, Color2]),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        'assets/images/id.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      AutoSizeText("${controller.person.Id}",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .35,
                                  height: MediaQuery.of(context).size.height * .13,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [Color1, Color2]),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        'assets/images/phoneNumber.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      AutoSizeText(
                                          "${controller.person.PhoneNumber}",
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .35,
                                  height: MediaQuery.of(context).size.height * .13,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [Color1, Color2]),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        'assets/images/email.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      Container(
                                          width: MediaQuery.of(context).size.width *
                                              .33,
                                          child: AutoSizeText(
                                              controller.person.Email,
                                              style: TextStyle(color: Colors.white),
                                              maxLines: 3,
                                              textAlign: TextAlign.center))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * .35,
                                  height: MediaQuery.of(context).size.height * .13,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: [Color1, Color2]),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Image.asset(
                                        'assets/images/upDown.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      Container(
                                          width: MediaQuery.of(context).size.width *
                                              .33,
                                          child: AutoSizeText(
                                              controller.person.Status,
                                              style: TextStyle(color: Colors.white),
                                              maxLines: 3,
                                              textAlign: TextAlign.center))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
            else{
              return Container();
            }
          })

        ),
        bottomNavigationBar: Obx(() {
          return MyBottomNavigationBar(
              MediaQuery.of(context).size.height * .06, 1);
        }));
  }
}
