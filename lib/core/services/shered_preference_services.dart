import 'package:shared_preferences/shared_preferences.dart';


  saveUserInformation({required String userName,required String token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName);
    await prefs.setString('token', token);
  }

saveUserEmail({required String userEmail}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userEmail', userEmail);
}


  Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString('userName') ?? "null";
    return userName;
  }

  Future<String> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? "null";
    return token;
  }


Future<String> getUserEmail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String email = prefs.getString('userEmail') ?? "null";
  return email;
}