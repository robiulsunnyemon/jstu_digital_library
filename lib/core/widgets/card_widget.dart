import 'package:citybookstore/features/book_details/product_detail_page.dart';
import 'package:citybookstore/features/cart/cart_controller.dart';
import 'package:citybookstore/features/wishlist/wish_list_product_page.dart';
import 'package:citybookstore/features/wishlist/wishlist_controller.dart';
import 'package:citybookstore/models/book_model.dart';
import 'package:citybookstore/models/custom_book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../features/book_details/product_details_controller.dart';
import '../constants/colors.dart';
import '../constants/url.dart';

class CardWidget extends StatelessWidget {
  final Books B;
  final int index;
  CardWidget({super.key, required this.B, required this.index});

  final productDetailsController = Get.find<ProductDetailsController>();
  final wishListController = Get.find<WishListController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                image[index],
                height: 150,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment(-.9, 0),
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.white,
                  child: Obx(
                    () => GestureDetector(
                      onTap: () {
                        //add favourite book
                        wishListController.addOrRemoveWishlistItem(books: B,id: B.id);
                      },
                      child: wishListController.wishListFlag.contains(B.id)
                          ? Icon(
                              Icons.favorite_outlined,
                              color: AppColors.primaryColor,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: AppColors.primaryColor,
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              B.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "${B.fee} BDT",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              productDetailsController.disposeCounter();
              CustomBooksModel b = CustomBooksModel(
                  counter: B.item,
                  id: B.id,
                  writer: B.writer,
                  available: B.available.toString(),
                  description: B.description,
                  fee: B.fee.toInt(),
                  counterPrice: B.fee.toInt(),
                  name: B.name,
                  cover: image[index]);
              Get.to(() => ProductDetailPage(B: b, index: index));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              child: Text(
                B.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    for (int i = 0; i < 6; i++)
                      if (i < 3)
                        Icon(
                          Icons.star,
                          color: AppColors.primaryColor,
                          size: 14,
                        ),
                    Icon(
                      Icons.star_border,
                      color: AppColors.primaryColor,
                      size: 14,
                    )
                  ],
                ),
                InkWell(
                  onTap: () {

                    CustomBooksModel b=CustomBooksModel(
                        counter: B.item,
                        id: B.id,
                        writer: B.writer,
                        available: B.available.toString(),
                        description: B.description,
                        fee: B.fee.toInt(),
                        counterPrice: B.fee.toInt(),
                        name: B.name,
                        cover: image[B.id]
                    );
                    cartController.addCartBook(B: b);
                    cartController.countTotalPrice();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        "Order",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
