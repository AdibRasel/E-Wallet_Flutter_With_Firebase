import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:e_wallet/Global_Widgets/custom_button.dart';
import 'package:e_wallet/Global_Widgets/custom_field.dart';
import 'package:e_wallet/Screen/Send_Money/amoount_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceiverScreen extends StatelessWidget {
  const ReceiverScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final reciverEmailController = TextEditingController();
    final user = FirebaseAuth.instance.currentUser;

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
              title: "Enter Reciver email address",
              controller: reciverEmailController,
            ),

            Column(
              children: [
                CustomButton(
                  title: "Send",
                  onTap: ()async{
                    // Get.to( () => AmoountScreen());
                    final receiver = await FirebaseFirestore.instance.collection("users").doc(reciverEmailController.text).get();
                    
                    final sender = await FirebaseFirestore.instance.collection("users").doc(user!.email).get();


                    // print(receiver.data());
                    
                    final receiverData = receiver.data();
                    
                    
                    if(receiverData == null){
                      Get.snackbar("User not exits", "Ther user ${reciverEmailController.text} not exits");
                    }else{
                      // Get.snackbar("User exits", "Ther user is ${receiverData}");

                      if(receiverData['email'] == user.email){
                        Get.snackbar("Error", "You can't sent to yourself");
                      }else{

                        Get.to( () => AmoountScreen(reciverDetails: receiverData, senderDetails: sender.data()!));


                      }

                    }
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