import 'package:citybookstore/core/constants/colors.dart';
import 'package:citybookstore/core/widgets/wish_list_card.dart';
import 'package:citybookstore/features/wishlist/wishlist_controller.dart';
import 'package:citybookstore/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/url.dart';

class WishListPage extends StatelessWidget {
  WishListPage({super.key});
  final wishListController = Get.find<WishListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          AppUrls.logo,
          width: 70,
          color: Colors.white,
        ),
        title: Text(
          "Wishlist",
          style: TextStyle(
              color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 7, left: 7, right: 2, bottom: 5),
            child: Text(
              "All Wishlist Books",
              style: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                itemCount: wishListController.wishListBook.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 300),
                itemBuilder: (context, index) {
                  Books B = wishListController.wishListBook[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WishListCardWidget(B: B, index: index),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
