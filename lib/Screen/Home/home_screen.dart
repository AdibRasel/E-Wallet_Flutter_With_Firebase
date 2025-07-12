import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:e_wallet/Global_Widgets/custom_home_item.dart';
import 'package:e_wallet/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
    //  appBar: customAppBar(
    //     title: "Home",
    //     hideLeading: true,
    //   ),

    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Header top
        Container(
          height: size.height * .30,
          width: size.width,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40)
            ) 
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Logo & Profie
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Image.asset("Assets/Images/PayPalPLogo.png", width: 50,),

                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white.withOpacity(.1),
                          width: 4
                        ),
                        image: DecorationImage(image: NetworkImage("https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",),fit: BoxFit.cover)
                      ),
                    )

                  ],

                ),
              
                // Name
                Text(
                  "Hello, Rasal",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontSize: 18
                  ),
                ),

                // Ballance
                Column(
                  children: [
                     Text(
                      "\$54,690.00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Your Ballance",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                      ),
                    ),
                  ],
                )
              
              ],
            ),
          ),
        ),

        // Main Section
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              // Home Item Button
              Row(
                children: [

                

                  CustomHomeItem(
                    onTap: (){

                    },
                    icon: Icons.send, 
                    title: "Send\nMoney",
                  ),
                  SizedBox(width: 20,),
                  CustomHomeItem(
                    onTap: (){

                    },
                    icon: Icons.send_and_archive, 
                    title: "Add\nMoney",
                    backgroundColor: Colors.white,
                    itemColors: AppColors.primary,
                  ),
                
                
                ],
             ),


              // Activities
              SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Activity"),
                  Text("See All"),
                ],
              ),


              
            ],
          ),
        ),


       


      ],
    ),
  


    );
  }
}