
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppTheme {


  static final ThemeData lightTheme = ThemeData(


    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.primaryColor,


    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.whiteColor,
    ),


    textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.black87Color),
        bodyMedium: TextStyle(color: AppColors.black87Color),
        labelSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 8,
            color:
            AppColors.black87Color
        )
    ),


    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),

    cardTheme: CardTheme(
      color: Colors.white,
    ),


  );






  static final ThemeData darkTheme = ThemeData(

      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xff222f3e),
      primaryColor: AppColors.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.whiteColor),
          bodyMedium: TextStyle(color: AppColors.whiteColor),
          labelSmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 8,
              color:
              AppColors.whiteColor
          )
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: Brightness.dark,
      ),

      cardTheme: CardTheme(
        color: Color(0xff2f3640),
      )
  );
}