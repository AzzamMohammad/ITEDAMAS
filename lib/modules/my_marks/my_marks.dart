import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:university_app/components/app_bar.dart';
import 'package:university_app/components/line_devider.dart';
import 'package:university_app/components/my_dropdown_with_function.dart';
import 'package:university_app/modules/my_marks/my_marks_controoler.dart';
import '../../components/mark_card.dart';
import '../../components/my_dropdown_with_function_with_hint.dart';
import '../../constant.dart';
import '../../models/subject.dart';

class MyMarks extends StatelessWidget {

  List<String> FilteringType=[
    'كل المواد',
    'المادة',
    'الحالة',
    'السنة',
    'ترتيب العلامة',
  ];

  List<String> StatusList = [
    'مواد مرفعة',
    'مواد محمولة',
  ];

  List<String> SortingSubjectType = [
    'أعلى إلى أدنى',
    'أدنى إلى أعلى',
  ];

  List<String> EmptyList = [];


  var FinalSubject = [].obs;
  var selectedFilteringType = ''.obs;
  var selectedSubjectName = ''.obs;
  var selectedStatusName = ''.obs;
  var selectedSubjectsYear = ''.obs;
  var selectedSortingType = ''.obs;
  var selectedAllMarks = ''.obs;

  MyMarksController controller = Get.find();
  int StateChoose = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar('علاماتي', MediaQuery.of(context).size.width * .25, true),
      body: SafeArea(
          child: Obx(() {
        if (controller.IsEndLoading == true) {
          if (controller.Subjects.length != 0)
            return Column(
              children: [
                SizedBox(height: 10,),
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    MyDropdownListWithFunction(selectedValue: selectedFilteringType, items: FilteringType, function:(){
                      if(selectedFilteringType == 'كل المواد'){
                        controller.DisplayList.clear();
                        for(Datum d in controller.Subjects){
                          controller.DisplayList.add(d);
                        }
                      }
                    }),
                    Obx((){
                      if(selectedFilteringType == 'كل المواد'){
                         return Container(
                          width: MediaQuery.of(context).size.width * .4,
                        );
                      }

                      if(selectedFilteringType == 'المادة'){
                        return MyDropdownListWithFunctionWithHint(selectedValue: selectedSubjectName, items: controller.SubjectName , HintText: 'اختر المادة', function:(){
                          controller.DisplayList.clear();
                          for(Datum d in controller.Subjects) {
                            print(d.name);
                            if (d.name == selectedSubjectName.value) {
                              controller.DisplayList.clear();
                              controller.DisplayList.add(d);
                              break;
                            }
                          }
                        });

                      }

                      if(selectedFilteringType == 'الحالة'){
                        // return MyDropdownList(selectedValue: selectedStatusName,items: StatusList,);
                        return MyDropdownListWithFunctionWithHint(selectedValue: selectedStatusName,HintText: 'اختر الحالة', items: StatusList, function:(){
                          controller.DisplayList.clear();
                          if(selectedStatusName.value == 'مواد مرفعة')
                          {
                            for(Datum d in controller.SuccessSubject){
                              controller.DisplayList.add(d);
                            }
                          }
                          else if(selectedStatusName.value == 'مواد محمولة')
                            {
                              for(Datum d in controller.FailSubject){
                                controller.DisplayList.add(d);
                              }
                            }
                        });


                      }

                      if(selectedFilteringType == 'السنة'){
                        // return MyDropdownList(selectedValue: selectedSubjectsYear,items: controller.SubjectsYears,);
                        return MyDropdownListWithFunctionWithHint(selectedValue: selectedSubjectsYear,HintText: 'اختر السنة', items: controller.SubjectsYears, function:(){
                          controller.DisplayList.clear();
                          for(Datum d in controller.Subjects){
                            if(selectedSubjectsYear.value == d.year.toString()){
                              controller.DisplayList.add(d);
                            }
                          }
                        });


                      }
                      if(selectedFilteringType == 'ترتيب العلامة'){
                        // return MyDropdownList(selectedValue: selectedSortingType,items: SortingSubjectType,);
                        return MyDropdownListWithFunctionWithHint(selectedValue: selectedSortingType,HintText: 'اختر نمط الترتيب', items: SortingSubjectType, function:(){
                          controller.DisplayList.clear();
                          for(Datum d in controller.Subjects){
                            controller.DisplayList.add(d);
                          }
                          if(selectedSortingType.value == 'أعلى إلى أدنى')
                            controller.DisplayList.sort((a,b)=>b.totalMark.compareTo(a.totalMark));
                          else
                            controller.DisplayList.sort((a,b)=>a.totalMark.compareTo(b.totalMark));
                        });

                      }

                      return Container();
                    }),

                  ],
                ),
                SizedBox(height: 10,),
                LineDev(lineLength: MediaQuery.of(context).size.width * .9,lineColor: Color1,lineThickness: 2,),
                SizedBox(
                  height: 20,
                ),
                Obx((){
                  return Expanded(
                      child: Scrollbar(
                        isAlwaysShown: true,
                        showTrackOnHover: true,
                        thickness: 7,
                        radius: Radius.circular(15),
                        scrollbarOrientation: ScrollbarOrientation.left,
                        child: ListView.builder(
                            itemCount: controller.DisplayList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: MarkCard(
                                  SubjectName: controller.DisplayList[index].name,
                                  //"خوارزميات بحث ذكية"
                                  TheoreticalMark:
                                  controller.DisplayList[index].theoreticalMark,
                                  PracticalMark:
                                  controller.DisplayList[index].practicalMark,
                                  Year: controller.DisplayList[index].year,
                                  MyStatus: controller.DisplayList[index].status,
                                  MySemester: controller.DisplayList[index].semester,
                                  TotalMark: controller.DisplayList[index].totalMark,
                                ),
                              );
                            }),
                      )
                  );
                }),
              ],
            );
          else
            return Center(
              child: Text("لا يوجد بيانات لعرضها",style: TextStyle(fontSize: 20 , color: Color1),),
            );
        } else {
          return Container();
        }
      }
      ),

      ),

    );
  }
}
