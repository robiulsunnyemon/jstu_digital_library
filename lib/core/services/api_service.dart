import 'dart:convert';
import 'package:citybookstore/models/custom_book_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../../models/book_model.dart';

class ApiService {
  static const String baseUrl = 'https://potterapi-fedeperin.vercel.app/en/books/';
  static const String bUrl = 'http://192.168.248.26:8000/api/books/';
  static const String searchUrl = 'https://potterapi-fedeperin.vercel.app/es/characters?search';


  static Future getBook() async {
    final response = await http.get(Uri.parse("http://192.168.248.26:8000/api/books"));
    final data = json.decode(response.body);
    if (data is List) {
      return data.map((item) => Books.fromJson(item)).toList();
    } else {
      throw Exception("Expected a list but got: ${data.runtimeType}");
    }
  }



  //order

  static Future<void> postOrder(RxList<CustomBooksModel> cartBookList, int studentId) async {
    final url = Uri.parse("http://192.168.248.26:8000/api/orders/");

    final booksJson = cartBookList.map((book) => book.toJson()).toList();

    print("🛒 cartBookList length: ${cartBookList.length}");
    print("👉 Books JSON: $booksJson");

    final body = {
      "student_id": studentId,
      "books": booksJson,
    };

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      print("✅ Order posted.");
    } else {
      print("❌ Failed: ${response.statusCode} - ${response.body}");
    }
  }






}
