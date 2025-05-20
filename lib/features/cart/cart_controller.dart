import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:citybookstore/models/book_model.dart';
import 'package:citybookstore/models/custom_book_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  static final cartBookList=<CustomBooksModel>[].obs;
  var totalCounterPrice=1.obs;

  addCartBook({required CustomBooksModel B}){
    if(cartBookList.contains(B)){
      return;
    }else{
      cartBookList.add(B);
      update();
    }

  }

  deleteCartBook({required CustomBooksModel B}){
    if(cartBookList.contains(B)){
      cartBookList.remove(B);
    }else{
      return;
    }
    update();
    countTotalPrice();

  }

  incrementCounterBook({required int index}){
    cartBookList[index].counter.value++;
    cartBookList[index].counterPrice.value=cartBookList[index].fee*cartBookList[index].counter.value;
    countTotalPrice();
    update();
  }

  decrementCounterBook({required int index}){
    if(cartBookList[index].counter.value>1){
      cartBookList[index].counter.value--;
      cartBookList[index].counterPrice.value=cartBookList[index].fee*cartBookList[index].counter.value;
      countTotalPrice();
      update();
    }
  }


  countTotalPrice(){
     totalCounterPrice.value = cartBookList.fold(0, (sum, book) => sum + book.counterPrice.value);
     update();
  }



  //order



  static Future<void> orderRequest() async {
    final url = Uri.parse("http://your-api-url.com/api/orders/"); // 🛠️ এই URL ঠিক করো

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "customer_name": "Guest", // চাইলে ইউজারের নাম পাঠাতে পারো
      "items": cartBookList.map((book) => book.toJson()).toList(),
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        print("✅ Order Successful!");
        Get.snackbar("Order", "Order placed successfully");
        cartBookList.clear(); // cart খালি করা
      } else {
        print("❌ Order Failed: ${response.body}");
        Get.snackbar("Order Failed", "Something went wrong");
      }
    } catch (e) {
      print("🔥 Exception: $e");
      Get.snackbar("Error", "Unable to send order");
    }
  }



}