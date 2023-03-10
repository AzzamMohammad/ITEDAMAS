import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../constant.dart';

class MarkCard extends StatelessWidget {
  final String SubjectName;
  final int PracticalMark;
  final int TheoreticalMark;
  final int MySemester;
  final int Year;
  final String MyStatus ;
  final int TotalMark;


  MarkCard({
    required this.SubjectName,
    required this.PracticalMark,
    required this.MySemester,
    required this.TheoreticalMark,
    required this.Year,
    required this.MyStatus,
    required this.TotalMark
  });


  @override
  Widget build(BuildContext context) {
    final double Width = MediaQuery.of(context).size.width;
    Icon icon ;
    if(MyStatus == 'نجاح')
      icon = Icon(
        Icons.check_box_outlined,
        color: Colors.green,
        size: 40,
      );
    else
      icon = Icon(
        Icons.disabled_by_default_outlined,
        color: Colors.red,
        size: 40,
      );

    String Semester = '';
    if(MySemester == 1)
      Semester = 'الفصل الأول';
    else if(MySemester == 2 )
      Semester = 'الفصل الثاني';


    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color1, width: 2),
          boxShadow: [
            BoxShadow(
                color: Color1,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(3, 3))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Width * .04, right: Width * .03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    MyStatus,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Color1),
                  ),
                  icon
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Width * .02, right: Width * .02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: 100,
                    decoration: BoxDecoration(color: Color1, boxShadow: [
                      BoxShadow(
                        color: Color1,
                        blurRadius: 2,
                        // offset: Offset(1,1),
                      )
                    ]),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Width * .02, right: Width * .02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Semester,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Color1),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    '$Year',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Color1),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Width * .02, right: Width * .02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 2,
                    height: 100,
                    decoration: BoxDecoration(color: Color1, boxShadow: [
                      BoxShadow(
                        color: Color1,
                        blurRadius: 2,
                        // offset: Offset(1,1),
                      )
                    ]),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    SubjectName,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        color: Color1),
                    textDirection: TextDirection.rtl,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Text(
                              'نظري',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Color1),
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              "$TheoreticalMark",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Color1),
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          children: [
                            Text(
                              'عملي',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Color1),
                              textDirection: TextDirection.rtl,
                            ),
                            Text(
                              "$PracticalMark",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  color: Color1),
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Text(
                              "$TotalMark",
                              style: TextStyle(
                                  fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                                  color: Color1),
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),

          ],
        ),
      ),
    );
  }
}
