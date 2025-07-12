import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {

  // title ta CustomField(title:"hello tittle"), ei babe call korte hobe
  final String title;
  final bool? secured;
  // final TextEditingController controller;
  const CustomField({super.key, required this.title, this.secured,}); // argument akare data nite hole ekhane this.title dite hobe. 

  @override
  Widget build(BuildContext context) {
    return 
    TextFormField(
      obscureText: secured ?? false,
      // controller: controller,
      decoration: InputDecoration(
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