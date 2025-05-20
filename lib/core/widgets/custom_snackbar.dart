import 'package:citybookstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackBar({required String title}){
  Get.snackbar(
    "WOW",
    title,
    snackPosition: SnackPosition.TOP,
    backgroundColor: AppColors.primaryColor.withValues(alpha: .2),
    colorText: AppColors.black87Color,
    duration: Duration(seconds: 2),
  );

}



void customSnackBarBottom({required String title}){
  Get.snackbar(
    "WOW",
    title,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColors.primaryColor.withValues(alpha: .2),
    colorText: AppColors.black87Color,
    duration: Duration(seconds: 2),

  );

}