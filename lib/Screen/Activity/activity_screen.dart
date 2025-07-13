import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:e_wallet/Global_Widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: customAppBar(
        title: "Activity"
      ),


      body: ListView.builder(
        itemCount: 30,
        padding: EdgeInsets.symmetric(
          horizontal: 15
        ),
        itemBuilder: (context, index){
          return CustomListTile(
            title: "Rasal Hossain", 
            subtitle: "2 days ago",
            trailing: "+350",
          );
        },
      ),



    );
  }
}