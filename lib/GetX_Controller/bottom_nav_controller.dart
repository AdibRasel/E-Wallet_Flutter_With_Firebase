import 'package:e_wallet/Screen/Auth/Login/login_screen.dart';
import 'package:e_wallet/Screen/Home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: (){
          FirebaseAuth.instance.signOut();
          Get.offAll( ()=> LoginScreen());
        }, 
        child: Text("Log Out", style: TextStyle(color: Colors.white),),
      ),
    )
  ];

  changeIndex (int index) {
    currentIndex.value = index;
    update();
  }


}