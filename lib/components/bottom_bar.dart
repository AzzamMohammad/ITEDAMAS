import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constant.dart';

ConvexAppBar MyBottomNavigationBar(double Height,int IndexPage) {
  String NotificationNumber = '';
  if(notificationAndAccount.NumberOfNewNotification != 0){
    NotificationNumber = "${notificationAndAccount.NumberOfNewNotification}";
  }

  int index =IndexPage;

  return ConvexAppBar.badge(
    {3:NotificationNumber},
    style: TabStyle.flip,
    items: [
      TabItem(icon: Icons.widgets_rounded, title: 'الخدمات'),
      TabItem(icon: Icons.person, title: 'الملف الشخصي'),
      TabItem(icon: Icons.home, title: 'الرئيسية'),
      TabItem(icon: Icons.notifications, title: 'الإشعارات'),
      TabItem(icon: Icons.logout, title: 'الخروج'),
    ],
    height: Height,
    color: Color4,
    activeColor: Colors.white,
    backgroundColor: Color1,
    badgeColor: Color2,
    onTap: (index) => {
      if (index == 0)
        {Get.offAllNamed('/services')}
      else if (index == 1)
        {Get.offAllNamed('/profile')}
      else if (index == 2)
        {Get.offAllNamed('/home')}
        else if (index == 3)
            {Get.offAllNamed('/notifications')}
      else if (index == 4)
        {Get.offAllNamed('/logout')}
    },
    initialActiveIndex: index,
  );
}
