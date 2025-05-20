import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  var counter=1.obs;

  void incrementCounter(){
    counter.value++;
    update();
  }

  void decrementCounter(){
    if(counter.value>1){
      counter.value--;
      update();
    }
  }


  void disposeCounter(){
    counter.value=1;
    update();
  }

}