import 'package:get/get.dart';

import '../../models/book_model.dart';

class WishListController extends GetxController{
  var wishListBook=<Books>[].obs;
  var wishListFlag=<int>[].obs;


 addOrRemoveWishlistItem({required Books books, required int id}){
    if (wishListFlag.contains(id)) {
      wishListBook.remove(books);
      wishListFlag.remove(id);
    } else {
      wishListBook.add(books);
      wishListFlag.add(id);
    }
  }



}