import 'package:get/get.dart';
import '../../features/home/product_controller.dart';

class BookBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookController());
  }
}
