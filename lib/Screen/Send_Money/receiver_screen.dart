import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:e_wallet/Global_Widgets/custom_button.dart';
import 'package:e_wallet/Global_Widgets/custom_field.dart';
import 'package:e_wallet/Screen/Send_Money/amoount_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiverScreen extends StatelessWidget {
  const ReceiverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: customAppBar(
        title: "Send Money",
      ),


      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            CustomField(
              title: "Enter REciver email address"
            ),

            Column(
              children: [
                CustomButton(
                  title: "Send",
                  onTap: (){
                    Get.to( () => AmoountScreen());
                  },
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),

            


            
          ],
        ),
      ),


    );
  }
}