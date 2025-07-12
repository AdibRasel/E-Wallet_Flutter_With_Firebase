import 'package:flutter/material.dart';
import 'package:get/get.dart';


PreferredSizeWidget customAppBar ({
  String? title,
  List<Widget>? action,
  bool hideLeading = false,
}){
  return  
    AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
        leading: hideLeading
        ? const SizedBox()
        : IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
      centerTitle: true,
      title: title != null ? Text(title, style: TextStyle(color: Colors.black),): null,
      actions: action,
    );
}