import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import 'line_devider.dart';

class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Color2, Color3])),
            child: Center(
              child: Text(
                'ITE Damas',
                style: TextStyle(fontSize: 20, color: Color1),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'كشف العلامات',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Color1),
            ),
            onTap: () {},
          ),
          LineDev(
            lineLength: MediaQuery.of(context).size.width,
            lineThickness: 1,
          ),
          ListTile(
            title: Text(
              'اعتراض علامة',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Color1),
            ),
            onTap: () {},
          ),
          LineDev(
            lineLength: MediaQuery.of(context).size.width,
            lineThickness: 1,
          ),
          ListTile(
            title: Text(
              'سجل الإعتراضات',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Color1),
            ),
            onTap: () {},
          ),
          LineDev(
            lineLength: MediaQuery.of(context).size.width,
            lineThickness: 1,
          ),
          ListTile(
            title: Text(
              'طلب إعادة عملي',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Color1),
            ),
            onTap: () {},
          ),
          LineDev(
            lineLength: MediaQuery.of(context).size.width,
            lineThickness: 1,
          ),
          ListTile(
            title: Text(
              'علاماتي',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Color1),
            ),
            onTap: () {},
          ),
          LineDev(
            lineLength: MediaQuery.of(context).size.width,
            lineThickness: 1,
          ),
          ListTile(
            title: Text(
              'الملف الشخصي',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Color1),
            ),
            onTap: () {},
          ),
          LineDev(
            lineLength: MediaQuery.of(context).size.width,
            lineThickness: 1,
          ),
          ListTile(
            title: Text(
              'سجل العلامات الصادرة',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Color1),
            ),
            onTap: () {},
          ),
          LineDev(
            lineLength: MediaQuery.of(context).size.width,
            lineThickness: 1,
          ),
          ListTile(
            title: Text(
              'حول التطبيق ',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Color1),
            ),
            onTap: () {},
          ),
          LineDev(
            lineLength: MediaQuery.of(context).size.width,
            lineThickness: 1,
          ),
          ListTile(
            title: Text(
              'تسجيل الخروج',
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 20, color: Color1),
            ),
            onTap: () {},
          ),
          // LineDev(lineLength: MediaQuery.of(context).size.width,lineThickness: 1,),
          ListTile(
            title: Text(
              'ITE Dmas v 0.0.1',
              style: TextStyle(fontSize: 15, color: Color2),
            ),
          ),
        ],
      ),
    );
  }
}
