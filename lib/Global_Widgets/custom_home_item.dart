import 'package:e_wallet/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomHomeItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? backgroundColor;
  final Color? itemColors;
  final void Function()? onTap;

  const CustomHomeItem({
    super.key, 
    required this.icon, 
    required this.title, 
    this.backgroundColor, 
    this.itemColors,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return 
      InkWell(
        onTap: onTap,
        child: Container(
          height: 130,
          width: size.width * .35,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.primary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: 
            [BoxShadow
              (
                color: Colors.black.withOpacity(.020),
                blurRadius: 8,
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon, 
                color: itemColors ?? Colors.white,
              ),
              Text(
                title,
                style: TextStyle(
                  color: itemColors ?? Colors.white
                ),
              )
            ],
          ),
        ),
      )
    ;
  }
}