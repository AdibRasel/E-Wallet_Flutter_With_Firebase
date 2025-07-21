import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/Global_Widgets/custom_home_item.dart';
import 'package:e_wallet/Global_Widgets/custom_list_tile.dart';
import 'package:e_wallet/Screen/Activity/activity_screen.dart';
import 'package:e_wallet/Screen/Send_Money/receiver_screen.dart';
import 'package:e_wallet/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final user = FirebaseAuth.instance.currentUser;

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
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .doc(user!.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData && snapshot.data!.exists) {
                    
                    final data = snapshot.data!.data();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Logo & Profie
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "Assets/Images/PayPalPLogo.png",
                              width: 50,
                            ),

                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.white.withOpacity(.1),
                                  width: 4,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://i.pinimg.com/736x/89/90/48/899048ab0cc455154006fdb9676964b3.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Name
                        Text(
                          "Hello, ${data!["full_name"]}",
                          style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 18,
                          ),
                        ),

                        // Ballance
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${data["balance"]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Your Ballance",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  
                  } else {
                    return Text(
                      "No Data Found",
                      style: TextStyle(color: Colors.white),
                    );
                  }
                },
              ),
            ),
          ),

          // Main Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Home Item Button
                    Row(
                      children: [
                        CustomHomeItem(
                          onTap: () {
                            Get.to(() => ReceiverScreen());
                          },
                          icon: Icons.send,
                          title: "Send\nMoney",
                        ),
                        SizedBox(width: 20),
                        CustomHomeItem(
                          onTap: () async {
                            // final token = await FirebaseMessaging.instance.getToken();

                            // print(token);
                          },
                          icon: Icons.send_and_archive,
                          title: "Add\nMoney",
                          backgroundColor: Colors.white,
                          itemColors: AppColors.primary,
                        ),
                      ],
                    ),

                    // Activities
                    SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Activity"),
                        InkWell(
                          onTap: () {
                            Get.to(() => ActivityScreen());
                          },
                          child: Text("See All"),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),


                    // Activities List
                    StreamBuilder(
                      stream: FirebaseFirestore.instance.collection("history").snapshots(), 
                      builder: (context, snapshot){
                        
                        
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }


                            // You must return something in every condition
                        if (snapshot.hasError) {
                          return Center(child: Text('Something went wrong'));
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('No history found.'));
                        }



                        
                        else{
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            primary: false,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index){
                            final data = snapshot.data!.docs[index];

                              bool  isMe = data["sender_email"] == user.email;
                              bool ifReceiver = data["reciver_email"] == user.email;

                              DateTime trxTime = (data["time"] as Timestamp).toDate();

                              final formatedTime = DateFormat.MMMMEEEEd().format(trxTime);

                              final formatedTimeanother = DateFormat.jm().format(trxTime);



                              return isMe || ifReceiver ?  CustomListTile(
                                
                                title: data["sender"], 
                                subtitle: "${formatedTime.toString()} - ${formatedTimeanother.toString()}",
                                trailing: isMe ? "-${data["amount"].toString()}"  : "+${data["amount"].toString()}" ,

                              ) : const SizedBox(
                                
                              );
                            },
                          );
                        }
                      }
                    )


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
