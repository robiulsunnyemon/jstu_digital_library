import 'package:citybookstore/core/utils/utils.dart';
import 'package:citybookstore/models/custom_book_model.dart';
import 'package:get/get.dart';
import '../../core/services/api_service.dart';
import '../../models/book_model.dart';

class BookController extends GetxController {
  var bList = <Books>[].obs;
  var isLoading = false.obs;






  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }




  @override
  void onInit() {
    getBook();
    super.onInit();
  }


  void getBook() async {
    isLoading(true);
    bList.value=await ApiService.getBook();
    isLoading(false);
  }



}
