import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap; // Required na
  const CustomButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 15,
              vertical: 15
            ),
            child: Text(title, style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800
            ),),
          ),
        ),
      ),
    );
  }
}