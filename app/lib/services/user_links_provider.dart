import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funeral_app/utils/static_data.dart';
import 'package:funeral_app/utils/user_preferences.dart';
import 'package:funeral_app/views/user_links/user_links_model.dart';

import 'package:http/http.dart' as http;

class UserLinksProvider with ChangeNotifier {
  static const String apiUrl = 'https://5d23-39-52-40-162.ngrok-free.app/api/invite/fetch-user-accepted-invitees'; 
UserPreferences userPreferences = UserPreferences();
List<AcceptedInvites> invites = [];




Future<List<Invitee>> fetchAcceptedInvites() async {
    try {
    //  print(userPreferences.getToken());
      final response = await http.get(Uri.parse(apiUrl),
       headers: {
          'Authorization': 'Bearer ${StaticData.token}',
          'Content-Type': 'application/json', 
        },
      );
      if (response.statusCode == 200) {
       // print("Successful");
         Map<String, dynamic> data = jsonDecode(response.body);

    List<dynamic> invitesJson = data['invitees'];
    List<Invitee> invites = invitesJson.map((json) => Invitee.fromJson(json)).toList();
  //  print(invites.first.number);
    return invites;
      } else {
        throw Exception('Failed to load invites');
      }
    } catch (e) {
      throw Exception('Failed to load invitees: $e');
    }
  }
}