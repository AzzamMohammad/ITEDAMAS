import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:university_app/components/line_devider.dart';
import '../constant.dart';

class AdsCard extends StatelessWidget {
  late String Post;
  late String DateOfPost = '';
  late String Imagee;
  late bool ImageIsNull = true;
  late DateTime Date;

  AdsCard(String post , DateTime Date , String Image){
    this.Post = post;
    this.Date = Date;
    this.Imagee = Image;
    DateOfAds(Date);

  }

  void DateOfAds(DateTime date){
    DateTime naw = DateTime.now();
    var Difference = naw.difference(date);
    if(Difference.inHours < 1){
      this.DateOfPost = 'منذ ${Difference.inMinutes} دقيقة ';
    }
    else if(Difference.inHours < 24){
      this.DateOfPost = 'منذ ${Difference.inHours} ساعة ';
    }else if(Difference.inDays < 7){
      this.DateOfPost = 'منذ ${Difference.inDays} يوم ';
    }else if(Difference.inDays >7 && Difference.inDays <30){
      int week = Difference.inDays ~/7;
      if(week <4)
        this.DateOfPost = 'منذ ${week} اسبوع  ';
      else
      this.DateOfPost = 'منذ شهر ';

    }
    else if(Difference.inDays < 360){
      int month = Difference.inDays ~/30;
      if(month <1)
        month = 1;
      if(month > 12)
        month = 12;
      this.DateOfPost = 'منذ ${month} شهر ';
    }
    else {
      this.DateOfPost = "${Difference.inDays}";
    }
  }

  void FindImage(String? Image){
    if(this.Imagee == 'http://192.168.43.34:8000/image_student'){
      print(".kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
      this.ImageIsNull = false;
      return;
    }
    this.ImageIsNull = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'إعلان',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 30, color: Color1),
            ),
            Text(
              DateOfPost,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 15, color: Color1),
            ),
          ],
        ),
        LineDev(
          lineLength: MediaQuery.of(context).size.width,
          lineThickness: 1,
          lineColor: Color1,
        ),
        AutoSizeText(
          Post,
          style: TextStyle(fontSize: 18),
          textDirection: TextDirection.rtl,
        ),
        SizedBox(
          height: 10,
        ),
       ImageIsNull ?
        Image.network(
           Imagee ,
          fit: BoxFit.fitHeight,
        ) : Image.asset(
             'assets/images/ads.png',
         fit: BoxFit.fitHeight,
       ),
        SizedBox(
          height: 20,
        ),
        LineDev(
          lineLength: MediaQuery.of(context).size.width,
          lineThickness: 4,
          lineColor: Color1,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
