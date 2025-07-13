import 'package:e_wallet/Screen/Home/home_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class BottomNavController extends GetxController {

  RxInt currentIndex = RxInt(0);

  List<Widget> screen = [
    HomeScreen(),
    Center(
      child: Text("Contact"),
    ),
    Center(
      child: Text("Wallets"),
    ),
    Center(
      child: Text("Settings"),
    )
  ];

  changeIndex (int index) {
    currentIndex.value = index;
    update();
  }


}