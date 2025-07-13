import 'package:e_wallet/GetX_Controller/bottom_nav_controller.dart';
import 'package:e_wallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavController());
    return 
    Obx( () => Scaffold(
      body: controller.screen[controller.currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.black,
        currentIndex: controller.currentIndex.value,
        onTap: (index) => controller.changeIndex(index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Contacts"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallets"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ]
      )
    ));
  }
}