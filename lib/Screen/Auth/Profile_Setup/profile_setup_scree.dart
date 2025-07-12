import 'package:e_wallet/GetX_Controller/profile_setup_controller.dart';
import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:e_wallet/Global_Widgets/custom_button.dart';
import 'package:e_wallet/Global_Widgets/custom_field.dart';
import 'package:e_wallet/Screen/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSetupScree extends StatelessWidget {
  ProfileSetupScree({super.key});


  final controller = Get.put(ProfileSetupController());


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
              Column(
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
                          onTap: () => controller.imagePicker(),


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
                  CustomField(title: "Your Full Name"),
              
              
                  SizedBox(height: 30,),
                  CustomField(title: "Your Phone Number"),
              
                  SizedBox(height: 30,),
                  CustomField(title: "Your NID Number"),
              
                ],
              ),


              CustomButton(title: "Complete Setup", onTap: ()=> Get.to(() => HomeScreen()),)
            ],
          ),
        ),


        
        
      )



    );
  }
}