import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funeral_app/utils/static_data.dart';
import 'package:funeral_app/utils/user_preferences.dart';
import 'package:funeral_app/views/requests/request_model.dart';
import 'package:http/http.dart' as http;

class InvitesProvider with ChangeNotifier {
  static const String apiUrl = 'https://5d23-39-52-40-162.ngrok-free.app/api/invite/fetch-user-pending-invites'; 
UserPreferences userPreferences = UserPreferences();
final List<Invite> _invites = [];
   List<Invite> get invites => List.unmodifiable(_invites);

  Future<List<Invite>> fetchInvites() async {
    
      //print(userPreferences.getToken());
      final response = await http.get(Uri.parse(apiUrl),
       headers: {
          'Authorization': 'Bearer ${StaticData.token}',
          'Content-Type': 'application/json', 
        },
      );
      if (response.statusCode == 200) {
      //  print("Successful");
         Map<String, dynamic> data = jsonDecode(response.body);

    List<dynamic> invitesJson = data['invites'];
    List<Invite> invites = invitesJson.map((json) => Invite.fromJson(json)).toList();
   // print(invites.first.inviteId);
    return invites;
      } else {
       // print ('Failed to load invites');
        return invites;
      }
    } 
  

  Future<void> updateStatus(String id, String status) async {
      final response = await http.patch(Uri.parse('https://5d23-39-52-40-162.ngrok-free.app/api/invite/update-user-invitee-status/$id'),
       headers: {
          'Authorization': 'Bearer ${StaticData.token}',
          'Content-Type': 'application/json', 
        },
     body: jsonEncode(<String, String>{
       'status': status
      }),
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
      //  print(response.body.toString());
      } else {
        throw Exception('Failed to load invites');
      }
    } 
}
  

