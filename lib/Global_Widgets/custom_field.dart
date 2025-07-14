import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {

  // title ta CustomField(title:"hello tittle"), ei babe call korte hobe
  final String title;
  final bool? secured;
  final IconData? preffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  const CustomField({super.key, required this.title, this.secured, this.preffixIcon, this.keyboardType, this.controller}); // argument akare data nite hole ekhane this.title dite hobe. 

  @override
  Widget build(BuildContext context) {
    return 
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: secured ?? false,
      // controller: controller,
      decoration: InputDecoration(
        prefixIcon: preffixIcon != null ? Icon(preffixIcon, color: Colors.black.withOpacity(.5),): null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(.3)
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color:Colors.blueAccent
          )
        ),
        hintText: title
      ),
    );
  }
}