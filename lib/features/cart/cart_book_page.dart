import 'package:citybookstore/core/constants/colors.dart';
import 'package:citybookstore/core/constants/url.dart';
import 'package:citybookstore/features/cart/cart_controller.dart';
import 'package:citybookstore/features/order/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_snackbar.dart';
import '../../routes/routes_name.dart';
import '../home/product_controller.dart';

class CartBookPage extends StatefulWidget {
  const CartBookPage({
    super.key,
  });

  @override
  CartBookState createState() => CartBookState();
}

class CartBookState extends State<CartBookPage> {
  final cartController = Get.find<CartController>();
  final orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
            )),
        actions: [
          Obx(() => Stack(
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
                          color: AppColors.whiteColor.withValues(alpha: .8),
                          border: Border.all(color: AppColors.primaryColor)),
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
          SizedBox(
            width: 10,
          ),
        ],
        automaticallyImplyLeading: false,
        title: Text(
          "Cart Books",
          style: TextStyle(
              color: AppColors.whiteColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (CartController.cartBookList.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset("assets/img/itemCart.json",
                        width: 200, height: 200),
                  ],
                ),
                Text(
                  "No Cart Book Available",
                ),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 7, left: 10, right: 2, bottom: 5),
                  child: Text(
                    "All Cart Books",
                    style: TextStyle(
                        color: AppColors.grayColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: CartController.cartBookList.length,
                    itemBuilder: (context, index) {
                      var item = CartController.cartBookList[index];
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: Card(
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 290,
                                  height: 100,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0).w,
                                        child: Image.asset(image[2],
                                            width: 60,
                                            height: 80,
                                            fit: BoxFit.cover),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 8, bottom: 8, right: 8),
                                        child: SizedBox(
                                          width: 180,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: AppColors.grayColor,
                                                    fontWeight: FontWeight.bold,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              Obx(
                                                () => Text(
                                                  "${CartController.cartBookList[index].counterPrice.value}",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                      color:
                                                          AppColors.grayColor),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        cartController
                                                            .decrementCounterBook(
                                                                index: index);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 2),
                                                          child: Icon(
                                                            Icons.remove,
                                                            size: 20,
                                                            color: AppColors
                                                                .whiteColor,
                                                            weight: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    Obx(
                                                      () => Text(
                                                        "${CartController.cartBookList[index].counter.value}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                            color: AppColors
                                                                .grayColor),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        cartController
                                                            .incrementCounterBook(
                                                                index: index);
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 2),
                                                          child: Icon(
                                                            Icons.add,
                                                            size: 20,
                                                            weight: 20,
                                                            color: AppColors
                                                                .whiteColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //delete section
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  child: InkWell(
                                    onTap: () {
                                      cartController.deleteCartBook(B: item);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: AppColors.primaryColor,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //checkout section
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: .2),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(() {
                            return Text(
                              "\$${cartController.totalCounterPrice}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                            );
                          }),
                        ],
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        text: "Checkout",
                        onTap: () {
                          customSnackBarBottom(
                            title: "successfully checkout Complete",
                          );
                          cartController.checkoutOrder(studentId: 21);
                        },
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
