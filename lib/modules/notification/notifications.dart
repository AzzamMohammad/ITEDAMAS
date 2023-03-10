import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:university_app/components/notification_card.dart';
import 'package:university_app/modules/notification/notification_controller.dart';
import '../../components/app_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../components/bottom_bar.dart';
import '../../constant.dart';

class Notifications extends StatelessWidget {
  NotificationController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MyAppBar('الإشعارات', MediaQuery.of(context).size.width * .25, false),
      body: SafeArea(
        child: Column(
          children: [
            Obx((){
              if(controller.CheckReferich.value){
                return Center(

                );

              }
              else{
               if(controller.Notifications.length != 0){
                 return Expanded(
                     child:MasonryGridView.count(
                         crossAxisCount: 1,
                         itemCount: controller.Notifications.length,
                         itemBuilder: (context,index) {
                           return NotificationCard(
                               controller.Notifications[index].text,
                               controller.Notifications[index].read,controller.Notifications,index);
                         }


                     )
                 );
               }
               else{
                 return Center(
                   child: Text("لا يوجد بيانات لعرضها",style: TextStyle(fontSize: 20 , color: Color1),),
                 );
               }
              }
            })
          ],
        ),

      ),
        bottomNavigationBar:Obx((){
          return MyBottomNavigationBar(MediaQuery.of(context).size.height * .06, 3);
        })    );
  }
}
