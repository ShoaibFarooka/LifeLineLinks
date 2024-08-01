import 'package:flutter/material.dart';
import 'package:funeral_app/services/user_links_provider.dart';
import 'package:funeral_app/utils/user_preferences.dart';
import 'package:funeral_app/views/user_links/user_links_model.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';


class UserLinksScreen extends StatelessWidget {
   const UserLinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
  UserPreferences userPreferences = UserPreferences();

        var userLinksProvider =
        Provider.of<UserLinksProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF171212),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'User Links',
              style: GoogleFonts.newsreader(color: Colors.white),
            ),
             ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF04A24),),
              
              onPressed: (){
              userPreferences.logout(context);
             }, child:  Text('Logout', style: GoogleFonts.newsreader(color: Colors.black)))
          ],
        ),
        backgroundColor: const Color(0xFF171212),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body:  FutureBuilder<List<Invitee>>(
        future: userLinksProvider.fetchAcceptedInvites(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('No Invites Available', style: TextStyle(color: Colors.white, fontSize: 20),));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Invites Available', style: TextStyle(color: Colors.white, fontSize: 20),));
          } else {
            List<Invitee> invites = snapshot.data!;
            return ListView.builder(
              itemCount: invites.length,
              itemBuilder: (context, index) {
                Invitee invite = invites[index];
                return ListTile(
                  title: Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                       
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            invite.name,
                            style: GoogleFonts.newsreader(color: Colors.white),
                          ),
                          Text(
                            invite.number,
                            style: GoogleFonts.newsreader(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                );});}})
    );
  }
}