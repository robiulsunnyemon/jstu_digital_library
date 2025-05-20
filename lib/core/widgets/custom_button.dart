import 'package:citybookstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed:onTap,
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.primaryColor,
      ), child:  Padding(
      padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
      child: Text(text,style: TextStyle(fontSize: 18),),
    ),
    );
  }
}
