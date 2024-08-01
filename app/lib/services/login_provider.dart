import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funeral_app/utils/static_data.dart';
import 'package:funeral_app/utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
   final url =
        'https://5d23-39-52-40-162.ngrok-free.app/api/user/login'; 
  final BuildContext context;
  bool _loading = false;
  bool get loading => _loading;
  var token = '';
  bool navigation = false;
UserPreferences userPreferences = UserPreferences();
var errorMessage = "";
var errordetails = "";
bool status = false;

LoginProvider(this.context);
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    //errorMessage = '';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
    status = true;
    errorMessage = '';
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final String token = responseData['token'];
      userPreferences.saveToken(token);
    StaticData.token = userPreferences.getToken();           
    } else { 
     
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      errorMessage = responseData['error'];
       status = false;
    }
  }
}
