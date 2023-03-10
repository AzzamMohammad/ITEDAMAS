import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_app/components/line_devider.dart';
import 'package:university_app/modules/home/home_controller.dart';
import '../../components/ads_card.dart';
import '../../components/app_bar.dart';
import '../../components/bottom_bar.dart';
import '../../components/my_drawer.dart';
import '../../constant.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

class Home extends StatelessWidget {
  HomeController controller = Get.find();

  final UniversityImages = [
   'assets/images/UnIm1.jpg',
   'assets/images/UnIm2.jpg',
   'assets/images/UnIm3.jpg',
   'assets/images/UnIm4.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar('ITE Damas',MediaQuery.of(context).size.width * .25,false) ,
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: UniversityImages.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  child: Image.asset(
                    UniversityImages[index],
                    fit: BoxFit.fill,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .3,
                );
              },
              options: CarouselOptions(
                aspectRatio: 400,
                height: MediaQuery.of(context).size.height * .25,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 8),
                viewportFraction: 1,
                autoPlayCurve: Curves.easeInOut,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx((){
              if(controller.CheckReferich.value){
                return Container();
              }
              else{
                return Expanded(
                  child: ListView.builder(
                      itemCount: controller.Ads.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: AdsCard(controller.Ads[index].description,controller.Ads[index].createdAt,controller.Ads[index].img));
                      }),
                );
              }
            }),
          ],
        ),
      ),
        bottomNavigationBar:Obx((){
          return MyBottomNavigationBar(MediaQuery.of(context).size.height * .06, 2);
        })    );
  }
}
