import 'package:citybookstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/url.dart';
import 'search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final controller = Get.put(SearchTEController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          AppUrls.logo,
          width: 70,
          color: Colors.white,
        ),
        title: Text("Search",style: TextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.bold),),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
