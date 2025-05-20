import 'package:get/get.dart';

import '../../models/custom_book_model.dart';

class OrderController extends GetxController{
  var orderBooks=<CustomBooksModel>[].obs;

  addOrderBooks(List<CustomBooksModel> orderBooks){
    orderBooks.assignAll(orderBooks);
    update();
  }


}