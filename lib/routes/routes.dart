

import 'package:citybookstore/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/auth/presentations/login_page.dart';
import '../features/auth/presentations/onboarding_page.dart';
import '../features/auth/presentations/registration_page.dart';
import '../features/auth/presentations/splash_page.dart';
import '../features/bottom_nav/bottom_navigation_bar.dart';
import '../features/cart/cart_book_page.dart';
import '../features/home/home_page.dart';
import '../features/order/order_history_page.dart';
import '../features/profile/user_page.dart';
import '../features/search/search_page.dart';
import '../features/wishlist/wish_list_product_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case RoutesName.onboardingPage:
        return MaterialPageRoute(builder: (BuildContext context) => const OnboardingPage());

      case RoutesName.loginPage:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginPage());

      case RoutesName.registerPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  RegisterPage());

      case RoutesName.homePage:
        return MaterialPageRoute(builder: (BuildContext context) =>  HomePage());

      case RoutesName.splashPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  SplashPage());

      // case RoutesName.favouritePage:
      //   return MaterialPageRoute(builder: (BuildContext context) =>  FavouriteProductPage());

      case RoutesName.cartPage:
        return MaterialPageRoute(builder: (BuildContext context) =>  CartBookPage());

      case RoutesName.productOrderHistory:
        return MaterialPageRoute(builder: (BuildContext context) =>  OrderHistoryPage());

      case RoutesName.bottomNavigationBar:
        return MaterialPageRoute(builder: (BuildContext context) =>  BottomNavigationBarPage());

      case RoutesName.userProfileView:
        return MaterialPageRoute(builder: (BuildContext context) =>  UserProfileScreen());

      case RoutesName.searchView:
        return MaterialPageRoute(builder: (BuildContext context) =>  SearchScreen());




      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}