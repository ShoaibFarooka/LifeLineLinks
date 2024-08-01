import 'package:flutter/material.dart';
import 'package:funeral_app/services/requests_provider.dart';
import 'package:funeral_app/utils/user_preferences.dart';
import 'package:funeral_app/views/requests/request_model.dart';
import 'package:funeral_app/views/user_links/user_links_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestsPage extends StatefulWidget {
  // final List<Contact> selectedContacts;

   const RequestsPage({super.key,});

  @override
  // ignore: library_private_types_in_public_api
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  //late List<Contact> _selectedContacts;

 InvitesProvider invitesProvider =  InvitesProvider();

  @override
  Widget build(BuildContext context) {
  UserPreferences userPreferences = UserPreferences();
  
    return Scaffold(
      backgroundColor: const Color(0xFF171212),
      appBar: AppBar(
        
        title: Row(
          children: [
            Text(
              'Pending Requests',
              style: GoogleFonts.newsreader(color: Colors.white),
            ),
            const SizedBox(width: 10,),
          
            
            InkWell(
              onTap: () {
                  Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>  const UserLinksScreen()
        ),
      );
              },
              child: Container(height: 30,width: 73,decoration: BoxDecoration(color: const Color(0xFFF04A24),borderRadius: BorderRadius.circular(15)),
              child: const Center(child: Text('Accepted',style: TextStyle(fontSize: 15),)),),
            ),
            const SizedBox(width: 5,),

            InkWell(
              onTap: () {
              userPreferences.logout(context);
                
              },
              child: Container(height: 30,width: 70,decoration: BoxDecoration(color: const Color(0xFFF04A24),borderRadius: BorderRadius.circular(15)),
              child: const Center(child: Text('Logout',style: TextStyle(fontSize: 15),)),),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF171212),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Invite>>(
        future: invitesProvider.fetchInvites(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('No Pending Requests', style: TextStyle(color: Colors.white, fontSize: 20),));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Pending Requests',style: TextStyle(color: Colors.white, fontSize: 20)));
          } else {
            List<Invite> invites = snapshot.data!;
            return ListView.builder(
              itemCount: invites.length,
              itemBuilder: (context, index) {
                Invite invite = invites[index];
                return
                 ListTile(
                  title: Row(
                    children: [
                      const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                       
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          invite.invitedBy.name,
                          style: GoogleFonts.newsreader(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                        onPressed: () async{
                         await invitesProvider.updateStatus(invite.inviteId, "rejected");
                         setState(() {
                         invitesProvider.fetchInvites();
                         });
                             showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFF04A24),
            title: Text('',style:  GoogleFonts.newsreader()),
            content: Text(("Request Rejected"),style: GoogleFonts.newsreader(),),
            actions: [
              TextButton(
                child: const InkWell(
                  child: Text('OK')),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );}
      );
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                        ),
                        onPressed: ()async {
                          await invitesProvider.updateStatus(invite.inviteId, "rejected");
                         setState(() {
                         invitesProvider.fetchInvites();                          
                         });
                           showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFF04A24),
            title: Text('',style:  GoogleFonts.newsreader()),
            content: Text(("Request Accepted"),style: GoogleFonts.newsreader(),),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );}
      );

                        },
                      ),
                    ],
                  ),
                );});}})
                );
                
                }
                }
