
import 'package:citybookstore/features/book_details/product_details_controller.dart';
import 'package:citybookstore/features/cart/cart_controller.dart';
import 'package:citybookstore/features/order/order_controller.dart';
import 'package:citybookstore/features/wishlist/wishlist_controller.dart';
import 'package:citybookstore/routes/routes.dart';
import 'package:citybookstore/routes/routes_name.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/theme/theme.dart';
import 'core/theme/theme_controller.dart';
import 'core/utils/utils.dart';
import 'features/home/product_controller.dart';

void main() {
  Get.put(BookController());
  Get.put(SearchController());
  Get.put(ThemeController());
  Get.put(ProductDetailsController());
  Get.put(WishListController());
  Get.put(CartController());
  Get.put(OrderController());
  runApp(
  //   DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(),
  // ),
     MyApp()
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Obx(()=>GetMaterialApp(
          title: appName,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeController.theme,
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.bottomNavigationBar,
          onGenerateRoute: Routes.generateRoute,
          theme: AppTheme.lightTheme,
        ));
      },
    );
  }
}
