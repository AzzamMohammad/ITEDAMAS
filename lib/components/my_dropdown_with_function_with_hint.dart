import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../constant.dart';

class MyDropdownListWithFunctionWithHint extends StatelessWidget {
  List<String> items = [];
  var selectedValue = ''.obs;
  Function() function;
  String? Selected;
  var ReFresh = false.obs;
  String? HintText;



  MyDropdownListWithFunctionWithHint({required this.selectedValue, required this.items , required this.function , this.HintText});

  int Count = 0;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];

    for (var item in items) {
      if (Count == 0) {
        selectedValue(item);
        Count++;
      }

      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
             value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: AutoSizeText(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(thickness: 1),
            ),
        ],
      );
    }
    return _menuItems;
  }

  List<int> _getDividersIndexes() {
    List<int> _dividersIndexes = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _dividersIndexes.add(i);
      }
    }
    return _dividersIndexes;
  }

  @override
  Widget build(BuildContext context) {

    return DropdownButtonHideUnderline(

        child: Obx(() {

          return DropdownButton2(
            isExpanded: ReFresh.value,
            hint: Text(HintText ?? ''),
            // عناصر اللست وهم محتويات القائمة
          items: _addDividersAfterItems(items),
          customItemsIndexes: _getDividersIndexes(),
            // حجم الإطار حول العنصر في القائمة
          customItemsHeight: 10,
            // القيمة التي يأخذها الحقل الأساسي لقائمة وهو قيمة الخيار
           value:Selected,
          onChanged: (value) {
            // this.function();

            selectedValue(value.toString());
            ReFresh(true);
            print(selectedValue.value);
            print(Selected);
            Selected=selectedValue.value;
            this.function();
            // print(selectedValue);
          },

            // زر القائمة عندما تكون مغلقة
          icon: Icon(
            Icons.arrow_drop_down,
          ),

            // زر القائمة عندما تكون مفتوحة
          iconOnClick: Icon(
            Icons.arrow_drop_up,
          ),
          iconSize: 30,

            // تنسيق الحقل
          buttonHeight: 50,
          buttonWidth: MediaQuery.of(context).size.width * .4,
          buttonPadding: const EdgeInsets.only(left: 5, right: 5),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Color(0xffeef0fd),
          ),
          buttonElevation: 4,

            //تنسيق العنصر داخل القائمة
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 7, right: 7),
          selectedItemHighlightColor: Color4,

            // تنسيق القائمة
          dropdownWidth: MediaQuery.of(context).size.width * .4,
          dropdownPadding: const EdgeInsets.only(left: 5, right: 5),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7), bottomRight: Radius.circular(7)),
            color: Color(0xffeef0fd),
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
            // مكان القائمة عندما تفتح بالنسبة للزر
          offset: Offset(0, 5),
          iconEnabledColor: Color1,
          scrollbarAlwaysShow: true,
          scrollbarThickness: 10,
          dropdownMaxHeight: 200,
        );
    }));
  }
}
