import 'dart:async';

import 'package:e_wallet/Screen/Auth/Bottom_Nav/bottom_nav.dart';
import 'package:e_wallet/Screen/Auth/Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState(){
    super.initState();
    Timer( Duration(seconds: 3), () {

      if(user == null){
        Get.offAll( () => LoginScreen());
      }else{
        Get.offAll( () => BottomNav());
      }


    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Image.asset("Assets/Images/PayPalLogo.png", width: MediaQuery.of(context).size.width,),
        ),
      ),


    );
  }
}