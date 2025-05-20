import 'dart:convert';
import 'package:citybookstore/core/services/api_service.dart';
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

  checkoutOrder({required int studentId}){
    ApiService.postOrder(cartBookList, studentId);
  }



}