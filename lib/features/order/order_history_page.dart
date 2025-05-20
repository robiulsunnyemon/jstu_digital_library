import 'package:citybookstore/core/constants/colors.dart';
import 'package:citybookstore/features/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../core/constants/url.dart';
import '../../routes/routes_name.dart';
import '../home/product_controller.dart';

class OrderHistoryPage extends StatelessWidget {
  OrderHistoryPage({super.key});

  final List<Map<String, dynamic>> orderList = [
    {
      'orderId': 'ORD12345',
      'date': '2025-05-08',
      'total': 1500.00,
      'status': 'Delivered',
    },
    {
      'orderId': 'ORD12346',
      'date': '2025-05-05',
      'total': 950.00,
      'status': 'Shipped',
    },
    {
      'orderId': 'ORD12347',
      'date': '2025-04-30',
      'total': 2000.00,
      'status': 'Cancelled',
    },
  ];

  final controller = Get.find<CartController>();

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Delivered':
        return Colors.green;
      case 'Shipped':
        return Colors.orange;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          AppUrls.logo,
          width: 70,
          color: Colors.white,
        ),
        title: Text("Order",style: TextStyle(color: AppColors.whiteColor,fontWeight: FontWeight.bold),),
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
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 16, right: 2, bottom: 10),
            child: Text(
              "Order History",
              style: TextStyle(
                  color: AppColors.grayColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                final order = orderList[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(Icons.shopping_bag),
                    title: Text("Order ID: ${order['orderId']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date: ${order['date']}"),
                        Text("Total: \$${order['total']}"),
                      ],
                    ),
                    trailing: Text(
                      order['status'],
                      style: TextStyle(
                        color: _getStatusColor(order['status']),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
