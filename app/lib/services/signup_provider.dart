import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funeral_app/utils/static_data.dart';
import 'package:funeral_app/utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class SignupProvider with ChangeNotifier {
  final BuildContext context;
  
UserPreferences userPreferences = UserPreferences();
  
  bool _loading = false;
  bool get loading => _loading;
  var token = '';
  bool navigation = false;
  var errorMessage = "";
  bool status = false;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  SignupProvider(this.context);

  Future<void> signup(
      String email, String password, String number, String fullName) async {
    errorMessage = '';
    const url =
        'https://5d23-39-52-40-162.ngrok-free.app/api/user/register'; // Replace with your actual API endpoint
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "name": fullName,
        "number": number,
        "email": email,
        "password": password
      }),
    ).timeout(const Duration(seconds: 15));

    if (response.statusCode == 201) {
      status = true;
     errorMessage = '';
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      token = responseData['token'];
      userPreferences.saveToken(token);
    StaticData.token = userPreferences.getToken(); 
    } else {
      status = false;
     final Map<String, dynamic> responseData = jsonDecode(response.body);
       errorMessage = responseData['error'];
    }
  }
}
