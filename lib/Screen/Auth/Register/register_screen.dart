import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:e_wallet/Global_Widgets/custom_button.dart';
import 'package:e_wallet/Global_Widgets/custom_field.dart';
import 'package:e_wallet/Screen/Auth/Profile_Setup/profile_setup_scree.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: customAppBar(
        hideLeading: false,
      ),


      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              // Top Image or Logo
              Image.asset(
                'Assets/Images/PayPalLogo.png', 
                width: 200,
              ),


              // Middle input and button
              Column(
                children: [

                  CustomField(title: "Email Address",),

                  SizedBox(height: 20,),

                  CustomField(title: "Password", secured: true,),

                  SizedBox(height: 20,),

                  CustomButton(title:"Sign Up", 
                    onTap: () => {
                      Get.to(() => ProfileSetupScree())
                    },),
                ],
              ),


              // bottom text button
              Column(
                children: [

                  Text("Already have an account?", style: TextStyle(
                    color: Colors.black.withOpacity(.5)
                  ),),

                  TextButton(onPressed: ()=>{Get.back()}, child: Text("Log In"))

                ],
              )

              
          
          
            ],
          ),
        ),
      ),

      
    );
  }
}