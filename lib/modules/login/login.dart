import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_app/components/go_button.dart';
import 'package:university_app/components/line_devider.dart';
import 'package:university_app/modules/login/login_controller.dart';

import '../../components/my_password_fild.dart';
import '../../components/my_text_fild.dart';
import '../../constant.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Login extends StatelessWidget {
  LoginController controller = Get.find();

  var CheckBoxColor = Colors.white.obs;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(fontSize: 50, color: Color1),
                  ),
                ],
              ),
              LineDev(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyTextFild(
                    FildHeight: 50,
                    FildWidth: MediaQuery.of(context).size.width * .7,
                    OnChanged: (Value) {
                      controller.StudentEmail = Value;
                    },
                    HintText: "البريد الإلكتروني",
                    FildColor: Colors.white,
                    KeyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                   MyPasswordFild(
                      FildHeight: 50,
                      FildWidth: MediaQuery.of(context).size.width * .7,
                      OnChanged: (Value) {
                        controller.StudentPassword = Value;
                      },
                      HintText: "كلمة السر",
                      FildColor: Colors.white,
                      KeyboardType: TextInputType.visiblePassword,
                    ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: MediaQuery.of(context).size.height * 0.07),
                    child: Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text('تذكرني لاحقاً',style: TextStyle(color: Color1,fontSize: 15,fontWeight: FontWeight.bold),),
                        SizedBox(
                          width: 15,
                        ),
                        Obx((){
                          return GestureDetector(
                            onTap: (){
                              controller.CheckBoxStatus = !controller.CheckBoxStatus;
                              if(controller.CheckBoxStatus == true)
                                CheckBoxColor(Color1) ;
                              else
                                CheckBoxColor(Colors.white);

                            },
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  border: Border.all(color: Color1,width: 2),
                                  color:CheckBoxColor.value
                              ),
                              child: Icon(Icons.check,color: Colors.white,size: 17,),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Align(
                    alignment: Alignment(-0.54,-0.7),
                    child: Column(
                      children: [
                        GoButton(
                            Width: MediaQuery.of(context).size.width * .35,
                            Height: 50,
                            ButtonName: "سجل",
                            OnTap: (){
                              OnClickLogin();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  OnClickLogin()async{


    EasyLoading.show(
      dismissOnTap: false,
      maskType:EasyLoadingMaskType.black,
    );
    await controller.LoginClicked();
    if(controller.State == true){
      EasyLoading.dismiss();
      Get.offAllNamed('/home');
    }
    else{
      EasyLoading.showError(
        controller.Message,
        dismissOnTap: true,
        duration: Duration(seconds: 4),
        maskType:EasyLoadingMaskType.black,
      );
    }
    print(controller.Message);
  }
}

