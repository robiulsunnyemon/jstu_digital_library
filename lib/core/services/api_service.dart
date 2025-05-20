import 'dart:convert';
import 'package:citybookstore/models/custom_book_model.dart';
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


}
