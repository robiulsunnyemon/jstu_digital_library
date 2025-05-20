import 'package:get/get.dart';


class CustomBooksModel {
  RxInt counter;
  int id;
  int fee;
  String writer;
  String available;
  RxInt counterPrice;
  String name;
  String description;
  String cover;

  CustomBooksModel({
    required int counter,
    required this.id,
    required this.writer,
    required this.available,
    required this.description,
    required this.fee,
    required int counterPrice,
    required this.name,
    required this.cover,
  })  : counter = counter.obs,
        counterPrice = counterPrice.obs;

  // Equality check
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomBooksModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;



  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "counter": counter.value,
      "writer": writer,
      "available": available,
      "description": description,
      "fee": fee,
      "counterPrice": counterPrice.value,
      "name": name,
    };
  }


}
