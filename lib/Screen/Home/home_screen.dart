import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: customAppBar(
        title: "Home",
        hideLeading: true,
      ),
  


    );
  }
}