import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:e_wallet/Global_Widgets/custom_button.dart';
import 'package:e_wallet/Global_Widgets/custom_field.dart';
import 'package:e_wallet/Screen/Send_Money/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmoountScreen extends StatelessWidget {
  const AmoountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: customAppBar(
        title: "Send Money"
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [


            Column(
              children: [
            
                // Reciver Details 
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: Colors.green.withOpacity(.2),
                  ),
                  title: Text(
                    "To:",
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5)
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Md Shirajul Islam",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(.8)
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "rasal.hossain.com@gmail.com",
                        style: TextStyle(
                          color: Colors.black.withOpacity(.5)
                        ),
                      ),
                    ],
                  ),
                ),
            
            
                SizedBox(height: 30,),
            
            
                // Amount Filed
                CustomField(
                  title: "Enter Amount" ,
                  preffixIcon: Icons.attach_money_outlined,
                  keyboardType: TextInputType.phone
                ),
            
            
              ],
            ),


            Column(
              children: [
                CustomButton(
                  title: "Send",
                  onTap: (){
                    Get.offAll( () => SuccessScreen());
                  },
                ),
                SizedBox(
                  height: 10,
                )
              ],
            )
          
          
          
          ],
        ),
      ),


    );
  }
}