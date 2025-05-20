

import 'package:citybookstore/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import '../../../core/constants/colors.dart';
import '../../../core/constants/url.dart';
import '../../../core/utils/utils.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Delay 3 seconds and then navigate
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.onboardingPage,(route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo or Lottie animation
            Image.asset(
              AppUrls.logo,
              height: 120,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 20),
            Text(
              appName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
