import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import '../../components/my_style_alert.dart';
import '../../constant.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../models/notification.dart';


class NotificationCard extends StatelessWidget {

  late String NotificationBody;
  var IsReadFlag = true.obs;
  late List<Notificationn> NotificationList;
  late int index;

//   NotificationCard({
//    required this.NotificationTitle,
//    required this.NotificationBody,
//    required this.IsRead
// });
  NotificationCard( String NotificationBody ,int IsRead , List<Notificationn> NotificationList , int index){
      this.NotificationList = NotificationList;
      this.index = index;
      this.NotificationBody = NotificationBody;
      if(IsRead == 0)
        IsReadFlag(false);
      else
        IsReadFlag(true);
    }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          IsReadFlag(true);
          NotificationList[index].read = 1;
        Alert(
          context: context,
          style: MyStyleAlert(
              true, false, false,
              Color(0xADD2D8F8),
              Color1),
          image: Image.asset(
            'assets/images/notification.png',
            width: 100,
            height: 100,
          ),
          // title: "وثيقة ترفع",
          desc:"${NotificationBody}"
        ).show();
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx((){
          return Container(
            decoration: BoxDecoration(
              color: IsReadFlag.value ? Colors.white : Color(0xADD2D8F8) ,
            ),
            height: MediaQuery.of(context).size.height *.13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width *.2,
                  child: Image.asset(
                    'assets/images/notification.png',
                    width: 70,
                    height: 70,
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width *.7,
                    child:AutoSizeText("${NotificationBody}",style: TextStyle(fontSize: 19,color: Color1),overflow:TextOverflow.ellipsis,maxLines: 2,minFontSize: 20,maxFontSize: 20,)
                ),
              ],
            ),
          );
        }),
      ),
    );

  }
}
