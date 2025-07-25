import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:e_wallet/Global_Widgets/custom_button.dart';
import 'package:e_wallet/Global_Widgets/custom_field.dart';
import 'package:e_wallet/Screen/Auth/Bottom_Nav/bottom_nav.dart';
import 'package:e_wallet/Screen/Auth/Register/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();


    return  Scaffold(

      appBar: customAppBar(
        hideLeading: true,
        
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

                  CustomField(
                    controller: emailController,
                    title: "Email Address",
                  ),

                  SizedBox(height: 20,),

                  CustomField(
                    controller: passwordController,
                    title: "Password", secured: true,
                  ),

                  SizedBox(height: 20,),

                  CustomButton(title:"Log In", onTap: () async {

                    try{
                      
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text, 
                        password: passwordController.text
                      );

                    // if successfully login 
                    Get.to(() => const BottomNav());


                    } on FirebaseAuthException catch(error){

                      print(error);

                    }

                    // Get.to(() => const BottomNav())

                  },),
                ],
              ),


              // bottom text button
              Column(
                children: [

                  Text("Having trouble logging in?", style: TextStyle(
                    color: Colors.black.withOpacity(.5)
                  ),),

                  TextButton(onPressed: (){Get.to(() => const RegisterScreen());}, child: Text("Sign Up"))

                ],
              )

              
          
          
            ],
          ),
        ),
      ),

      
    );
  }
}