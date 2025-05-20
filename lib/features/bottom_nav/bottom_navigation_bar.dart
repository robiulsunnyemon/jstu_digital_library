import 'package:citybookstore/features/cart/cart_book_page.dart';
import 'package:citybookstore/features/wishlist/wish_list_product_page.dart';
import 'package:citybookstore/features/home/home_page.dart';
import 'package:citybookstore/features/order/order_history_page.dart';
import 'package:citybookstore/features/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../routes/routes_name.dart';
import '../home/product_controller.dart';
import '../profile/user_page.dart';

class BottomNavigationBarPage extends StatelessWidget {
  BottomNavigationBarPage({super.key});

  final BookController controller = Get.put(BookController());

  final List<Widget> pages = [
    HomePage(),
    SearchScreen(),
    WishListPage(),
    OrderHistoryPage(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: AppColors.primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Wishlist',
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_toggle_off_rounded),
              label: 'History',
              backgroundColor: AppColors.primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
              backgroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
