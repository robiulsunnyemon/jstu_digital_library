import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomTextButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            foregroundColor: AppColors.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 1,vertical: 1),
        ),
        child: Text(text)
    );
  }
}
