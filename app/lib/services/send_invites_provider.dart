import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:funeral_app/utils/static_data.dart';
import 'package:funeral_app/utils/user_preferences.dart';
import 'package:http/http.dart' as http;

class SendInvitesProvider with ChangeNotifier {
  final BuildContext context;

  bool _loading = false;
  bool get loading => _loading;
  var token = '';
  bool navigation = false;
  UserPreferences userPreferences = UserPreferences();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  SendInvitesProvider(this.context);

  Future<void> sendInvites(
      String token, List<Map<dynamic, String>> invitees) async {
    //print(token);

    const url =
        'https://5d23-39-52-40-162.ngrok-free.app/api/invite/send-invites'; // Replace with your actual API endpoint
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${StaticData.token}',
    };
    final body = jsonEncode({'invitees': invitees});
   // print(invitees);
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {

       //print('Invites sent successfully');
       // print(response.body);
        // Handle success logic here if needed
      } else {
       // print('Failed to send invites. Status code: ${response.statusCode}');
        // Handle error logic here
      }
    } catch (e) {
      //print('Error sending invites: $e');
      // Handle network error or other exceptions
     
    }
  }
}
