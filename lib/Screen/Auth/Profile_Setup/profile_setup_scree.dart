import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/GetX_Controller/profile_setup_controller.dart';
import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:e_wallet/Global_Widgets/custom_button.dart';
import 'package:e_wallet/Global_Widgets/custom_field.dart';
import 'package:e_wallet/Screen/Auth/Bottom_Nav/bottom_nav.dart';
// import 'package:e_wallet/Screen/Home/home_screen.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetupScree extends StatelessWidget {
  ProfileSetupScree({super.key});


  final controller = Get.put(ProfileSetupController());

  final email = Get.arguments;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: customAppBar(
        title: "Complete Setup",
        hideLeading: true,
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(20),
      
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      // GetBuilder hocce gext er stat management
                      GetBuilder<ProfileSetupController>(builder: (_){
                        return 
                          Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            controller.pickedImage == null ? 
                            CircleAvatar(
                              radius: 60, 
                              backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/8847/8847419.png")
                            )
                            :
                            CircleAvatar(
                              radius: 60, 
                              backgroundImage: FileImage(controller.pickedImage!)
                            )
                            ,
                            InkWell(
                        
                              // onTap: () => controller.imagePicker(),
                        
                              onTap: (){
                                Get.bottomSheet(
                                  SizedBox(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                      
                                          InkWell(
                                            onTap: () => {
                                              controller.imagePicker(false) // camera
                                            },
                                            child: Column(
                                              children: [
                                              Icon(Icons.camera_alt_outlined, size: 100, color: Colors.blue,),
                                              Text("Camera"),
                                              ],
                                            ),
                                          ),
                                          
                                      
                                          InkWell(
                                            onTap: () => {
                                              controller.imagePicker(true) // gallery
                                            },
                                            child: Column(
                                              children: [
                                                 Icon(Icons.photo, size: 100, color: Colors.blue,),
                                                  Text("Gallery"),
                                              ],
                                            ),
                                          ),
                                         
                                      
                                      
                                        ],
                                      ),
                                    ),
                                  ),
                                  enableDrag: false,
                                  backgroundColor: Colors.white
                                );
                              },
                        
                        
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2
                                  )
                                ),
                                child: Icon(Icons.edit, color: Colors.white, size: 20,),
                              ),
                            )
                          ],
                        );
                      }),
                        
                        
                        
                      SizedBox(height: 30,),
                      CustomField(
                        title: "Your Name",
                        controller: controller.nameController,
                      ),
                  
                  
                      SizedBox(height: 30,),
                      CustomField(
                        title: "Your Phone Number",
                        controller: controller.phonController,
                      ),
                  
                      SizedBox(height: 30,),
                      CustomField(
                        title: "Your NID Number",
                        controller: controller.nidController,
                      ),
                  
                    ],
                  ),
                ),
              ),
      
      
              CustomButton(
                title: "Complete Setup", 
                onTap: () async {
               
                  // final token = await FirebaseMessaging.instance.getToken();

                  // Firestore ডাটাবেজের instance থেকে "users" নামের collection ধরছি
                  await FirebaseFirestore.instance.collection("users")
                    // এখানে প্রতিটি user এর জন্য একটি unique document তৈরি করছি, যেটার ID হবে email
                    .doc(email)
                    // এই document-এ ডেটা সেট করছি, আপাতত ফাঁকা রাখা হয়েছে
                    .set({
                      "email": email,
                      "full_name": controller.nameController.text,
                      "phone": controller.phonController.text,
                      "nid": controller.nidController.text,
                      "balance": 0,
                      "token": "token"
                    }).then((value) {
                      Get.offAll(() => BottomNav());
                    });
                },
              )
            ],
          ),
        ),
      
      
        
        
      )



    );
  }
}