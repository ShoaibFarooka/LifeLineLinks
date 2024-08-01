import 'package:flutter/material.dart';

class DEMO extends StatelessWidget {
  const DEMO({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("DEMO FUNERAL APP"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/signUp');
              },
              child: const Text("SIGN UP"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/invitesPage');
              },
              child: const Text("INVITES PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/userLinksPage');
              },
              child: const Text("USER LINKS PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/syncAuth');
              },
              child: const Text("SYNC AUTH PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/syncContacts');
              },
              child: const Text("SYNC CONTACTS PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/notifications');
              },
              child: const Text("NOTIFICATIONS PAGE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/pinCodePage');
              },
              child: const Text("PIN CODE PAGE"),
            ),
          ],
        ),
      ),
    );
  }
}
