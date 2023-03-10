import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';

AppBar MyAppBar(String Title, double Width, bool AddGoBackButton) {
  return AppBar(
    automaticallyImplyLeading: AddGoBackButton,
    backgroundColor: Color1,
    title: Text(Title),
    actions: [
      Padding(
        padding: const EdgeInsets.all(13),
        child: Container(
            width: Width,
            decoration: BoxDecoration(
              color: Color1,
              boxShadow: [
                BoxShadow(
                  color: Color2,
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text(
                  "${notificationAndAccount.Account.value}" ,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              Text(
              "SP",
              style: TextStyle(fontSize: 20, color: Colors.white),
              )
              ]
              ,
              );
            })
        ),
      ),
    ],
  );
}
