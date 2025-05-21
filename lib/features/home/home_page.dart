import 'package:citybookstore/core/constants/colors.dart';
import 'package:citybookstore/core/widgets/card_widget.dart';
import 'package:citybookstore/features/cart/cart_controller.dart';
import 'package:citybookstore/features/home/product_controller.dart';
import 'package:citybookstore/models/book_model.dart';
import 'package:citybookstore/models/custom_book_model.dart';
import 'package:citybookstore/routes/routes_name.dart';
import 'package:citybookstore/features/book_details/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/constants/url.dart';
import '../../core/theme/theme_controller.dart';
import '../../core/utils/utils.dart';
import '../../core/widgets/animated_banner.dart';
import '../../core/widgets/custom_snackbar.dart';
import '../book_details/product_details_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<BookController>();
  final themeController = Get.find<ThemeController>();
  final cartController = Get.find<CartController>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          AppUrls.logo,
          width: 70,
          color: Colors.white,
        ),
        title: Text("CityBookStore"),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.cartPage);
            },
            icon: Obx(() => Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.whiteColor,
                        size: 28,
                      ),
                    ),
                    Positioned(
                      top: -4,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor.withValues(alpha: .8)),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            "${CartController.cartBookList.length}",
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                themeController.toggleTheme();
              },
              icon: Obx(
                () => themeController.isDarkMode.value == true
                    ? Icon(
                        Icons.light_mode_outlined,
                        color: AppColors.whiteColor,
                      )
                    : Icon(
                        Icons.dark_mode_outlined,
                        color: AppColors.whiteColor,
                      ),
              )),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Popular Books",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.bList.length,
                itemBuilder: (context, index) {
                  Books B = controller.bList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 180, child: CardWidget(B: B, index: index,image: popularImage,)),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                "Trending Books",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.popularBookList.length,
                itemBuilder: (context, index) {
                  Books B = controller.popularBookList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        SizedBox(width: 170, child: CardWidget(B: B, index: index,image: image,)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
