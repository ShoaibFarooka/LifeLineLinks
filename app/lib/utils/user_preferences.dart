import 'package:flutter/material.dart';
import 'package:funeral_app/views/login/login_screen.dart';
import 'package:get_storage/get_storage.dart';

class UserPreferences extends ChangeNotifier {
  static const String _keyToken = 'token';

  void saveToken(String token) async {
    final box = GetStorage();
    await box.write(_keyToken, token);
    notifyListeners();
    //print(token);
  }

  String? getToken() {
    final box = GetStorage();
    return box.read<String>(_keyToken);
    
  }

  void removeToken() {
    final box = GetStorage();
    box.remove(_keyToken);
    notifyListeners(); 
  }

  void logout(BuildContext context){
    removeToken();
     Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) =>  LoginScreen()),
    );
  }
}
