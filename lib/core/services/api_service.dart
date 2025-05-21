import 'dart:convert';
import 'package:citybookstore/core/services/shered_preference_services.dart';
import 'package:citybookstore/models/custom_book_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../../models/book_model.dart';

class ApiService {
  static const String bUrl = 'http://192.168.248.26:8000/api';


  static Future getBook() async {
    final response = await http.get(Uri.parse("$bUrl/books"));
    final data = json.decode(response.body);
    if (data is List) {
      return data.map((item) => Books.fromJson(item)).toList();
    } else {
      throw Exception("Expected a list but got: ${data.runtimeType}");
    }
  }

  static Future getPopularBook() async {
    final response = await http.get(Uri.parse("$bUrl/popular_books/"));
    final data = json.decode(response.body);
    if (data is List) {
      return data.map((item) => Books.fromJson(item)).toList();
    } else {
      throw Exception("Expected a list but got: ${data.runtimeType}");
    }
  }

  //order

  static Future<void> postOrder(RxList<CustomBooksModel> cartBookList, int studentId) async {
    final url = Uri.parse("$bUrl/orders/");

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


  //registration

 static Future<bool> registrationUser(Map<dynamic,dynamic> body)async{
    final url=Uri.parse("$bUrl/register/");
   final response = await http.post(
     url,
     headers: {
       "Content-Type": "application/json",
     },
     body: jsonEncode(body),
   );
   if(response.statusCode==201){
     saveUserEmail(userEmail: body["email"]);
     return true;
   }else{
     return false;
   }
 }


  static Future<bool> loginUser(Map<dynamic,dynamic> body)async{
    final url=Uri.parse("$bUrl/login/");
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    if(response.statusCode==200){
      var decodedResponse=jsonDecode(response.body);
      var token=decodedResponse["token"];
      saveUserInformation(userName: body['username'],token:token,);
      return true;
    }else{
      return false;
    }
  }

}
