import 'package:citybookstore/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/theme/theme_controller.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});

  final Map<String, String> user = {
    'name': 'Robiul Sunny Emon',
    'email': 'robiulsunyemon@gmail.com',
    'address':'Dhaka, Bangladesh',
    'phone': '+8801234567890',
    'image': 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
  };

  final themeController = Get.find<ThemeController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            height: 700,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[AppColors.primaryColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Main content
          Positioned.fill(
            top: 250,
            child: Obx(()=>themeController.isDarkMode.value?Container(
              decoration: BoxDecoration(
                color: Color(0xff222f3e),
                border: Border.all(color: Colors.black87),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  // Name
                  Text(
                    user['name']!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Email
                  _buildInfoCard(Icons.email, user['email']!),
                  SizedBox(height: 10),

                  // Phone
                  _buildInfoCard(Icons.phone, user['phone']!),
                  SizedBox(height: 10),

                  // address
                  _buildInfoCard(Icons.location_city, user['address']!),
                  SizedBox(height: 30),

                  // Edit Profile Button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to Edit Profile
                    },
                    icon: Icon(Icons.edit,color:AppColors.whiteColor),
                    label: Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.whiteColor,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
            ):Container(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  // Name
                  Text(
                    user['name']!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Email
                  _buildInfoCard(Icons.email, user['email']!),
                  SizedBox(height: 10),

                  // Phone
                  _buildInfoCard(Icons.phone, user['phone']!),
                  SizedBox(height: 10),

                  // address
                  _buildInfoCard(Icons.location_city, user['address']!),
                  SizedBox(height: 30),

                  // Edit Profile Button
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to Edit Profile
                    },
                    icon: Icon(Icons.edit,color:AppColors.whiteColor),
                    label: Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.whiteColor,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
            ),)
          ),

          // Profile Image
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 55,
                backgroundImage: NetworkImage(user['image']!),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String value) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor),
        title: Text(value),
      ),
    );
  }
}
