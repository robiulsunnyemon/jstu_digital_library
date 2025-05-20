import 'package:citybookstore/core/constants/url.dart';
import 'package:citybookstore/features/book_details/product_details_controller.dart';
import 'package:citybookstore/models/custom_book_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_snackbar.dart';
import '../../models/book_model.dart';
import '../home/product_controller.dart';

class ProductDetailPage extends StatelessWidget {
  final CustomBooksModel B;
  final int index;
  ProductDetailPage({super.key, required this.B, required this.index});
  final controller = Get.find<ProductDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.disposeCounter();
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.whiteColor,
                size: 20,
              ),
            ),
            SizedBox(
              width: 1,
            ),
            Text(
              "Details",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                color: AppColors.whiteColor
              ),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 15,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(image[index],width: 200,height: 200,),
                  SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(B.name),
                        Text("${B.fee}BDT"),
                        Text("Writer: ${B.writer}"),
                        Text("Available: ${B.available.toString()}"),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.decrementCounter();
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
                            Obx(()=>Text(controller.counter.value.toString())),
                            SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: () {
                                controller.incrementCounter();
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
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Descriptions: \n${B.description}",style:TextStyle(
                    fontSize: 12
                ),),
              ),
            ],
          ),

          //checkout section

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: .2),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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

                     Obx(()=> Text(
                       "${B.fee*controller.counter.value}",
                       style: TextStyle(
                           fontSize: 20, fontWeight: FontWeight.bold),
                       textAlign: TextAlign.right,
                     ),)

                    ],
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    text: "Checkout",
                    onTap: () {
                      customSnackBar(title: "successfully checkout Complete");
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
