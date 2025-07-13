import 'package:e_wallet/Global_Widgets/custom_button.dart';
import 'package:e_wallet/Screen/Auth/Bottom_Nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),

              Text(
                "Success",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),


              Text(
                "\$52,360.00 USD",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 30,
                ),
              ),

              Text(
                "has been sent to friend@gmail.com from your wallet",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(.5)
                ),
              ),

              SizedBox(
                height: 30,
              ),

              CustomButton(
                title: "Done",
                onTap: (){
                  Get.to( () => BottomNav());
                },
              )

            ]
          ),
        ),
      ),


    );
  }
}