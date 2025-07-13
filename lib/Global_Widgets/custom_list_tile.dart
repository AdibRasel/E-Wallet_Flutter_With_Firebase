import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? trailing;
  
  const CustomListTile({
    super.key, 
    required this.title, 
    required this.subtitle, 
    this.trailing
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(.5),
          child: Text(
            title[0],
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.black.withOpacity(.5),
          ),
        ),
        trailing: trailing != null ? Text(
          trailing!,
          style: TextStyle(
            color: Colors.green
          ),
        ) : SizedBox(),
      ),
    );
  }
}